#!/usr/bin/env python3
import argparse
import re
import unicodedata
import yaml
import sys
import shutil
from dataclasses import dataclass, field, asdict
from pathlib import Path
from typing import List, Optional, Dict

# Versioning for pipeline auditing
__version__ = "1.1.1"

try:
    import fitz  # PyMuPDF
except ImportError:
    print("ERROR: 'pymupdf' is required. Install it with: pip install pymupdf")
    sys.exit(1)

# Custom YAML Dumper to force literal block style for multi-line strings
class QuotedDumper(yaml.SafeDumper):
    def represent_scalar(self, tag, value, style=None):
        if isinstance(value, str) and "\n" in value:
            style = "|"
        return super().represent_scalar(tag, value, style)

@dataclass
class ExerciseUnit:
    course: str = "DTU_42112"
    topic: str = "UNKNOWN"
    exercise_label: str = ""
    source_pages: List[int] = field(default_factory=lambda: [0, 0])
    problem_statement: str = ""
    reference_solution: Dict[str, str] = field(default_factory=lambda: {
        "math_formulation": "", 
        "code_reference": ""
    })
    notes: Dict[str, str] = field(default_factory=lambda: {
        "modelling_intent": "", 
        "key_constraints": "", 
        "known_difficulty": "Graduate Level"
    })
    metadata: Dict[str, str] = field(default_factory=dict)

class DTUExtractor:
    def __init__(self):
        # Matches "4.1 Jewellery Production" or "6.10 Scrap Removal"
        self.exercise_re = re.compile(r"^(\d+\.\d+)\s+(.+)$")
        self.topic_map = {
            "4": "LP",
            "6": "MILP",
            "8": "Multi-objective"
        }
        # Common header/footer patterns to ignore
        self.ignore_patterns = [
            re.compile(r"^Page \d+ of \d+$", re.I),
            re.compile(r"^DTU 42112 - Course Book", re.I),
            re.compile(r"^\d+\s*\|\s*Page$"),
            re.compile(r"^Mathematical Programming Modelling", re.I),
            re.compile(r"^\d+\s+(Linear Programming|Mixed.integer programming|Multi.objective|Stochastic).*", re.I),
            re.compile(r"^(Linear Programming|Mixed.integer programming|Multi.objective|Stochastic)\s+problems$", re.I)
        ]

    def clean_text(self, text: str) -> str:
        if not text: return ""
        text = text.replace("\r\n", "\n").replace("\r", "\n")
        # Normalize unicode (handles ligatures like 'fi', 'fl')
        text = unicodedata.normalize("NFKC", text)
        # Remove page numbers on their own lines
        text = re.sub(r"\n\s*\d+\s*\n", "\n\n", text)
        return text

    def is_noise(self, line: str) -> bool:
        """Check if a line is a header, footer, or TOC entry."""
        if not line: return True
        # TOC check: lines with many dots or trailing page numbers in TOC format
        if " . . ." in line or line.count(".") > 10 or re.search(r"\.{3,}\s*\d+$", line):
            return True
        # Header/Footer check
        for pattern in self.ignore_patterns:
            if pattern.match(line):
                return True
        return False

    def extract_units(self, pdf_path: Path) -> List[ExerciseUnit]:
        if not pdf_path.exists():
            raise FileNotFoundError(f"Input PDF not found: {pdf_path}")

        try:
            doc = fitz.open(str(pdf_path))
        except Exception as e:
            raise RuntimeError(f"Failed to open PDF {pdf_path}: {e}")

        units = []
        current_unit: Optional[ExerciseUnit] = None
        in_solution_mode = False
        in_code_mode = False
        
        try:
            for pg_idx, page in enumerate(doc, start=1):
                # Use "dict" format to preserve layout better for code blocks
                page_dict = page.get_text("dict")
                # However, for the line-by-line processing we need the text blocks
                text = self.clean_text(page.get_text("text"))
                lines = text.split("\n")
                
                for line in lines:
                    line = line.strip()
                    if self.is_noise(line):
                        continue

                    match = self.exercise_re.match(line)
                    if match:
                        # Flush previous
                        if current_unit:
                            units.append(current_unit)
                        
                        ex_num = match.group(1)
                        ex_title = match.group(2).strip()
                        chapter = ex_num.split(".")[0]
                        
                        current_unit = ExerciseUnit(
                            topic=self.topic_map.get(chapter, "UNKNOWN"),
                            exercise_label=f"Exercise {ex_num} {ex_title}",
                            source_pages=[pg_idx, pg_idx],
                            metadata={
                                "source_file": pdf_path.name,
                                "extractor_version": __version__
                            }
                        )
                        in_solution_mode = False
                        in_code_mode = False
                        continue
                    
                    if current_unit:
                        current_unit.source_pages[1] = pg_idx
                        
                        l_line = line.lower()
                        
                        # Classification markers
                        is_sol_marker = any(x in l_line for x in [
                            "optimal objective", "hint:", "pareto", "solution:", 
                            "number of variables:", "number of constraints:"
                        ])
                        # Code markers: check for line numbers followed by code-like keywords
                        is_code_marker = any(x in line for x in ["```", "@variable", "@constraint", "JuMP.", "using JuMP"]) or \
                                         re.match(r"^\d+\s+(using|@variable|@objective|@constraint|optimize!|println|Model|if|else|end)", line)
                        is_assignment_marker = "assignment" in l_line and re.search(r"assignment\s+\d+\.\d+", l_line)

                        if is_assignment_marker:
                            in_solution_mode = False
                            in_code_mode = False
                            current_unit.problem_statement += line + "\n"
                        elif is_sol_marker:
                            in_solution_mode = True
                            in_code_mode = False
                            current_unit.reference_solution["math_formulation"] += line + "\n"
                        elif is_code_marker:
                            in_code_mode = True
                            in_solution_mode = False
                            current_unit.reference_solution["code_reference"] += line + "\n"
                        else:
                            if in_code_mode:
                                current_unit.reference_solution["code_reference"] += line + "\n"
                            elif in_solution_mode:
                                current_unit.reference_solution["math_formulation"] += line + "\n"
                            else:
                                current_unit.problem_statement += line + "\n"
        finally:
            doc.close()
        
        if current_unit:
            units.append(current_unit)
            
        return units

def main():
    ap = argparse.ArgumentParser(description="Convert DTU Course PDF to structured YAML corpus.")
    ap.add_argument("input", help="Path to the input PDF file")
    ap.add_argument("--out", default="DTU_42112_Corpus", help="Output directory for YAML files")
    ap.add_argument("--force", action="store_true", help="Force deletion of output directory if it exists")
    args = ap.parse_args()

    input_path = Path(args.input).resolve()
    out_dir = Path(args.out).resolve()
    
    if out_dir.exists():
        if not args.force:
            print(f"ERROR: Output directory {out_dir} already exists. Use --force.")
            sys.exit(1)
        if out_dir == Path.home() or out_dir == Path("/"):
            print(f"ERROR: Safety violation. Refusing to delete {out_dir}")
            sys.exit(1)
        shutil.rmtree(out_dir)
    
    out_dir.mkdir(parents=True, exist_ok=True)

    extractor = DTUExtractor()
    try:
        units = extractor.extract_units(input_path)
    except Exception as e:
        print(f"FATAL ERROR: {e}")
        sys.exit(1)

    if not units:
        print("ERROR: No units extracted. Check input PDF and regex.")
        sys.exit(1)

    for unit in units:
        # Cleanup
        unit.problem_statement = unit.problem_statement.strip()
        unit.reference_solution["math_formulation"] = unit.reference_solution["math_formulation"].strip()
        unit.reference_solution["code_reference"] = unit.reference_solution["code_reference"].strip()

        # Topic refinement
        content = unit.problem_statement.lower()
        if any(x in content for x in ["binary", "integer", "milp", "branch and bound"]):
            unit.topic = "MILP"
        elif any(x in content for x in ["pareto", "multi-objective", "epsilon-constraint"]):
            unit.topic = "Multi-objective"
        elif any(x in content for x in ["stochastic", "scenario", "uncertainty"]):
            unit.topic = "Stochastic"
        elif unit.topic == "UNKNOWN":
            unit.topic = "LP"

        safe_label = re.sub(r"[^a-z0-9]+", "_", unit.exercise_label.lower()).strip("_")
        fname = f"{unit.topic}_{safe_label}.yaml"
        
        leakage_risk = "LOW"
        if len(unit.reference_solution["math_formulation"]) > 100 or \
           len(unit.reference_solution["code_reference"]) > 50:
            leakage_risk = "HIGH"
        unit.metadata["solution_leakage_risk"] = leakage_risk

        # Atomic write
        temp_file = out_dir / f".tmp_{fname}"
        final_file = out_dir / fname
        try:
            with open(temp_file, "w", encoding="utf-8") as f:
                yaml.dump(asdict(unit), f, Dumper=QuotedDumper, sort_keys=False, allow_unicode=True)
            temp_file.replace(final_file)
        except Exception as e:
            print(f"Warning: Failed to write {fname}: {e}")

    print(f"Successfully extracted {len(units)} units to {out_dir}")

if __name__ == "__main__":
    main()

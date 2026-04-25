"""Write Course_Book.txt from Course_Book.pdf (for grep / editor search).

Run from repo root:
  uv run --no-project --with pypdf python scripts/extract_course_book_text.py
"""

from pathlib import Path

from pypdf import PdfReader


def main() -> None:
    root = Path(__file__).resolve().parents[1]
    pdf = root / "Course_Book.pdf"
    out = root / "Course_Book.txt"
    reader = PdfReader(str(pdf))
    parts: list[str] = []
    for i, page in enumerate(reader.pages):
        text = page.extract_text() or ""
        parts.append(f"\n\n===== Page {i + 1} =====\n\n")
        parts.append(text)
    out.write_text("".join(parts), encoding="utf-8")
    print(f"Wrote {out} ({out.stat().st_size} bytes)")


if __name__ == "__main__":
    main()

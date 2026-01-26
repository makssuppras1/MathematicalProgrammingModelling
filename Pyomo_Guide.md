# Mathematical Modeling with Pyomo: A Beginner's Guide

This guide covers the "nuts and bolts" of building mathematical optimization models using Pyomo in Python.

---

## 1. The Core Components of a Model

Every mathematical model consists of four main building blocks:

### A. The Model Container
In Pyomo, you almost always use a `ConcreteModel`. This is where all your variables, constraints, and objectives live.
```python
import pyomo.environ as pyo
model = pyo.ConcreteModel()
```

### B. Decision Variables (`pyo.Var`)
These represent the choices the solver needs to make. 
- **Domain**: You must specify if the variable is continuous (`NonNegativeReals`), integer (`NonNegativeIntegers`), or binary (`Binary`).
```python
# Continuous variable >= 0
model.x = pyo.Var(domain=pyo.NonNegativeReals)

# Integer variable between 0 and 10
model.y = pyo.Var(domain=pyo.NonNegativeIntegers, bounds=(0, 10))
```

### C. Objective Function (`pyo.Objective`)
What are you trying to achieve? Usually maximizing profit or minimizing cost.
```python
# Maximize 3x + 5y
model.obj = pyo.Objective(expr=3*model.x + 5*model.y, sense=pyo.maximize)
```

### D. Constraints (`pyo.Constraint`)
The rules or limits of your system (e.g., "cannot use more than 100kg of wood").
```python
# 2x + y must be less than or equal to 20
model.con1 = pyo.Constraint(expr=2*model.x + model.y <= 20)
```

---

## 2. The Workflow: Build -> Solve -> Inspect

### Step 1: Solving
Pyomo doesn't solve the math itself; it sends the model to a **Solver** (like Gurobi, GLPK, or HiGHS).
```python
solver = pyo.SolverFactory('gurobi') # Or 'appsi_highs', 'glpk', etc.
results = solver.solve(model, tee=True) # tee=True shows the solver's internal log
```

### Step 2: Checking Results
Always check if the solver actually found an optimal solution before reading values.
```python
if results.solver.termination_condition == pyo.TerminationCondition.optimal:
    print("Success!")
    print("Value of x:", pyo.value(model.x))
else:
    print("Solver failed to find an optimal solution.")
```

---

## 3. Pro Tips for Learning

1.  **Linearity**: Most beginner problems are **Linear Programming (LP)**. This means you can't multiply two variables together (e.g., `model.x * model.y` is non-linear).
2.  **Indices (Sets)**: For larger problems, don't create `x1, x2, x3`. Use `pyo.Set` and index your variables:
    ```python
    model.I = pyo.Set(initialize=['Chair', 'Table'])
    model.x = pyo.Var(model.I, domain=pyo.NonNegativeReals)
    # Access via model.x['Chair']
    ```
3.  **Expressions**: If a formula is used in multiple places, use `pyo.Expression` to keep your code clean.

---

## 4. Complete "Hello World" Example
Here is the Pyomo version of the "Incredible Chairs" problem:

```python
import pyomo.environ as pyo

# 1. Initialize Model
model = pyo.ConcreteModel()

# 2. Variables
model.xA = pyo.Var(domain=pyo.NonNegativeReals) # Amount of Product A
model.xB = pyo.Var(domain=pyo.NonNegativeReals) # Amount of Product B

# 3. Objective: Maximize Profit
model.profit = pyo.Objective(expr=4*model.xA + 6*model.xB, sense=pyo.maximize)

# 4. Constraints: Resource Limits
model.labor = pyo.Constraint(expr=2*model.xA <= 14)
model.material = pyo.Constraint(expr=3*model.xB <= 15)
model.machine_time = pyo.Constraint(expr=4*model.xA + 3*model.xB <= 36)

# 5. Solve
solver = pyo.SolverFactory('gurobi')
solver.solve(model)

# 6. Display
print(f"Optimal Profit: {pyo.value(model.profit)}")
print(f"Produce A: {pyo.value(model.xA)}")
print(f"Produce B: {pyo.value(model.xB)}")
```

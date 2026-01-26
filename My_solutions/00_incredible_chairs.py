import pyomo.environ as pyo

# Create a model
model = pyo.ConcreteModel()

# Define variables using a list of indices
chairs = ['xA', 'xB']
model.x = pyo.Var(chairs, domain=pyo.NonNegativeReals)

# Define objective: Maximize 4*x['xA'] + 6*x['xB']
model.obj = pyo.Objective(expr=4 * model.x['xA'] + 6 * model.x['xB'], sense=pyo.maximize)

# Define constraints
model.c1 = pyo.Constraint(expr=2 * model.x['xA'] <= 14)
model.c2 = pyo.Constraint(expr=3 * model.x['xB'] <= 15)
model.c3 = pyo.Constraint(expr=4 * model.x['xA'] + 3 * model.x['xB'] <= 36)

# Print the model (similar to print(IC) in Julia)
model.pprint()

# Solve the model
# Note: You need a solver like 'highs', 'glpk', or 'gurobi' installed on your system
solver = pyo.SolverFactory('gurobi') 
results = solver.solve(model, tee=True)

# Print results
print(f"Termination status: {results.solver.termination_condition}")

if results.solver.termination_condition == pyo.TerminationCondition.optimal:
    print(f"Optimal objective value: {pyo.value(model.obj)}")
    for p in chairs:
        print(f"{p}: {pyo.value(model.x[p])}")
else:
    print("No optimal solution available")

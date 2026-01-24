import gurobipy as gp
from gurobipy import GRB

def test_gurobi():
    try:
        # Create a new model
        m = gp.Model("test")

        # Create variables
        x = m.addVar(lb=0, ub=GRB.INFINITY, vtype=GRB.CONTINUOUS, name="x")
        y = m.addVar(lb=0, ub=GRB.INFINITY, vtype=GRB.CONTINUOUS, name="y")

        # Set objective
        m.setObjective(x + y, GRB.MAXIMIZE)

        # Add constraints
        m.addConstr(x + 2 * y <= 4, "c0")
        m.addConstr(4 * x + 2 * y <= 12, "c1")

        # Optimize model
        m.optimize()

        if m.status == GRB.OPTIMAL:
            print(f"Optimization successful!")
            print(f"x = {x.X}")
            print(f"y = {y.X}")
            print(f"Objective value = {m.ObjVal}")
        else:
            print(f"Optimization failed with status {m.status}")

    except gp.GurobiError as e:
        print(f"Error code {e.errno}: {e}")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    test_gurobi()

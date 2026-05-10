
# Workflow: (1) sets & data  
#           (2) variables  
#           (3) objective  
#           (4) constraints
#           (5) optimize!  
#           (6) check status & print values
# Units: keep one time/money/weight unit everywhere (e.g. minutes vs hours).

using JuMP
using HiGHS


# 1. Sets (indices you will sum over)

# Examples (delete unused):
#   products = 1:5
#   months   = 1:12
#   arcs     = [(1, 2), (2, 3)]   # or use graph / two indices i,j

const PLACEHOLDER = 1:1  # remove when you have real indices


# 2. Parameters (numbers from the problem statement)

# Examples:
#   demand = [ ... ]
#   cap    = 100
#   cost   = [ ... ]           # cost[j] or cost[t, j]
#   A      = [ ... ]           # technology / recipe matrix


# 3. Model & solver

model = Model(HiGHS.Optimizer)
# model = Model(Gurobi.Optimizer)
set_optimizer_attribute(model, "output_flag", true)   # false for quiet runs


# 4. Variables (pick domains that match the story)

# Continuous, non-negative (typical LP):
#   @variable(model, x[products] >= 0)
#   @variable(model, 0 <= y[months] <= cap_y)
# Two indices:
#   @variable(model, flow[i in setI, j in setJ] >= 0)
# Integer / binary (MIP) only if required:
#   @variable(model, z[products], Bin)
#   @variable(model, n[products] >= 0, Int)

# --- PLACEHOLDER: delete this block when your real @variable lines exist -------
@variable(model, _x[PLACEHOLDER] >= 0)


# 5. Objective

# Maximize profit / minimize cost:
#   @objective(model, Max, sum(profit[j] * x[j] for j in products))
#   @objective(model, Min, sum(cost[t] * y[t] for t in months))

# --- PLACEHOLDER -------------
@objective(model, Max, sum(_x[k] for k in PLACEHOLDER))
# -----------------------------


# 6. Constraints (add one row per rule in the text)

# Capacity:        @constraint(model, sum(a[j]*x[j] for j in J) <= cap)
# Demand / supply: @constraint(model, sum(x[j] for j in J) == demand)
# Balance (time):  @constraint(model, inv[t] == inv[t-1] + prod[t] - sales[t])  # handle t==1 separately
# Hardness (LP):   ratio between bounds → multiply by total weight:
#                   h_lo = h .- h_min;  h_hi = h .- h_max
#                   sum(h_lo[i]*x[i] for i in I) >= 0;  sum(h_hi[i]*x[i] for i in I) <= 0
# Per-index cap:   @constraint(model, lim[j in J], x[j] <= u[j])
# Assignments:     @constraint(model, sum(x[i,j] for j in J) == 1)

# --- PLACEHOLDER -------------
@constraint(model, _dummy, sum(_x[k] for k in PLACEHOLDER) <= 1)
# -----------------------------

# 7. Solve & report

print(model)
println()
optimize!(model)

println("Termination status: ", termination_status(model))

if is_solved_and_feasible(model)
    println("Optimal objective: ", objective_value(model))
    # for j in products
    #     println(j, " => ", value(x[j]))
    # end
    println("Placeholder _x[1] = ", value(_x[1]))
else
    println("No optimal solution — check infeasibility / formulation.")
end

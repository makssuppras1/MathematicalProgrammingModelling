using JuMP
using HiGHS

# sets

include(joinpath(@__DIR__, "..", "Data", "WorkplanData.jl"))

demand = Demand
inconvenience = Inconvenience
tas = 1:TA
days = 1:D
periods = 1:P

# 2. Parameters (numbers from the problem statement)

# ta_demand = [ ... ]
# inconvenience = [ ... ]

# 3. Model & solver
workplan_model = Model(HiGHS.Optimizer)
set_optimizer_attribute(workplan_model, "output_flag", true)   # false for quiet runs

# 4. Variables (pick domains that match the story)
@variable(workplan_model, x[tas, days, periods] >= 0, Bin)
@variable(workplan_model, y[tas, days, periods] >= 0, Bin)

# 5. Objective
# Minimize Inconvenience:
@objective(workplan_model, Min, sum(inconvenience[ta, p, d] * x[ta, d, p] for ta in tas, d in days, p in periods))

# 6. Constraints
# i - the number of TAs assigned to a period and day must be at least the demand for that period and day
@constraint(workplan_model, demand_met[p in periods, d in days],
    sum(x[ta, d, p] for ta in tas) >= demand[p, d]
)

# ii - TAs must work exactly 52 hours
@constraint(workplan_model, must_work[ta in tas], 
    sum(x[ta, d, p] for p in periods, d in days) == 52
)
# iii - At most one start working period per day
@constraint(workplan_model, at_most_one[ta in tas, d in days], 
    sum(y[ta, d, p] for p in periods) <= 1
)

# iv - only work if you are already working or just started working
# The following constraint uses the ternary operator (conditional expression) in Julia.
# The syntax is: condition ? value_if_true : value_if_false
# Here, (p > 1 ? x[ta, d, p - 1] : 0) means:
#   - If p > 1, use x[ta, d, p - 1] (the previous period for this TA and day)
#   - If p == 1 (i.e., the first period), use 0 (since there is no previous period)
# This is needed because for the first period, there is no "previous" worked slot.
@constraint(workplan_model, work_if_started[ta in tas, d in days, p in periods], 
    x[ta, d, p] <= (p > 1 ? x[ta, d, p - 1] : 0) + y[ta, d, p]
)

# v - If you work on a day, you work at least 2 periods (at most one start slot per day)
@constraint(workplan_model, work_at_least_two[ta in tas, d in days], 
    sum(x[ta, d, p] for p in periods) >= 2 * sum(y[ta, d, p] for p in periods)
)

# 7. Solve & report
print(workplan_model)
println()
optimize!(workplan_model)

println("Termination status: ", termination_status(workplan_model))

if is_solved_and_feasible(workplan_model)
    println("Optimal objective: ", objective_value(workplan_model))
else
    println("No optimal solution — check infeasibility / formulation.")
end

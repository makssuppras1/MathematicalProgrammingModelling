using JuMP, HiGHS

# 2. Parameters (numbers from the problem statement)
include("/Users/maks/Library/CloudStorage/OneDrive-DanmarksTekniskeUniversitet/DTU/Re-exam/MathematicalProgrammingModelling/Data/FoodFestival_data.jl")

# 1. Sets (indices you will sum over)
W = S # S already defined as 25 in data file

# 3. Model
ff = Model(HiGHS.Optimizer)
#set_optimizer_attribute(ff, "output_flag", true)   # false for quiet runs

# 4. Variables (pick domains that match the story)
@variable(ff, x[1:W,1:S],Bin)
@variable(ff, y[1:W],Bin)

# 5. Objective
# Minimize number of guards hired:
@objective(ff, Min, sum(y[worker] for worker = 1:W))

# 6. Constraints (add one row per rule in the text)
# Ensure that all shifts are covered
@constraint(ff, covershifts[shift = 1:S],
            sum(x[worker, shift] for worker = 1:W) == 1
            )

# Hire workers if they work at least one shift
@constraint(ff, assignedifhired[worker = 1:W, shift = 1:S],
            x[worker, shift] <= y[worker]
            )

# Limit the same shifts
@constraint(ff, noconflicts[worker = 1:W, s1 = 1:S, s2 = 1:S; s1 < s2 && Conflict[s1, s2] == 1],
             x[worker, s1] + x[worker, s2] <= 1
             )

# 7. Solve & report
optimize!(ff)
println("Termination status: $(termination_status(ff))")

# Report results
let
println("-------------------------------------");
if termination_status(ff) == MOI.OPTIMAL
    println("RESULTS:")
    println("objective = $(round(objective_value(ff), digits=2))")
    println("solve time = $(solve_time(ff))")
else
  println("  No solution")
end
println("--------------------------------------");
end

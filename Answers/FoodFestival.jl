#************************************************************************
# FoodFestival, "Mathematical Programming Modelling" (42112)
#************************************************************************
# Intro definitions
using JuMP
using HiGHS
#************************************************************************

#************************************************************************
# PARAMETERS
include("/Users/maks/Library/CloudStorage/OneDrive-DanmarksTekniskeUniversitet/DTU/Re-exam/MathematicalProgrammingModelling/Data/FoodFestival_data.jl")

#************************************************************************


#************************************************************************
# Model
FF = Model(HiGHS.Optimizer)
W=S # maximal number of shift workers

@variable(FF, x[1:W,1:S],Bin) # if shift s is done by worker w
@variable(FF, y[1:W],Bin)     # worker w is hired

# Minimize number of workers
@objective(FF, Min,
           sum( y[w] for w=1:W)
           )

# Ensure that all shifts are worked
@constraint(FF, [s=1:S],
            sum( x[w,s] for w=1:W) == 1
            )

# Hire workers if used
@constraint(FF, [w=1:W,s=1:S],
            x[w,s] <= y[w]
            )

# Limit the same shifts
@constraint(FF, [w=1:W,s1=1:S,s2=1:S; s1<s2 && Conflict[s1,s2]==1],
            x[w,s1] + x[w,s2] <= 1 
            )

#************************************************************************

#************************************************************************
# solve
optimize!(FF)
println("Termination status: $(termination_status(FF))")
#************************************************************************

#************************************************************************
# Report results
let
println("-------------------------------------");
if termination_status(FF) == MOI.OPTIMAL
    println("RESULTS:")
    println("objective = $(objective_value(FF))")
    println("solve time = $(solve_time(FF))")
else
  println("  No solution")
end
println("--------------------------------------");
end
#************************************************************************


# ==========================================================================
# Santa's Workshop Tour — basic assignment + daily capacity
# ==========================================================================

using JuMP
using HiGHS

# Read data (defines: F, D, FamilySize[F], DayVisitCost[F,D])
# Use a repo-relative path so it works on any machine.
include(joinpath(@__DIR__, "..", "Data", "SantasWorkshopData_1000_20.jl"))

families = 1:F
days = 1:D

santa_model = Model(HiGHS.Optimizer)
set_optimizer_attribute(santa_model, "output_flag", true)

# x[f,d] = 1 if family f is assigned to day d
@variable(santa_model, x[families, days], Bin)

# Minimize assignment cost
@objective(santa_model, Min, sum(DayVisitCost[f, d] * x[f, d] for f in families, d in days))

# Each family must be assigned to exactly one day
@constraint(santa_model, assign[f in families], sum(x[f, d] for d in days) == 1)

# Daily capacity: between 125 and 300 visitors (sum of family sizes)
@constraint(santa_model, min_visitors[d in days], sum(FamilySize[f] * x[f, d] for f in families) >= 125)
@constraint(santa_model, max_visitors[d in days], sum(FamilySize[f] * x[f, d] for f in families) <= 300)

#print the model
#print(santa_model)
println()
optimize!(santa_model)

println("Termination status: ", termination_status(santa_model))
if is_solved_and_feasible(santa_model)
    println("Objective: ", objective_value(santa_model), " (book 164068)")
    #for f in families, d in days
    #    if value(x[f, d]) > 0.5
   #         println("Family ", f, " is assigned to day ", d)
   #     end
   # end
else
    println("No optimal solution available")
end
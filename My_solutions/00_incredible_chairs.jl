using JuMP
using HiGHS

chairs = [:xA, :xB]

IC = Model(HiGHS.Optimizer)
set_optimizer_attribute(IC, "output_flag", true)  # solver log (similar to tee=True)

@variable(IC, x[chairs] >= 0)

@objective(IC, Max, 4 * x[:xA] + 6 * x[:xB])

@constraint(IC, c1, 2 * x[:xA] <= 14)
@constraint(IC, c2, 3 * x[:xB] <= 15)
@constraint(IC, c3, 4 * x[:xA] + 3 * x[:xB] <= 36)

print(IC)
println()
optimize!(IC)

println("Termination status: $(termination_status(IC))")

if is_solved_and_feasible(IC)
    println("Optimal objective value: $(objective_value(IC))")
    for p in chairs
        println("$(p): $(value(x[p]))")
    end
else
    println("No optimal solution available")
end

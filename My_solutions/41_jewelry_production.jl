using JuMP
using HiGHS

types = 1:5
profit = [50, 35, 85, 60, 55]
machine_time = [
    7 0 0 9 0
    5 7 11 0 5
    0 3 8 15 3
]
assembly_time = [12, 3, 11, 9, 6]
demand = [25, 10, 12, 15, 60]
day_min = 7.5 * 60

println("Assignment 2.1 — product mix only (book optimal: €5896.15)")
JP = Model(HiGHS.Optimizer)
set_optimizer_attribute(JP, "output_flag", true)

@variable(JP, x[types] >= 0)

@objective(JP, Max, sum(profit[j] * x[j] for j in types))

@constraint(JP, m1, sum(machine_time[1, j] * x[j] for j in types) <= day_min)
@constraint(JP, m2, sum(machine_time[2, j] * x[j] for j in types) <= day_min)
@constraint(JP, m3, sum(machine_time[3, j] * x[j] for j in types) <= day_min)
@constraint(JP, asm, sum(assembly_time[j] * x[j] for j in types) <= 2 * day_min)

print(JP)
println()
optimize!(JP)

println("Termination status: $(termination_status(JP))")

if is_solved_and_feasible(JP)
    println("Optimal objective value: $(objective_value(JP))")
    for j in types
        println("x[$j]: $(value(x[j]))")
    end
else
    println("No optimal solution available")
end

println()
println("Assignment 2.2 — plus demand caps (book optimal: €5643.18)")

JP2 = Model(HiGHS.Optimizer)
set_optimizer_attribute(JP2, "output_flag", true)

@variable(JP2, y[types] >= 0)

@objective(JP2, Max, sum(profit[j] * y[j] for j in types))

@constraint(JP2, m1b, sum(machine_time[1, j] * y[j] for j in types) <= day_min)
@constraint(JP2, m2b, sum(machine_time[2, j] * y[j] for j in types) <= day_min)
@constraint(JP2, m3b, sum(machine_time[3, j] * y[j] for j in types) <= day_min)
@constraint(JP2, asmb, sum(assembly_time[j] * y[j] for j in types) <= 2 * day_min)
@constraint(JP2, dem[j in types], y[j] <= demand[j])

print(JP2)
println()
optimize!(JP2)

println("Termination status: $(termination_status(JP2))")

if is_solved_and_feasible(JP2)
    println("Optimal objective value: $(objective_value(JP2))")
    for j in types
        println("y[$j]: $(value(y[j]))")
    end
else
    println("No optimal solution available")
end

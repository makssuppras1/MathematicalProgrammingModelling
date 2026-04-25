using JuMP   # modelling language
using HiGHS  # open-source LP solver

# Table 4.5 — liters demanded each month (Jan … Dec)
demand = [15, 30, 25, 55, 75, 115, 190, 210, 105, 65, 20, 20]
months = 1:12  # time index set

production_cap = 120   # max liters brewed per month
storage_cost = 1     # € per liter in stock at month-end (charged each month)
storage_cap = 200    # max liters in basement at any month-end
initial_storage = 0  # no beer before January (problem text)

MB = Model(HiGHS.Optimizer)
set_optimizer_attribute(MB, "output_flag", true)  # print solver log

# p[m] = production in month m; s[m] = inventory at end of month m (after demand)
@variable(MB, 0 <= p[months] <= production_cap)
@variable(MB, 0 <= s[months] <= storage_cap)

# Minimize total storage cost: pay for every liter held at end of each month
@objective(MB, Min, sum(storage_cost * s[m] for m in months))

# Inventory balance: end stock = previous end stock + production − demand
@constraint(MB, balance_jan, s[1] == initial_storage + p[1] - demand[1])
@constraint(MB, balance[m = 2:12], s[m] == s[m-1] + p[m] - demand[m])

#print(MB)   # show algebraic model
println()
optimize!(MB)  # run HiGHS

println("Termination status: $(termination_status(MB))")

if is_solved_and_feasible(MB)
    println("Optimal objective value: $(objective_value(MB))  (book: €560.0)")
    for m in months
        println("p[$m] = $(value(p[m])), s[$m] = $(value(s[m]))")
    end
else
    println("No optimal solution available")
end

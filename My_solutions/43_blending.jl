using JuMP   # modelling language
using HiGHS  # LP solver (sufficient here: model is linear after hardness linearization)

# --- Problem 4.3 Blending 1 (course book) ------------------------------------
# Blend five raw oils into one final cooking oil; maximize net profit (£/ton).

# Table 4.6 / 4.7 — index order: VEG 1, VEG 2, OIL 1, OIL 2, OIL 3
oils = 1:5
names = ["VEG 1", "VEG 2", "OIL 1", "OIL 2", "OIL 3"]

c = [110, 120, 130, 110, 115]   # £ per ton purchased / refined (Table 4.7)
h = [8.8, 6.1, 2.0, 4.2, 5.0]  # hardness per ton of each raw oil (linear blend)

veg_cap = 200       # max tons of vegetable oils (VEG1 + VEG2) per month
nonveg_cap = 250    # max tons of non-vegetable oils (OIL1+OIL2+OIL3) per month
price = 150         # £ per ton of final product sold

# Hardness of blend must lie in [3, 6]. With amounts x[i] (tons), total tons = sum(x).
# Weighted hardness = sum(h[i]*x[i]) / sum(x). That ratio is NON-linear in JuMP.
# Multiply by sum(x) (ok for LP since x >= 0 and optimum has sum(x) > 0):
#   3 * sum(x) <= sum(h[i]*x[i]) <= 6 * sum(x)
# Rearrange to two linear rows:
#   sum((h[i]-3)*x[i]) >= 0   and   sum((h[i]-6)*x[i]) <= 0

blend = Model(HiGHS.Optimizer)
set_optimizer_attribute(blend, "output_flag", true)

# x[i] = tons of raw oil i used in the blend this month (= tons of final product)
@variable(blend, x[oils] >= 0)

# Net profit = revenue − raw cost = sum_i (price - c[i]) * x[i]
@objective(blend, Max, sum((price - c[i]) * x[i] for i in oils))

# Refining capacity: separate caps for vegetable vs non-vegetable lines
@constraint(blend, veg_line, x[1] + x[2] <= veg_cap)
@constraint(blend, nonveg_line, x[3] + x[4] + x[5] <= nonveg_cap)

# Linearized hardness bounds (see comment above)
@constraint(blend, hard_min, sum((h[i] - 3) * x[i] for i in oils) >= 0)
@constraint(blend, hard_max, sum((h[i] - 6) * x[i] for i in oils) <= 0)

print(blend)
println()
optimize!(blend)

println("Termination status: $(termination_status(blend))")

if is_solved_and_feasible(blend)
    println("Optimal net profit (£): $(objective_value(blend))  (book: £17592.59)")
    for i in oils
        println("  $(names[i]): $(value(x[i])) tons")
    end
else
    println("No optimal solution available")
end

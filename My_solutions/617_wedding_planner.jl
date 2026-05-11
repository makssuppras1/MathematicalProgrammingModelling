
# WeddingPlanner Assignment5 , "Mathematical Programming Modelling" (42112)
using JuMP, HiGHS

# PARAMETERS
include("/Users/maks/Library/CloudStorage/OneDrive-DanmarksTekniskeUniversitet/DTU/Re-exam/MathematicalProgrammingModelling/Data/WeddingData20.jl") # small dataset
println("Runing WeddingPlanner with $(G) guests, $(T) tables with capacity $(TableCap)")

# Model
wp = Model(HiGHS.Optimizer)

# 1 if guest g is sitting at table T
@variable(wp, x[g = 1:G, t = 1:T], Bin)

# 1 if guest g1 and guest g2 are both sitting at table T, symmetric
@variable(wp, 0 <= y[g1 = 1:G, g2 = 1:G, t = 1:T] <= (g1 < g2 ? 1 : 0))

# excess males at table t
@variable(wp, m[t = 1:T] >= 0)

# excess females at table t
@variable(wp, f[t = 1:T] >= 0)

# guest g is missing known people
@variable(wp, k[g = 1:G] >= 0)

# Minimize sum of different objectives
@objective(
	wp,
	Min,
	# minimize the negative total shared intersts
	-sum(SharedInterests[g1, g2] * y[g1, g2, t] for t = 1:T, g1 = 1:G, g2 = 1:G if g1 < g2)
	# minimize unbalanced male and females
	+ sum(m[t] + f[t] for t = 1:T)
	# minimize the no of guests not knowing enough at the table
	+ sum(k[g] for g = 1:G),
)

# all guests has to sit at a table
@constraint(wp, [g = 1:G], sum(x[g, t] for t = 1:T) == 1)

# dont exceed the number of persons at a table
@constraint(wp, [t = 1:T], sum(x[g, t] for g = 1:G) <= TableCap)

# couples should sit at the same table
@constraint(wp, [g1 = 1:G, g2 = 1:G, t = 1:T; Couple[g1, g2] == 1], x[g1, t] == x[g2, t])

# if there are too many males at at table, penalty
@constraint(
	wp,
	[t = 1:T],
	sum(Male[g] * x[g, t] - Female[g] * x[g, t] for g = 1:G) <= m[t] + 2,
)

# if there are too many females at at table, penalty
@constraint(
	wp,
	[t = 1:T],
	sum(Female[g] * x[g, t] - Male[g] * x[g, t] for g = 1:G) <= f[t] + 2,
)

# limit y, can only become 1 if g1 and g2 are at the same table
@constraint(wp, [g1 = 1:G, g2 = 1:G, t = 1:T; g1 < g2], y[g1, g2, t] <= x[g1, t])

# limit y, can only become 1 if g1 and g2 are at the same table
@constraint(wp, [g1 = 1:G, g2 = 1:G, t = 1:T; g1 < g2], y[g1, g2, t] <= x[g2, t])

# if a person sits at a table, penalty if not enough known people
@constraint(
	wp,
	[g = 1:G, t = 1:T],
	k[g] - 3 * x[g, t] + sum(Know[g, g1] * (y[g, g1, t] + y[g1, g, t]) for g1 = 1:G) >= 0,
)

# solve
optimize!(wp)
println("Termination status: $(termination_status(wp))")

# Report results
println("-------------------------------------")
if termination_status(wp) == MOI.OPTIMAL
	println("RESULTS:")
	println("objective = $(objective_value(wp))")
	for t = 1:T
		total_shared_int_table = 0
		total_not_know_at_table = 0
		print("Table $(t) : ")
		for g1 = 1:G
			sh_g1 = 0
			if value(x[g1, t]) == 1
				total_not_know_at_table += value(k[g1])
				print(" $(g1) ")
				for g2 = 1:G
					if value(y[g1, g2, t]) == 1
						sh_g1 += SharedInterests[g1, g2]
					end
				end
				total_shared_int_table += sh_g1
			end
		end
		println("")
		println(
			"\nPenalties: (Shared interests: $(-total_shared_int_table), Gender: $((value(m[t]) + value(f[t]))), Know: $(total_not_know_at_table))",
		)
	end
else
	println(" No solution")
end
println("--------------------------------------")
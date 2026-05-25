using JuMP, HiGHS

Months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
Beers  = ["TSP-Stout","Knapsack-Dark","SetPartioning-Light"]
M = length(Months); B = length(Beers)

BrewCap = 120; StoreCap = 300; Cost = 0.1
Demand = [35 20 15 45 25 65 40 50 35 85 50 55;
          15 10 20 15 15 55 90 80 25 45  5 30;
           5 20 20 35 35 80 60 30 35 20 20 40]
InitialStorage = [25 65 75]

mb2 = Model(HiGHS.Optimizer)
set_silent(mb2)

@variable(mb2, 0 <= x[1:B, 1:M])          # production
@variable(mb2, 0 <= s[1:B, 1:M])          # storage at end of month
@variable(mb2, y[1:B, 1:M], Bin)           # which beer brewed this month

@objective(mb2, Min, sum(Cost*s[b,m] for b=1:B, m=1:M))

# Inventory balance
@constraint(mb2, [b=1:B, m=1:M],
    s[b,m] == (m > 1 ? s[b,m-1] : InitialStorage[b]) + x[b,m] - Demand[b,m])

# Production link + capacity (one constraint does both)
@constraint(mb2, [b=1:B, m=1:M], x[b,m] <= BrewCap * y[b,m])

# Total storage capacity
@constraint(mb2, [m=1:M], sum(s[b,m] for b=1:B) <= StoreCap)

# At most one beer type per month
@constraint(mb2, [m=1:M], sum(y[b,m] for b=1:B) <= 1)

optimize!(mb2)
println("Objective: ", objective_value(mb2))  # 192.5
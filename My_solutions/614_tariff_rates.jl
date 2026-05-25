using JuMP, HiGHS

H = 5; P = 3
NG      = [12, 10, 5]
NHP     = [6, 3, 6, 3, 6]
PDEM    = [15000, 30000, 25000, 40000, 27000]
MINL    = [850, 1250, 1500]
MAXL    = [2000, 1750, 4000]
MINC    = [1000, 2600, 3000]
PC      = [2, 1.3, 3]
STARTC  = [2000, 1000, 500]

tr = Model(HiGHS.Optimizer);
set_silent(tr)

@variable(tr, 0 <= nRun[p=1:P, h=1:H] <= NG[p], Int)  # generators running
@variable(tr, prod[1:P, 1:H] >= 0)                      # total production (MW)
@variable(tr, nStart[1:P, 1:H] >= 0)                    # generators started up

@objective(tr, Min,
    sum(MINC[p] * NHP[h] * nRun[p,h]  for p=1:P, h=1:H) +
    sum(PC[p]   * NHP[h] * (prod[p,h] - MINL[p]*nRun[p,h])  for p=1:P, h=1:H) +
    sum(STARTC[p] * nStart[p,h]  for p=1:P, h=1:H))

# Min and max production per running generator
@constraint(tr, [p=1:P, h=1:H], prod[p,h] >= MINL[p]*nRun[p,h])
@constraint(tr, [p=1:P, h=1:H], prod[p,h] <= MAXL[p]*nRun[p,h])

# Meet demand
@constraint(tr, [h=1:H], sum(prod[p,h] for p=1:P) >= PDEM[h])

# Startup counting — cyclic: period 0 = period H
@constraint(tr, [p=1:P, h=1:H],
    nStart[p,h] >= nRun[p,h] - (h > 1 ? nRun[p,h-1] : nRun[p,H]))

# 15% reserve capacity (Assignment 14.1 only — remove for 14.2)
@constraint(tr, [h=1:H], sum(MAXL[p]*nRun[p,h] for p=1:P) >= 1.15*PDEM[h])

optimize!(tr)
println("Total cost: ", objective_value(tr))  # 988,540
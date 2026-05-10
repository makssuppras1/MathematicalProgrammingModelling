
# Tennis 6.12 — Problem Q4 (Assignment 12.4), same as Answers/TennisANS.pdf / Tennis4.jl:
# start and stop may differ, but only on outside intersections (not B1,C1,D1,B2,C2,D2).

using JuMP
using HiGHS

# PARAMETERS (indices 1–12 as in TennisANS)
Points = ["A0", "B0", "D0", "E0", "B1", "C1", "D1", "A2", "B2", "C2", "D2", "E2"]
P = length(Points)

x_pos = [0 4.5 31.5 36 4.5 18 31.5 0 4.5 18 31.5 36]
y_pos = [0 0 0 0 18 18 18 39 39 39 39 39]

Distance = zeros(P, P)
for p in 1:P, pp in 1:P
    Distance[p, pp] =
        sqrt((x_pos[p] - x_pos[pp])^2 + (y_pos[p] - y_pos[pp])^2)
end

Lines = zeros(Int8, P, P)
Lines[1, 2] = 1
Lines[1, 8] = 1
Lines[2, 5] = 1
Lines[2, 3] = 1
Lines[3, 4] = 1
Lines[3, 7] = 1
Lines[4, 12] = 1
Lines[5, 6] = 1
Lines[5, 9] = 1
Lines[6, 7] = 1
Lines[6, 10] = 1
Lines[7, 11] = 1

# MODEL
tennis = Model(HiGHS.Optimizer)
set_optimizer_attribute(tennis, "output_flag", false)

@variable(tennis, x[1:P, 1:P], Bin)
@variable(tennis, s[1:P], Bin)
fix.(s[[5, 6, 7, 9, 10, 11]], 0; force = true)
@variable(tennis, e[1:P], Bin)
fix.(e[[5, 6, 7, 9, 10, 11]], 0; force = true)

@objective(tennis, Min, sum(Distance[p, pp] * x[p, pp] for p in 1:P, pp in 1:P))

@constraint(
    tennis,
    [p = 1:P],
    sum(x[p, pp] for pp in 1:P) - sum(x[pp, p] for pp in 1:P) == s[p] - e[p],
)
@constraint(tennis, sum(s[p] for p in 1:P) == 1)
@constraint(tennis, sum(e[p] for p in 1:P) == 1)
@constraint(tennis, [p = 1:P, pp = 1:P], x[p, pp] + x[pp, p] >= Lines[p, pp])

optimize!(tennis)

println("Termination status: ", termination_status(tennis))
println("-------------------------------------")
if termination_status(tennis) == MOI.OPTIMAL
    println("RESULTS:")
    println("objective = ", objective_value(tennis))
    println("x = ", value(x))
    println("s = ", value(s))
    println("e = ", value(e))
else
    println(" No solution")
end
println("--------------------------------------")

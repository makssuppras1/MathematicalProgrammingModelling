using JuMP, HiGHS

include("../Data/SIP_data.jl")

# Items = 100
# Buyers = 15
# Minutes = 480

m1 = Model(HiGHS.Optimizer)
set_silent(m1)
 
@variable(m1, x[1:I], Bin)
 
@objective(m1, Max, sum(Price[i] * x[i] for i = 1:I))

@constraint(m1, sum(PrintTime[i]  * x[i] for i = 1:I) <= Minutes)  # 3D printer
@constraint(m1, sum(PolishTime[i] * x[i] for i = 1:I) <= Minutes)  # polisher
@constraint(m1, sum(PaintTime[i]  * x[i] for i = 1:I) <= Minutes)  # painter
 
optimize!(m1)
 
println("===== Assignment 1 =====")
println("Status  : ", termination_status(m1))
println("Revenue : ", round(objective_value(m1), digits=0)," DKK")
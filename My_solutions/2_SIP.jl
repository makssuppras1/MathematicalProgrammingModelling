using JuMP, HiGHS

include("../Data/SIP_data.jl")

# Items = 100
# Buyers = 15
# Minutes = 480

TransportCost = 50

m2 = Model(HiGHS.Optimizer)
set_silent(m2)
 
@variable(m2, x[1:I], Bin) # 1 if item i is produced
@variable(m2, y[1:B],  Bin) # 1 if buyer b is served
 
@objective(m2, Max,
    sum(Price[i] * x[i] for i = 1:I) - TransportCost * sum(y[b] for b = 1:B))
 
@constraint(m2, sum(PrintTime[i]  * x[i] for i = 1:I) <= Minutes)
@constraint(m2, sum(PolishTime[i] * x[i] for i = 1:I) <= Minutes)
@constraint(m2, sum(PaintTime[i]  * x[i] for i = 1:I) <= Minutes)
 
# Activation link:
@constraint(m2, [i = 1:I], x[i] <= y[BuyerId[i]])
 
optimize!(m2)
 
println("===== Assignment 2 =====")
println("Status          : ", termination_status(m2))
println("Net objective   : ", round(objective_value(m2), digits=0))

println("Items:")
for i in 1:I
    if value(x[i]) > 0.5
        println("Item ", i)
    end
end

println("Buyers:")
for b in 1:B
    if value(y[b]) > 0.5
        println("Buyer ", b)
    end
end
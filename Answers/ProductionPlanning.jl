module ProductionPlanning
using HiGHS
using JuMP


# Define the weights and values of the items
sockTypes = 2
stitchingTime = [2 4]
weavingTime = [1 2]
machineHoursWeave = [50*60 80*60]
machineHoursStitch = [160*60]

minProduction = [1000 500] #min nr of socks
profit =[18 70]


# Create the HiGHS model
model = Model(HiGHS.Optimizer)

# Define the decision variables
@variable(model, 0<=x[1:sockTypes]) #nr socks regular/Yoga


# Define the objective function (maximize total value)
@objective(model, Max, sum(profit[i] * x[i] for i in 1:sockTypes))

# Define the weight constraint (total weight must not exceed max_weight)
@constraint(model, contrsWeaveRegular[i=1:sockTypes], x[i]*weavingTime[i] <= machineHoursWeave[i])
@constraint(model, constrSticth, sum( x[i]*stitchingTime[i] for i=1:sockTypes) <= machineHoursStitch[1])
@constraint(model, constrMinProduction[i=1:sockTypes], x[i] >= minProduction[i])

# Solve the model
optimize!(model)

# Get the results
println("Optimal value: ", objective_value(model))
println("Items to include in the knapsack:")
for i in 1:sockTypes
        println("Item ", i,  ", nr socks = ", value(x[i]))
end

end


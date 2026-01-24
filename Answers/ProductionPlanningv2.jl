module ProductionPlanning
using HiGHS
using JuMP
using Plots

function main()
    sockTypes, stitchingTime, weavingTime, machineHoursWeave, machineHoursStitch, minProduction, profit = createData()
    myPlot,x1RegSocks, x2YogaSocks = plotTheFeasibleRegion(sockTypes, stitchingTime, weavingTime, machineHoursWeave, machineHoursStitch, minProduction, profit)  
    savefig(myPlot, "C:/Users/evdh/OneDrive - Danmarks Tekniske Universitet/Teaching/MathModelling/Julia/productionPlanningFeasibleRegion.png")
    myPlot2=addObjectiveLines(myPlot, profit, x1RegSocks, x2YogaSocks) 
    savefig(myPlot2, "C:/Users/evdh/OneDrive - Danmarks Tekniske Universitet/Teaching/MathModelling/Julia/productionPlanningFeasibleRegionObjFunctionLevels.png")
    
    optimizeProductionPlanning(sockTypes, stitchingTime, weavingTime, machineHoursWeave, machineHoursStitch, minProduction, profit)
end

function plotTheFeasibleRegion(sockTypes, stitchingTime, weavingTime, machineHoursWeave, machineHoursStitch, maxProduction, profit)
    
    maxRegSocksWeave = machineHoursWeave[1]/weavingTime[1]
    maxYogaSocksWeave = machineHoursWeave[2]/weavingTime[2]
    
    x1RegSocks  = 0:1:maxRegSocksWeave*1.2
    x2YogaSocks = 0:1:maxYogaSocksWeave*1.2

   myPlot =  plot(maxProduction[1].*ones(length(x2YogaSocks),1), x2YogaSocks , label="MinRegSocks", xlabel="Produced Regular Socks", ylabel="Produced Yoga Socks", title="Feasible Region Production Planning", ylimits=(0,maxRegSocksWeave*1.45),
    xlimits=(0,maxRegSocksWeave*1.2))
    plot!(x1RegSocks, maxProduction[2]*ones(length(x1RegSocks),1), label="MinYogaSocks")

    plot!(((machineHoursWeave[1])/weavingTime[1]).*ones(length(x2YogaSocks),1), x2YogaSocks , label="Weave-RegSocks")
    plot!(x1RegSocks, machineHoursWeave[2]/weavingTime[2]*ones(length(x1RegSocks),1), label="Weave-YogaSocks")

    plot!((1/stitchingTime[1]).*(machineHoursStitch[1]*ones(length(x2YogaSocks),1)-(x2YogaSocks*stitchingTime[2])), x2YogaSocks , label="StitchLimit" )
    #plot!(x1RegSocks, (1/stitchingTime[2]).*(machineHoursStitch[1]*ones(length(x1RegSocks),1)-(x1RegSocks*stitchingTime[1])), label="StitchYoga", xlabel="regSocks", ylabel="YogaSocks", title="Feasible Region for Knapsack Problem")
    display(myPlot)   
    return myPlot,x1RegSocks, x2YogaSocks
end

function addObjectiveLines(myPlot, profit,  x1RegSocks, x2YogaSocks)
    
# Define a range of red shades
reds = [RGB(1.0, 0.0, 0.0), RGB(0.8, 0.0, 0.0), RGB(0.6, 0.0, 0.0), RGB(0.4, 0.0, 0.0), RGB(0.2, 0.0, 0.0)]

   
    for level in 140000:10000:170000  
        i = Int64((level-130000)/10000)
        plot!(x1RegSocks, (1/profit[2])*(level*ones(length(x1RegSocks), 1) - profit[1].*x1RegSocks), 
        label="ProfitLevel$level", color=reds[i])
    #    plot!( x1RegSocks, (1/profit[2])*(level*ones(length(x1RegSocks),1) - profit[1].*x1RegSocks), label="ProfitLevel$level", palette = :black)
    end
    display(myPlot)
    return myPlot
end

function createData()
# Define the weights and values of the items
sockTypes = 2
stitchingTime = [2 4]
weavingTime = [1 2]
machineHoursWeave = [50*60 80*60]
machineHoursStitch = [160*60]

minProduction = [1000 500] #min nr of socks
profit =[18 70]
return sockTypes, stitchingTime, weavingTime, machineHoursWeave, machineHoursStitch, minProduction, profit
end

function optimizeProductionPlanning(
    sockTypes,
    stitchingTime,
    weavingTime,
    machineHoursWeave,
    machineHoursStitch,
    minProduction,
    profit)
    

# Create the HiGHS model
model = Model(HiGHS.Optimizer)

# Define the decision variables
@variable(model, 0<=x[1:sockTypes]) #nr socks regular/Yoga


# Define the objective function (maximize total value)
@objective(model, Max, sum(profit[i] * x[i] for i in 1:sockTypes))

# Define the machine time constraints (total production time may not exceed available machine time)
@constraint(model, contrsWeaveRegular[i=1:sockTypes], x[i]*weavingTime[i] <= machineHoursWeave[i])
@constraint(model, constrStitch, sum( x[i]*stitchingTime[i] for i=1:sockTypes) <= machineHoursStitch[1])

# Define the minimum production constraints
@constraint(model, constrMaxProduction[i=1:sockTypes], x[i] >= minProduction[i])

# Solve the model
optimize!(model)

# Get the results
println("Optimal value: ", objective_value(model))
println("Items to include in the knapsack:")
for i in 1:sockTypes
        println("Item ", i,  ", nr socks = ", value(x[i]))
end
end

main()

end


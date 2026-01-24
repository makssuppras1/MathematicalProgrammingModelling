module RSNorm
using JuMP, Gurobi
#using ..RSdata
include("RollingStockScheduling-Data.jl")
  
nrArcs = size(Arcs,1);
rideArcsRow_indices = findall(x -> x == 2, Arcs[:, 3])
nrRideArcs= length(rideArcsRow_indices);

rsCosts =218 .*rsCosts #Making sure RsCosts are higher, multiplied by highest nr of second class seats per train unit. Multiple good answers here
cStartupCost = 10
cPersonalCost= 5
bigMparkedUnits = 20 
cSeatShortage=1
println("Nr of stations: ", nrStations)

rsNom = Model(Gurobi.Optimizer) #CPX_PARAM_SIMDISPLAY=0))#CPX_PARAM_MIPDISPLAY=0)) #CPX_PARAM_SIMDISPLAY=0
#####################
# Decision variables. Types: Int or Bin, no comment needed for continuous
########################
@variable(rsNom, x[1:rsNrTypes, 1: nrArcs], lower_bound=0, Int) #purchasing RsType
@variable(rsNom, d[1: nrRideArcs, 1:2], lower_bound=0, Int) #NEW: demand unsatisfied per arc and class (only for ride arcs)
# Minimize costs by summing costs of overnight arcs (3rd column is 1)
########################
@objective(rsNom, Min, sum(rsCosts[i]*x[i,j] for i=1:rsNrTypes, j=1:nrArcs if Arcs[j,3]==1) + cSeatShortage*sum(d[i,j] for i=1:nrRideArcs, j=1:2) )
#NEW: added value for seat shortages
#####################
### Constraints
########################
#Flow conservation for both types of RS units (seperate constraint per rs type)
@constraint(rsNom, cFlowConservation[i=1:rsNrTypes, j=1:nrNodes], sum(x[i,k] for k=1:nrArcs if Arcs[k,1] == j) -  sum(x[i,k] for k=1:nrArcs if Arcs[k,2] == j) == 0)

#Max composition length for driving arcs, demand satisfaction FC and SC:
@constraint(rsNom, cMaxCompLength[j=1:nrRideArcs],  sum(x[i,rideArcsRow_indices[j]]*rsUnits[i] for i=1:rsNrTypes ) <= maxCompLength)

#New: allowing seat shortages
@constraint(rsNom, cSeatsFCh[j=1:nrRideArcs], d[j,1] + sum(x[i,rideArcsRow_indices[j]]*rsCapFC[i] for i=1:rsNrTypes ) >= Arcs[rideArcsRow_indices[j],4])
@constraint(rsNom, cSeatsSC[j=1:nrRideArcs], d[j,2] + sum(x[i,rideArcsRow_indices[j]]*rsCapSC[i] for i=1:rsNrTypes ) >= Arcs[rideArcsRow_indices[j],5])

#Write model to file
write_to_file(rsNom, "C:/Users/evdh/OneDrive - Danmarks Tekniske Universitet/Teaching/MathModelling/RollingStockSchedulingT5.lp")

optimize!(rsNom)

#Print results
valuesX = value.(x);
objVal = objective_value(rsNom)
println("Objective value: ", objVal )
println("TypeIII: ", sum(valuesX[1,j] for j=1:nrArcs if Arcs[j,3]==1))
println("TypeIV: ", sum(valuesX[2,j] for j=1:nrArcs if Arcs[j,3]==1))
for j=1:nrArcs
    if(Arcs[j,3]==1)
    println("Arc", Arcs[j,:], " x: ", valuesX[:,j])
    end
end

println("Seat shortage total: ", sum(value.(d)))
println("Seat shortage first class: ", sum(value.(d[:,1])))
println("Seat shortage second class: ", sum(value.(d[:,2])))
println("Seat shortages per arc:")
for j=1:nrArcs
    if(Arcs[j,3]==2)
        fcDemandSat = rsCapFC[1]*valuesX[1,j] + rsCapFC[2]*valuesX[2,j] - Arcs[j,4]
        scDemandSat = rsCapSC[1]*valuesX[1,j] + rsCapSC[2]*valuesX[2,j] - Arcs[j,5]
        if (fcDemandSat<0 || scDemandSat<0)
            println("Arc", Arcs[j,:], " x: ", valuesX[:,j], "fcDemand diff: ", fcDemandSat , "scDemandSat: ", scDemandSat)
        end
    end
end


end

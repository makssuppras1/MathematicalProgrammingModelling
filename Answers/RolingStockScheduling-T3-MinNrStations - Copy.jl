module RSNorm
using JuMP, Gurobi
include("RollingStockScheduling-Data.jl")
  
nrArcs = size(Arcs,1);
overnightArcsRow_indices = findall(x -> x == 1, Arcs[:, 3])
nrStations = length(overnightArcsRow_indices);
rsCosts =10 .*rsCosts #Making sure RsCosts are higher
bigMparkedUnits = 20 
println("Nr of stations: ", nrStations)

rsNom = Model(Gurobi.Optimizer) #CPX_PARAM_SIMDISPLAY=0))#CPX_PARAM_MIPDISPLAY=0)) #CPX_PARAM_SIMDISPLAY=0
#####################
# Decision variables. Types: Int or Bin, no comment needed for continuous
########################
@variable(rsNom, x[1:rsNrTypes, 1: nrArcs], lower_bound=0, Int) #purchasing RsType
@variable(rsNom, y[1: nrStations], lower_bound=0, Int) #NEW: variable parking per station 

# Minimize costs by summing costs of overnight arcs (3rd column is 1)
########################
#NEW: added value to objective value for parking at stations
@objective(rsNom, Min, sum(rsCosts[i]*x[i,j] for i=1:rsNrTypes, j=1:nrArcs if Arcs[j,3]==1) + sum(y[s] for s=1:nrStations) )
#@objective(rsNom, Min, sum(rsCosts[i]*x[i,j] for i=1:rsNrTypes, j=1:nrArcs if Arcs[j,3]==1) + sum(y[i,s] for s=1:nrStations, i=1:rsNrTypes) )(Different solutions can be generated when you penalize seperate per RS type)

#####################
### Constraints
########################
#NEW: setting value of y
@constraint(rsNom, cParkAtStations[i=1:rsNrTypes, k=1:nrStations],  x[i,overnightArcsRow_indices[k]] <= bigMparkedUnits*y[k])
#@constraint(rsNom, cParkAtStations[i=1:rsNrTypes, k=1:nrStations],  x[i,overnightArcsRow_indices[k]] <= bigMparkedUnits*y[i,k])#per RS type

#Flow conservation for both types of RS units (seperate constraint per rs type)
@constraint(rsNom, cFlowConservation[i=1:rsNrTypes, j=1:nrNodes], sum(x[i,k] for k=1:nrArcs if Arcs[k,1] == j) -  sum(x[i,k] for k=1:nrArcs if Arcs[k,2] == j) == 0)

#Max composition length for driving arcs, demand satisfaction FC and SC:
print("MaxCompLength ", maxCompLength)
 cnt=0;
for j=1:nrArcs
    if(Arcs[j,3]==2)
        global cnt=cnt+1;
        CmaxLenght  = string("CmaxLenght" , cnt)
        @constraint(rsNom,  sum(x[i,j]*rsUnits[i] for i=1:rsNrTypes ) <= maxCompLength)
        @constraint(rsNom, sum(x[i,j]*rsCapFC[i] for i=1:rsNrTypes ) >= Arcs[j,4])
        @constraint(rsNom, sum(x[i,j]*rsCapSC[i] for i=1:rsNrTypes ) >= Arcs[j,5])
    end
end

#Write model to file
write_to_file(rsNom, "RollingStockSchedulingT3.lp")

optimize!(rsNom)
valuesX = value.(x);
objVal = objective_value(rsNom)
println("Objective value: ", objVal )
println("TypeII: ", sum(valuesX[1,j] for j=1:nrArcs if Arcs[j,3]==1))
println("TypeIV: ", sum(valuesX[2,j] for j=1:nrArcs if Arcs[j,3]==1))
for j=1:nrArcs
    if(Arcs[j,3]==1)
    println("Arc", Arcs[j,:], " x: ", valuesX[:,j])
    end
end

#Just a check if there are any demand shortages
for j=1:nrArcs
    if(Arcs[j,2]==1)
        fcDemandSat = rsCapFC[1]*valuesX[1,j] + rsCapFC[2]*valuesX[2,j] - Arcs[j,4]
        scDemandSat = rsCapSC[1]*valuesX[1,j] + rsCapSC[2]*valuesX[2,j] - Arcs[j,5]
        if (fcDemandSat<0 || scDemandSat<0)
            println("Arc", Arcs[j,:], " x: ", valuesX[:,j], "fcDemand diff: ", fcDemandSat , "scDemandSat: ", scDemandSat)
        end
    end
end


end

module RSNorm
using JuMP, Gurobi
#using ..RSdata
include("RollingStockScheduling-Data.jl")
  
nrArcs = size(Arcs,1);
rsNom = Model(Gurobi.Optimizer) #CPX_PARAM_SIMDISPLAY=0))#CPX_PARAM_MIPDISPLAY=0)) #CPX_PARAM_SIMDISPLAY=0
#####################
# Decision variables. Types: Int or Bin, no comment needed for continuous
########################
@variable(rsNom, x[1:rsNrTypes, 1: nrArcs], lower_bound=0, Int) #purchasing RsType

#####################
# Minimize costs by somming costs of overnight arcs (3rd column is 1)
########################
@objective(rsNom, Min, sum(rsCosts[i]*x[i,j] for i=1:rsNrTypes, j=1:nrArcs if Arcs[j,3]==1) )

#####################
### Constraints
########################
#Flow conservation for both types of RS units (seperate constraint per rs type)
@constraint(rsNom, cFlowConservation[i=1:rsNrTypes, j=1:nrNodes], sum(x[i,k] for k=1:nrArcs if Arcs[k,1] == j) -  sum(x[i,k] for k=1:nrArcs if Arcs[k,2] == j) == 0)

#Max composition length for driving arcs, demand satisfaction FC and SC:
@constraint(rsNom, cMaxCompLength[j=1:nrArcs; Arcs[j,3]==2 ], sum(x[i,j]*rsUnits[i] for i=1:rsNrTypes ) <= maxCompLength)
@constraint(rsNom, cDemandFC[j=1:nrArcs; Arcs[j,3]==2 ],sum(x[i,j]*rsCapFC[i] for i=1:rsNrTypes ) >= Arcs[j,4])
@constraint(rsNom, cDemandSC[j=1:nrArcs; Arcs[j,3]==2 ], sum(x[i,j]*rsCapSC[i] for i=1:rsNrTypes ) >= Arcs[j,5])
    

write_to_file(rsNom, "C:/Users/evdh/OneDrive - Danmarks Tekniske Universitet/Teaching/MathModelling/RollingStockSchedulingNominalRSModel.lp")

#print results
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

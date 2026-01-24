module RSNorm
using JuMP, Gurobi #, MathOptFormat
include("RSdata2020.jl")


nrArcs = size(Arcs,1);
arcCost=rsCosts[1]/(nrArcs*(1/(20*5*10))) #cost per arc per day. 
#Without this cost it I have 20 units, and there are 5 days, so it is a a rough division of the expected nr of arcs per unit. But buying a new unit for some new arcs doesn't make any sense, so I made it 10 times smaller than the expected nr of arcs per unit per day
#It might have been a good move to multiply the RS cost instead by 100 or so, to prevent using such small nrs for arc cost
rsNom = Model(Gurobi.Optimizer) 
#####################
# Decision variables. Types: Int or Bin, no comment needed for continuous
########################
@variable(rsNom, x[1:rsNrTypes, 1: nrArcs, 1:scenNr], lower_bound=0, Int) #circulation RsType per scen
@variable(rsNom, y[1:rsNrTypes], lower_bound=0, Int) #purchasing RsType

#####################
# Minimize costs by somming costs of overnight arcs (3rd column is 1)
########################
@objective(rsNom, Min, sum(rsCosts[i]*y[i] for i=1:rsNrTypes) + sum(arcCost*x[i,j,k] for i=1:rsNrTypes, j=1:nrArcs, k=1:scenNr if Arcs[j,3]==2) )
#only count arc cost for driving arcs



#####################
### Constraints
########################
#Count nr units used per type per scenario
@constraint(rsNom, cUnitsScen[i=1:rsNrTypes, k=1:scenNr], sum(x[i, j, k] for j=1:nrArcs if Arcs[j,3]==1)<= y[i])

#Flow conservation for both types of RS units (seperate constraint per rs type)
@constraint(rsNom, cFlowConservation[i=1:rsNrTypes, j=1:nrNodes, s=1:scenNr], sum(x[i,k,s] for k=1:nrArcs if Arcs[k,1] == j) -  sum(x[i,k,s] for k=1:nrArcs if Arcs[k,2] == j) == 0)

#Max composition length for driving arcs, demand satisfaction FC and SC:
@constraint(rsNom, cMaxCompLength[k=1:scenNr, j=1:nrArcs; Arcs[j,3]==2 ], sum(x[i,j,k]*rsUnits[i] for i=1:rsNrTypes ) <= maxCompLength)
@constraint(rsNom, cDemandFC[k=1:scenNr, j=1:nrArcs; Arcs[j,3]==2 ],sum(x[i,j,k]*rsCapFC[i] for i=1:rsNrTypes ) >= Arcs[j,3+k])
@constraint(rsNom, cDemandSC[k=1:scenNr,j=1:nrArcs; Arcs[j,3]==2 ], sum(x[i,j,k]*rsCapSC[i] for i=1:rsNrTypes ) >= Arcs[j,3+scenNr+k])


#Constraint same overnight stay in all days 
@constraint(rsNom, constrOvernightStay[i=1:rsNrTypes, j=1:nrArcs, k=2:scenNr; Arcs[j,3]==0], x[i,j,k] == x[i,j,1])



#Print results
optimize!(rsNom)
valuesX = value.(x);
valuesY = value.(y);
objVal = objective_value(rsNom)
println("Objective value: ", objVal )
println("TypeII: ", valuesY[1] )#sum(valuesX[1,j] for j=1:nrArcs if Arcs[j,3]==1))
println("TypeIV: ", valuesY[2])#sum(valuesX[2,j] for j=1:nrArcs if Arcs[j,3]==1))
for j=1:nrArcs
    if(Arcs[j,3]==1)
    println("Arc", Arcs[j,:], " x: ", valuesX[:,j,1])
    end
end

end

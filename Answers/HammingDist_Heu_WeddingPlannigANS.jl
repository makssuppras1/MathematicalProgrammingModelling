start_time=time_ns()
#************************************************************************y
# WeddingPlanner Assignment, "Mathematical Programming Modelling" (42112)
# utilizing Hamming-distance heurisitc optimization
#************************************************************************
# Intro definitions
using JuMP
using HiGHS
#************************************************************************

let
    #************************************************************************
    # PARAMETERS
    # Set: Guests, g,g1,g2
    # Set: Tables, t
    # DATA: SharedInterests[g1,g2]: 2-dim Guests*Guests: No of shared interests
    # DATA: Couple[g1,g2]: 2-dim Guests*Guests: 1 if two guests are partners, zero-otherwise (symmetric)
    # DATA: Age[g]: 1-dim, Guests: Age measured in years
    # DATA: Male[g]: 1-dim, Guests: 1 if guest Male, 0 otherwise
    # DATA: Female[g]: 1-dim, Guests: 1 if guest Female, 0 otherwise
    # DATA: Know[g1,g2]: 2-dim Guests*Guests: 1 if two guests know each other (symmetric)
    time_limit=120
    include("WeddingData74.jl") # path to data
    G=length(Guests)
    T=length(Tables)
    TableCap=ceil(G/T)
    println("Runing Hamming-Distance-Heuristic on the WeddingPlanner with $(G) guests, $(T) tables with capacity $(TableCap)\n")
    #************************************************************************
    
    #************************************************************************
    # Model
    wp =Model(HiGHS.Optimizer)
    set_silent(wp)
    # 1 if guest g is sitting at table T
    @variable(wp, x[g=1:G,t=1:T], Bin)

    @variable(wp, slack[g=1:G], Bin)

    # 1 if guest g1 and guest g2 are both sitting at table T, symmetric
    @variable(wp, 0 <= y[g1=1:G,g2=1:G,t=1:T] <= ( g1 < g2 ? 1 : 0) ) 
    
    # Minimize sum of different objectives
    @objective(wp, Max,
               # maximize the negative total shared intersts
               sum( SharedInterests[g1,g2]*y[g1,g2,t]
                    for t=1:T, g1=1:G, g2=1:G if g1<g2)
               
               # cost of not planning all guests
               - sum( G*slack[g] for g=1:G) )                   
    
    # all guests has to sit at a table
    @constraint(wp, [g=1:G],
                slack[g] + sum( x[g,t] for t=1:T) == 1)
    
    # dont exceed the number of persons at a table
    @constraint(wp, [t=1:T],
                sum( x[g,t] for g=1:G) <= TableCap)
    
    # couples should sit at the same table
    @constraint(wp, [g1=1:G,g2=1:G,t=1:T; Couple[g1,g2]==1],
                x[g1,t] == x[g2,t])
    
    # limit y, can only become 1 if g1 and g2 are at the same table
    @constraint(wp, [g1=1:G,g2=1:G,t=1:T; g1<g2],
                y[g1,g2,t]  <= x[g1,t])
    
    # limit y, can only become 1 if g1 and g2 are at the same table
    @constraint(wp, [g1=1:G,g2=1:G,t=1:T; g1<g2],
                y[g1,g2,t]  <= x[g2,t])
    #************************************************************************

    #************************************************************************
    
    function AddKConstraintAndOptimize(xVal,K)
        
        @constraint(wp, Kconstraint,
                    sum( x[g,t] for g=1:G,t=1:T if xVal[g,t]==0) +
                        sum( (1-x[g,t]) for g=1:G,t=1:T if xVal[g,t]==1)
                    <= K)
        optimize!(wp)
        xVal=round.(Int,value.(x))
        slackVal=round.(Int,value.(slack))
        curObj=round(Int64,objective_value(wp))
        delete(wp, Kconstraint)
        unregister(wp, :Kconstraint)
        return (curObj,xVal,slackVal)
    end

    println("Starting Hamming Distance Heuristic")
    xVal=zeros(Int8,G,T)
    K=2
    it=1
    curObj=-1
    oldObj=-1
    
    while (time_ns()-start_time)/1.0e9<time_limit
        (curObj,xVal,slackVal)=AddKConstraintAndOptimize(xVal,K)
        this_time=(time_ns()-start_time)/1.0e9
        println("It: $(it) Time: $(round(this_time,digits=1)) K: $(K) CurObj: $(curObj) Slack: $(sum(slackVal[g] for g=1:G))")
        if curObj<=oldObj # comparison for maximization problems
            K=K+1
        else
            K=2
        end
        oldObj=curObj
        it+=1
    end
    #************************************************************************
    
    #************************************************************************
    println("Successfull end of $(PROGRAM_FILE)")
    #************************************************************************
end

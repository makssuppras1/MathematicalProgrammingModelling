start_time=time_ns()
#************************************************************************y
# WeddingPlanner Assignment, "Mathematical Programming Modelling" (42112)
# optimized using FixAndOptimize
#************************************************************************
# Intro definitions
using JuMP
using HiGHS
using Gurobi
using Printf
using Random
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
    K=100
    include("WeddingData74.jl") # path to data
    G=length(Guests)
    T=length(Tables)
    TableCap=9 #ceil(G/T)
    @printf "Runing WeddingPlanner with %d guests, %d tables with capacity %.0f\n" G T TableCap
    #************************************************************************
    
    #************************************************************************
    # Model
    wp =Model(Gurobi.Optimizer)
    set_silent(wp)
    #set_optimizer_attributes(wp, "mip_abs_gap", 0.0)
    set_attribute(wp, "time_limit", 60.0)

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
    
    function FixAndOptimize(xVal,K)
        # first lock all values
        for g=1:G
            for t=1:T
                fix(x[g,t], xVal[g,t]; force = true)
            end
        end

        # then free K
        free_vars=0
        while free_vars<K
            g=rand(1:G)
            t=rand(1:T)
            if is_fixed(x[g,t])
                unfix(x[g,t])
                free_vars+=1
            end
        end

        optimize!(wp)
        xVal=round.(Int,value.(x))
        slackVal=round.(Int,value.(slack))
        cur_obj=round(Int64,objective_value(wp))
        return (cur_obj,xVal,slackVal)
    end

    println("Starting heuristic")
    cur_xVal=zeros(Int8,G,T)

    # set the fix and optimize neighborhood
    #K=round(Int64,G*T/2)
    
    it=1
    cur_obj=-1
    old_obj=-1000000000000000
    this_time=(time_ns()-start_time)/1.0e9
    
    while this_time<time_limit
        (cur_obj,cur_xVal,slackVal)=FixAndOptimize(cur_xVal,K)
        this_time=(time_ns()-start_time)/1.0e9
        println("It: $(it) Time: $(round(this_time,digits=1)) K: $(K) CurObj: $(cur_obj) OldObj: $(old_obj) Slack: $(sum(slackVal[g] for g=1:G)) Improvement: $((cur_obj-old_obj))")
        if cur_obj-old_obj < 0
            println("This should not happen")
            exit(0)
        end

        if cur_obj>old_obj+0.5 # comparison for maximization problems
            old_obj=cur_obj
        end

        it+=1
    end
    #************************************************************************
    
    
    #************************************************************************
    println("Successfull end of $(PROGRAM_FILE)")
    #************************************************************************
end

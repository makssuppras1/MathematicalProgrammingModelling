using JuMP
using Gurobi

function run_test()
    println("Starting Gurobi test in Julia...")
    
    # Create a model using Gurobi as the optimizer
    model = Model(Gurobi.Optimizer)
    
    # Define variables
    @variable(model, x >= 0)
    @variable(model, y >= 0)
    
    # Define objective: Maximize x + y
    @objective(model, Max, x + y)
    
    # Define constraints
    @constraint(model, x + 2y <= 4)
    @constraint(model, 4x + 2y <= 12)
    
    # Optimize the model
    optimize!(model)
    
    # Print results
    if termination_status(model) == OPTIMAL
        println("Optimization successful!")
        println("x = ", value(x))
        println("y = ", value(y))
        println("Objective value = ", objective_value(model))
    else
        println("Optimization failed with status: ", termination_status(model))
    end
end

run_test()

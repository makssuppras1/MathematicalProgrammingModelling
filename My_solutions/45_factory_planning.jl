# =============================================================================
# 4.5 Factory Planning — matches Answers/FactoryPlanningANS.pdf (ULTIMO storage)
# =============================================================================
# Answer PDF: production x[p,t], sales y[p,t], inventory s[p,t] at **end** of month t.
# Balance: s[p,t] = s[p,t-1] + x[p,t] - y[p,t]  (Jan: s[p,1] = 0 + x - y).
# Capacity: sum_p process_time[m,p]*x[p,t] ≤ (NumMach[m] - repairs[t,m]) * hours_per_month.
# Objective: sum profit[p]*y[p,t] − storage_cost * s[p,t].
# Book optimum (ultimo): £93715.17. PRIMO variant is in the same PDF (different balance).

using JuMP
using HiGHS

# --- Sets (indices) -----------------------------------------------------------
Machines = ["Grinding","Vertical drilling","Horizontal drilling","Boring","Planing"]
const M = length(Machines)
Products = ["PROD1","PROD2","PROD3","PROD4","PROD5","PROD6","PROD7"]
const P = length(Products)
Time = ["Jan" "Feb" "Mar" "Apr" "May" "Jun"]
const T = length(Time)

# --- Table 4.9: profit (£/unit) and process times (hours per unit) ------------
# Rows = machine type m, columns = product p. Dash in book → 0.

const profit = [10, 6, 8, 4, 11, 9, 3]

const process_time = [
    0.50 0.70 0.00 0.00 0.30 0.20 0.50
    0.10 0.20 0.00 0.30 0.00 0.60 0.00
    0.20 0.00 0.80 0.00 0.00 0.00 0.60
    0.05 0.03 0.00 0.07 0.10 0.00 0.08
    0.00 0.00 0.01 0.00 0.05 0.00 0.05
]

# --- Installed machines (Table 4.5 text) --------------------------------------
const num_mach = [4, 2, 3, 1, 1]   # grind, vert, horiz, bore, plane

# --- Table 4.10: machines down in month t (same layout as answer key) ---------
const machine_repairs = [
    1 0 0 0 0   # Jan
    0 0 2 0 0   # Feb
    0 0 0 1 0   # Mar
    0 1 0 0 0   # Apr
    1 1 0 0 0   # May
    0 0 1 0 1   # Jun
]

# --- Working hours per machine per month (answer key: 24 * 8 * 2) --------------
const working_hours_pr_month = 24 * 8 * 2

# --- Table 4.11: max sales; answer PDF stores Demand[p,t] = product × month ---
const demand = [
    500 600 300 200 0 500
    1000 500 600 300 100 500
    300 200 0 400 500 100
    300 0 0 500 100 300
    800 400 500 200 1000 1100
    200 300 400 0 300 500
    100 150 100 100 0 60
]

# --- Storage parameters (problem text) ----------------------------------------
const storage_cap = 100
const storage_cost = 0.5
const end_stock = 50

# =====
# JuMP model (ULTIMO — same algebraic structure as FactoryPlanningANS.pdf)
# =====

model = Model(HiGHS.Optimizer)
set_optimizer_attribute(model, "output_flag", true)

@variable(model, x[P, T] >= 0)   # units of p produced in month t
@variable(model, y[P, T] >= 0)   # units of p sold in month t
@variable(model, s[P, T] >= 0)   # finished inventory of p at **end** of month t

@objective(
    model,
    Max,
    sum(profit[p] * y[p, t] for p in P, t in T) - sum(storage_cost * s[p, t] for p in P, t in T),
)

# Machine hours used in month t cannot exceed available hours that month
@constraint(
    model,
    machine_cap[m in M, t in T],
    sum(process_time[m, p] * x[p, t] for p in P) <=
    (num_mach[m] - machine_repairs[t, m]) * working_hours_pr_month,
)

# Inventory balance (ultimo: s indexes same month as production and sales)
@constraint(
    model,
    balance[p in P, t in T],
    s[p, t] == x[p, t] - y[p, t] + (t > 1 ? s[p, t-1] : 0),
)

@constraint(model, end_inv[p in P], s[p, 6] == end_stock) # end of June
@constraint(model, stor_lim[p in P, t in T], s[p, t] <= storage_cap) # storage capacity
@constraint(model, sales_lim[p in P, t in T], y[p, t] <= demand[p, t]) # market limitations

print(model)
println()
optimize!(model)

println("Termination status: ", termination_status(model))
if is_solved_and_feasible(model)
    println("Optimal objective (£): ", objective_value(model), "  (book ultimo: £93715.17)")
else
    println("No optimal solution.")
end

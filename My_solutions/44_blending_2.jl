using JuMP   # optimization modelling
using HiGHS  # LP solver (model is linear)

# Objective: maximize (revenue from sold product) − (purchase costs) − (storage).

# Index sets
oils = 1:5      # raw oil types: 1–2 vegetable, 3–5 non-vegetable
months = 1:6    # Jan = 1 … Jun = 6
names = ["VEG 1", "VEG 2", "OIL 1", "OIL 2", "OIL 3"]  # labels for printing only

# Hardness h[i]: if you blend u[i] tons, total hardness weight is sum_i h[i]*u[i];
# blend hardness = that sum divided by total tons sum_i u[i]. Same numbers as Blending 1.
h = [8.8, 6.1, 2.0, 4.2, 5.0]

# Refining throughput limits (tons entering the blend **per month**), book text
veg_cap = 200       # VEG1 + VEG2 refined per month cannot exceed this
nonveg_cap = 250    # OIL1 + OIL2 + OIL3 refined per month cannot exceed this

# Raw-oil warehouse: at end of any month, stock of type i cannot exceed this
storage_cap = 1000
# Holding cost: £ per ton **in stock at month end** for that month (both oil categories)
storage_cost = 5
# Initial (and required terminal) inventory of **each** raw oil type (tons)
initial_stock = 500
# Selling price of **finished** blended product (£ per ton produced/sold that month)
price = 150

# c[t,i] = purchase price (£/ton) for oil i in month t (Table 4.8; rows = months)
# Matrix literal: spaces separate columns, newlines separate rows (Julia syntax)
c = [
    110 120 130 110 115
    130 130 110 90 115
    110 140 130 100 95
    120 110 120 120 125
    100 120 150 110 105
    90 100 140 80 135
]

m = Model(HiGHS.Optimizer)
set_optimizer_attribute(m, "output_flag", true)  # solver log on (like “tee”)

# --- Decision variables -------------------------------------------------------
# b[i,t] … tons of oil i **bought** in month t (arrives in that month’s balance)
# u[i,t] … tons of oil i **put through refining into the blend** in month t
#          (this is what leaves inventory to become product that month)
# s[i,t] … tons of oil i **in storage at end of month t** after all month-t flows
# We use three families so purchase, refining, and inventory are explicit; refining
# caps and hardness must be written on **u**, not on **b** (otherwise wrong economics).

@variable(m, b[oils, months] >= 0)
@variable(m, u[oils, months] >= 0)
@variable(m, s[oils, months] >= 0)

# --- Objective (maximize net cash) --------------------------------------------
# Term 1: For each month, tons of product = sum_i u[i,t]; revenue = price × that.
# Term 2: Pay c[t,i] for each ton bought when bought.
# Term 3: Pay storage_cost for each ton held at each month-end (all types, all months).
@objective(
    m,
    Max,
    sum(price * sum(u[i, t] for i in oils) for t in months) -
    sum(c[t, i] * b[i, t] for i in oils, t in months) -
    sum(storage_cost * s[i, t] for i in oils, t in months),
)

# --- Inventory balance (conservation of each raw oil over time) ---------------
# January: stock before + purchases = used in blend + stock after
#   initial_stock + b[i,1] == u[i,1] + s[i,1]
@constraint(m, bal1[i in oils], initial_stock + b[i, 1] == u[i, 1] + s[i, 1])
# Later months: previous end stock + buys = used + new end stock
@constraint(m, bal[i in oils, t in 2:6], s[i, t-1] + b[i, t] == u[i, t] + s[i, t])

# Book: same 500 t of each type at end of June as at start of year
@constraint(m, final_stock[i in oils], s[i, 6] == initial_stock)

# Warehouse size limit every month (redundant with flows in practice but required LP row)
@constraint(m, stor_cap[i in oils, t in months], s[i, t] <= storage_cap)

# --- Refining capacities (per month, on blend input u) ------------------------
@constraint(m, veg[t in months], u[1, t] + u[2, t] <= veg_cap)
@constraint(m, nonveg[t in months], u[3, t] + u[4, t] + u[5, t] <= nonveg_cap)

# --- Hardness each month (linearized; see h_lo / h_hi above) ------------------
@constraint(m, hard_lo[t in months], sum(h_lo[i] * u[i, t] for i in oils) >= 0)
@constraint(m, hard_hi[t in months], sum(h_hi[i] * u[i, t] for i in oils) <= 0)

# --- Solve and report ---------------------------------------------------------
print(m)       # human-readable algebraic view of the model
println()
optimize!(m)   # HiGHS finds optimal LP solution

println("Termination status: $(termination_status(m))")

if is_solved_and_feasible(m)
    println("Optimal net profit (£): $(objective_value(m))  (book: £107842.59)")
    # Per-month blend quantities (tons of each oil entering the product)
    for t in months
        println("Month $t: use = ", [round(value(u[i, t]); digits = 2) for i in oils])
    end
else
    println("No optimal solution available")
end

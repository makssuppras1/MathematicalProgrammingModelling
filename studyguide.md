# 42112 Mathematical Programming Modelling — Re-exam Study Guide

**Exam date:** Tuesday, June 2, 2026, room 175, building 358
**Format:** Oral exam, two parts (Julia/JuMP submission + one assignment at random)
**Today:** April 25, 2026

---

## How to use this guide

Read sections **1–4** once, slowly. Then turn to the assignment chapters (sections **5.1–5.5**) and **practice each one on paper from scratch** until you can produce the model without looking. The course examiner cares about one thing above all else: that you can correctly write **Sets → Parameters → Decision variables → Objective → Constraints** for any of the 5 problems and explain *why* each constraint is there.

The target is not memorization, it's *fluency*: you should be able to write the model down even if I changed the numbers, the table sizes, or one constraint slightly.

---

## 1. Exam structure and strategy

### What happens on the day

1. You arrive at room 175, building 358. The examiner draws one of the 5 problems at random.
2. You go to room 176 with the problem text and have **20 minutes** to prepare.
3. You return to room 175 and present at the **whiteboard, without notes**.
4. After your presentation, the examiners ask questions: about your model, possible extensions, what would happen if a constraint changed, etc.
5. **Before** the oral problem, they will examine you on the **Julia/JuMP code you submitted on May 29**. They will check that the code is correct and ask about extensions to it.

### What scores points

- A clear, structured model written in the standard template (see section 2).
- Explaining each constraint **in plain English** as you write it ("This says every family must be assigned to exactly one day").
- Knowing the **classical OR problem** the assignment is a variant of (Santa = Generalized Assignment, Tennis = Chinese Postman, Food Festival = Graph Coloring, etc.).
- Being able to extend the model: "If we also wanted X, I would add a new variable z and the constraint…"
- Honesty when you don't remember a detail. Don't bluff.

### What loses points

- Writing pseudo-code or Julia code on the whiteboard. This is a **mathematical** exam — write the math first.
- Mixing up indices in summation (∀f vs ∀d). Read your own constraints carefully.
- Forgetting to say what the decision variable means in words.
- Trying to model a logical OR / AND / multiplication as if you were writing if-statements. You linearize (see section 4).

---

## 2. The standard model template

Every problem in this course follows the same structure. Memorize it. Use it as your whiteboard skeleton **before you read the problem in detail**:

```
Sets
   (e.g. f ∈ Families = {1, …, F},  d ∈ Days = {1, …, D})

Parameters
   (e.g. FamilySize_f, DayVisitCost_{f,d})

Decision variables
   (e.g. x_{f,d} ∈ {0,1}: 1 if family f visits on day d, 0 otherwise)

Objective
   (e.g. min  ∑_{f,d} DayVisitCost_{f,d} · x_{f,d})

Constraints
   (e.g. ∑_d x_{f,d} = 1   ∀f)
```

Always state, in words, what each variable *means* — that's the bridge between the real-world problem and the math.

---

## 3. LP and MIP — the absolute minimum you need

### Linear Programming (LP)

A model where:
- The **decision variables** are continuous (they can take any real value, often ≥ 0).
- The **objective** is a linear function of the variables.
- The **constraints** are linear inequalities or equalities.

Example (Incredible Chairs, the toy example in chapter 3 of the book):

```
max  4·x_A + 6·x_B
s.t. 2·x_A           ≤ 14
            3·x_B    ≤ 15
     4·x_A + 3·x_B   ≤ 36
     x_A, x_B ≥ 0
```

Optimal value: 51, with x_A = 5.25, x_B = 5.

LPs can be solved in polynomial time (Simplex / interior-point algorithms). Even huge LPs solve fast.

### Mixed Integer Programming (MIP)

Same as an LP, **but** at least one variable must be integer (∈ ℤ) or binary (∈ {0,1}). Example: if chairs must be sold in whole numbers, x_A ∈ ℤ⁺. The optimum becomes 50 (with x_A = 5, x_B = 5).

**Why it matters:** MIPs are NP-hard in general. Small models solve in milliseconds; large models can run for hours or never finish. Most of the assignments in this course are MIPs.

### Branch & Bound (one paragraph, just for context)

The classical algorithm for MIPs:
1. Solve the **LP relaxation** (drop the integrality requirement). Call the result the *upper bound* for a maximization problem (or *lower bound* for minimization).
2. If a variable comes out fractional (say x = 0.6), create two subproblems: one with x ≤ 0 and one with x ≥ 1. Branch.
3. Each subproblem gives a new LP relaxation. Whenever you find an integer-feasible solution, it's a candidate (the *incumbent*). When a subproblem's LP bound is worse than the incumbent, *fathom* (prune) it.
4. Continue until all branches are fathomed. The best incumbent is optimal.

You don't need to compute B&B trees by hand for the exam, but you should be able to explain in 30 seconds *why* MIPs are hard: the search tree can have up to 2^N leaves where N is the number of binary variables.

### Two terms you should be comfortable with

- **Relaxation**: drop or weaken constraints (e.g. let binary vars be continuous in [0,1]). Result is an *upper bound* on a max problem. Used in B&B and to assess hardness.
- **MIP gap**: the relative difference between the best feasible (integer) solution found and the best known bound. A solver reports `optimal` when this gap is below tolerance (default 0.01% in Gurobi, 0.01% in HiGHS).

---

## 4. Julia/JuMP cheat sheet

You will need this both for the May 29 submission and for explaining your code at the oral.

### The skeleton every program follows

```julia
#************************************************************************
# Problem name
using JuMP
using HiGHS               # the open-source solver
#************************************************************************

# Read or define data
include("MyData.jl")      # or define arrays directly

# Build the model
m = Model(HiGHS.Optimizer)

# Variables
@variable(m, x[1:N] >= 0)              # continuous, non-negative
@variable(m, y[1:N], Bin)              # binary {0,1}
@variable(m, z[1:N], Int)              # integer
@variable(m, 0 <= w[1:N] <= 10)        # bounded continuous

# Objective
@objective(m, Min, sum(c[i]*x[i] for i=1:N))

# Constraints
@constraint(m, [i=1:N], sum(a[i,j]*x[j] for j=1:N) <= b[i])

# Solve
optimize!(m)

# Read results
println("Status: ", termination_status(m))
if termination_status(m) == MOI.OPTIMAL
    println("Objective: ", objective_value(m))
    for i=1:N
        println("x[$i] = ", value(x[i]))
    end
end
```

### Things to remember

- The first statement is always `m = Model(SOLVER.Optimizer)`.
- The order of `@variable`, `@objective`, `@constraint` doesn't matter, but stick to variables → objective → constraints for readability.
- **You cannot use a JuMP variable as a Julia variable before `optimize!` is called.** Don't write `if x[i] == 1` in your model construction — it won't work. Only after `optimize!` can you read values via `value(x[i])`.
- To create a constraint **for all i**: `@constraint(m, [i=1:N], …)`.
- To add a **conditional**: `@constraint(m, [i=1:N, j=1:N; i < j && Conflict[i,j]==1], x[i] + x[j] <= 1)`. The `;` introduces the conditional filter.
- `sum(expr for i=1:N)` is the JuMP equivalent of ∑.

### Solver options

```julia
set_silent(m)                                    # suppress solver output
set_time_limit_sec(m, 300.0)                     # time limit, in seconds
set_optimizer_attribute(m, "mip_rel_gap", 0.01)  # 1% MIP gap (HiGHS)
```

### When the solver doesn't return optimal

- `MOI.OPTIMAL` — done, ε-optimal.
- `MOI.TIME_LIMIT` — hit time limit. You can still read `objective_value(m)` (best feasible found) and compare to `objective_bound(m)` (best dual bound).
- `MOI.INFEASIBLE` — your constraints contradict each other. Common bugs: equality where inequality was meant, missing relaxation/slack variable.

### Common idioms used in the assignments

```julia
# Force a variable to a value
fix(x[5], 0; force = true)

# Conditional indexing in a constraint (only generate if condition)
@constraint(m, [i=1:N, j=1:N; i<j && Adj[i,j]==1], x[i] + x[j] <= 1)

# Inline conditional in a constraint expression
@constraint(m, [i=1:N], x[i] <= (i>1 ? x[i-1] : 0) + y[i])
```

---

## 5. The five assignments

For each one I'll give you:

- **The classical OR problem** it's a variant of
- **The full mathematical model** (in the standard template)
- **The Julia/JuMP code** (essentials)
- **Optimal objective value**, so you know what "right" looks like
- **Likely follow-up questions** the examiners may ask

### Assignment master table

| # | Problem | Classical OR problem | Decision variable | What you optimize |
|---|---------|---------------------|-------------------|-------------------|
| 5.1 | Santa's Workshop Tour | Generalized Assignment | x_{f,d} ∈ {0,1} | Min total visit cost |
| 5.2 | TA Workplan | Manpower Planning | x_{ta,p,d} ∈ {0,1} | Min total inconvenience |
| 5.3 | Tennis | Chinese Postman | x_{p1,p2} ∈ {0,1} | Min walking distance |
| 5.4 | Food Festival | Graph Coloring | x_{w,s}, y_w | Min number of workers hired |
| 5.5 | Wedding Planner | Multi-objective Assignment | x_{g,t}, y_{g1,g2,t} | Combined seating quality |


---

## 4b. The modeling tricks toolkit

These are the *moves* you'll re-use across all problems. Knowing them is more useful than memorizing any single model — when the May 22 problem arrives, you'll combine these.

### Trick 1: "Did this happen?" — binary indicator variables

The most basic move. Define a binary variable y ∈ {0,1} that is 1 if some event happened, 0 otherwise. Then constrain something else to depend on y. Example uses:
- "Was worker w hired?" (Food Festival: y_w)
- "Did the route start at point p?" (Tennis: s_p)
- "Did TA *ta* start working in slot p on day d?" (TA Workplan: y_{ta,p,d})

### Trick 2: "If you do X, you must do Y" — fixed charge / activation link

If a continuous activity x can only happen when a binary y = 1 (e.g. "you can only ship containers if you charter the ship"):

```
x ≤ B · y       where B is a known upper bound on x
y ∈ {0,1}
```

This forces y = 1 whenever x > 0. **Used in Food Festival** (a worker can only cover a shift if hired): `x_{w,s} ≤ y_w`.

### Trick 3: Soft constraints via slack variables

When a constraint *should* hold but you want to allow violations and penalize them in the objective:

Original: `∑_g Male_g · x_{g,t} − ∑_g Female_g · x_{g,t} ≤ 2`  (at most 2 more men than women per table)

Soft version: introduce slack m_t ≥ 0, change to `… ≤ 2 + m_t`, and add `m_t` to the objective (with appropriate sign). The slack only takes a positive value if the constraint would otherwise be violated.

**Used heavily in Wedding Planner** for gender balance and "guests not knowing enough other guests".

### Trick 4: Linearizing binary multiplication (the y-variable trick)

You want to model "guest g1 AND guest g2 are at the same table t". Naively this would be x_{g1,t} · x_{g2,t}, but products of variables are nonlinear.

Solution: introduce y_{g1,g2,t} and add the linearization constraints:

```
y_{g1,g2,t} ≤ x_{g1,t}      (y is 1 only if g1 is at table t)
y_{g1,g2,t} ≤ x_{g2,t}      (y is 1 only if g2 is at table t)
y_{g1,g2,t} ≥ x_{g1,t} + x_{g2,t} − 1   (y must be 1 if both are)
0 ≤ y_{g1,g2,t} ≤ 1
```

If you only want to *reward* "both at same table" in the objective (i.e. the third constraint isn't strictly necessary because the optimization will push y up), you can drop it. **The Wedding Planner** uses exactly this and drops the third constraint because the maximization objective pulls y_{g1,g2,t} up automatically.

The same trick handles AND and binary multiplication in general.

### Trick 5: Logic on binaries (OR / AND / NOT / forced selection)

Given binary x, y, and a new binary v:

| Logic | Constraints |
|-------|-------------|
| v = x OR y | v ≥ x;  v ≥ y;  v ≤ x + y |
| v = x AND y | v ≤ x;  v ≤ y;  v ≥ x + y − 1 |
| v = NOT x | v = 1 − x |
| Select at least k from a set | ∑_i x_i ≥ k |
| Select at most k from a set | ∑_i x_i ≤ k |

### Trick 6: Big-M

When a constraint should only apply *if* some binary z = 1, use a sufficiently large constant M:

`(some constraint)  ≤  M · z`

If z = 0, the constraint is `≤ M` (effectively non-binding). If z = 1, it's the real constraint. Important: keep M as small as you can — too-large M ruins the LP relaxation and makes the MIP slow. **Used implicitly in Aircraft Landing**, but you should know it.

### Trick 7: Counting / minimum / maximum via auxiliary variable

You want to minimize the *maximum* of something (or maximize a minimum). Introduce a single variable z, use:

- For minimax (min the max of values v_i):  `z ≥ v_i ∀i`  AND  `min z`
- For maximin (max the min of values v_i):  `z ≤ v_i ∀i`  AND  `max z`

This is used in the multi-objective Aircraft Landing variant — and is good vocabulary even if it doesn't show up in your specific assignment.

### Trick 8: Flow conservation (balance constraints)

Whenever you have variables representing "movement" or "transitions" (visits, edges of a route, transitions between time slots), the rule "what comes in must go out" gives:

`∑_j x_{j,i} = ∑_j x_{i,j}    ∀i`

Used in **Tennis** (the cleaner walks in and out of each node equally often, unless they start/end there). Also in network flow problems.

### Trick 9: Connected work / consecutive blocks

Sometimes you want a binary "schedule" x_{p} (over time slots p) to consist of a single contiguous block. The trick: introduce y_p = 1 iff slot p is the *start* of the block. Then:

```
∑_p y_p ≤ 1                                    (at most one start)
x_p ≤ x_{p-1} + y_p   ∀p (with x_0 := 0)        (you can only be working if you were already, OR you just started)
```

This is the **TA Workplan question 9.2** trick. Beautiful and concise. Add `∑_p x_p ≥ 2 · ∑_p y_p` to enforce "at least 2 hours if you work that day".

### Trick 10: When you don't need integrality

If a variable will naturally take an integer value at the optimum because of the structure of the problem (often bounded above by 1 and below by 0 with integer-coefficient constraints), declare it as continuous. The LP relaxation gets solved instead of the MIP, which is dramatically faster. **Wedding Planner** declares y_{g1,g2,t} as continuous in [0,1] for this reason.


---

## 5.1 Santa's Workshop Tour 2019

**Classical OR problem:** Generalized Assignment Problem (assigning jobs to agents, each with a constrained capacity).

### Story (one sentence)

5,000 families have to be assigned to 100 visiting days such that each day has between 125 and 300 visitors and the total visiting cost (which factors in family preferences) is minimized.

### Sets

- **f ∈ Families** = {1, …, F}, where F = 5000 (or 1000 in the small dataset)
- **d ∈ Days** = {1, …, D}, where D = 100 (or 20 in the small dataset)

### Parameters

- **FamilySize_f**: number of people in family f
- **DayVisitCost_{f,d}**: cost of assigning family f to day d (already includes the penalty for not getting a preferred day — Santa's accountants pre-computed this)

### Decision variables

- **x_{f,d} ∈ {0, 1}**: 1 if family f visits on day d, 0 otherwise

### Objective

Minimize total visiting cost:

```
min  ∑_f ∑_d  DayVisitCost_{f,d} · x_{f,d}
```

### Constraints

(i) Each family must be assigned to exactly one day:
```
∑_d  x_{f,d}  =  1     ∀ f
```

(ii) At least 125 people visit per day:
```
∑_f  FamilySize_f · x_{f,d}  ≥  125     ∀ d
```

(iii) At most 300 people visit per day:
```
∑_f  FamilySize_f · x_{f,d}  ≤  300     ∀ d
```

### Julia/JuMP code (essentials)

```julia
using JuMP, HiGHS
include("SantasWorkshopData_1000_20.jl")  # defines F, D, FamilySize, DayVisitCost

santa = Model(HiGHS.Optimizer)
@variable(santa, x[f=1:F, d=1:D], Bin)

@objective(santa, Min,
    sum(DayVisitCost[f,d]*x[f,d] for f=1:F, d=1:D))

@constraint(santa, [f=1:F], sum(x[f,d] for d=1:D) == 1)
@constraint(santa, [d=1:D], sum(FamilySize[f]*x[f,d] for f=1:F) >= 125)
@constraint(santa, [d=1:D], sum(FamilySize[f]*x[f,d] for f=1:F) <= 300)

optimize!(santa)
println("Objective: ", objective_value(santa))
```

### Optimal values

- 1000 families / 20 days: **164,068**
- 5000 families / 100 days: **43,622** (HiGHS struggles with this; Gurobi solves it fast)

### Likely follow-up questions

1. **"Why is this called Generalized Assignment?"** Because it generalizes the basic Assignment Problem (where each agent does one job and each job is done once) by allowing each "agent" (here, a day) to take multiple "jobs" (families) up to a capacity.

2. **"What if we wanted the workload more balanced — same number of visitors every day?"** Introduce z = max-min spread, add `∑_f FamilySize_f · x_{f,d} ≤ z + min_visitors ∀d` and `∑_f … ≥ min_visitors_var ∀d`, then minimize z. Or: minimize the variance, which is nonlinear, so don't do that — use minimax.

3. **"What if family 1 and family 2 must visit the same day?"** Add `x_{1,d} = x_{2,d} ∀d`.

4. **"What if some families must NOT visit on day 1?"** Either add `x_{f,1} = 0` or use `fix(x[f,1], 0; force=true)`.

5. **"How many decision variables are in the model?"** F × D. For the small dataset: 1000 × 20 = 20,000 binary variables. For the full: 500,000.

6. **"Why does HiGHS struggle with the full dataset?"** Because the LP relaxation is weak — fractional x_{f,d} solutions are easy to find but far from integer optima — and the search tree is huge. Commercial solvers (Gurobi) have better cuts and primal heuristics.


---

## 5.2 Workplan for Teaching Assistants

**Classical OR problem:** Manpower / shift scheduling.

### Story (one sentence)

Four TAs must collectively cover known demand for help across 9 days × 8 time slots, each TA must work *exactly* 52 hours, and the schedule should minimize their total inconvenience (each TA reports inconvenience scores for each (slot, day)).

### 5.2.1 — Question 9.1 (basic version)

#### Sets

- **ta ∈ TAs** = {AL, FR, JE, MI}
- **p ∈ Periods** = {"9-10", "10-11", …, "16-17"} (P = 8 slots)
- **d ∈ Days** = {1, …, 9}

#### Parameters

- **Demand_{p,d}**: number of TAs needed in slot p on day d
- **Inconvenience_{ta,p,d}**: how inconvenient slot (p,d) is for TA *ta*

#### Decision variables

- **x_{ta,p,d} ∈ {0, 1}**: 1 if TA *ta* works in slot p on day d

#### Objective

Minimize total inconvenience:

```
min  ∑_{ta} ∑_p ∑_d  Inconvenience_{ta,p,d} · x_{ta,p,d}
```

#### Constraints

(i) Cover the demand in every slot:
```
∑_{ta}  x_{ta,p,d}  ≥  Demand_{p,d}     ∀ p, d
```

(ii) Each TA works exactly 52 hours:
```
∑_p ∑_d  x_{ta,p,d}  =  52     ∀ ta
```

#### Julia/JuMP code (essentials)

```julia
using JuMP, HiGHS
include("WorkplanData.jl")  # defines TA, P, D, Demand, Inconvenience

m = Model(HiGHS.Optimizer)
@variable(m, x[ta=1:TA, p=1:P, d=1:D], Bin)

@objective(m, Min,
    sum(Inconvenience[ta,p,d]*x[ta,p,d] for ta=1:TA, p=1:P, d=1:D))

@constraint(m, [p=1:P, d=1:D],
    sum(x[ta,p,d] for ta=1:TA) >= Demand[p,d])

@constraint(m, [ta=1:TA],
    sum(x[ta,p,d] for p=1:P, d=1:D) == 52)

optimize!(m)
```

#### Optimal value: **94.98**

### 5.2.2 — Question 9.2 (consecutive blocks)

The basic solution often has TAs working broken-up shifts, e.g. 9-10 and 14-15 with a gap. Two new requirements:

- Each TA works at most **one block** of consecutive hours per day.
- If a TA works on a day, they must work **at least 2 hours** that day.

#### New decision variable

- **y_{ta,p,d} ∈ {0, 1}**: 1 if TA *ta* **starts** working in slot p on day d

#### New constraints

(iii) At most one start per day per TA:
```
∑_p  y_{ta,p,d}  ≤  1     ∀ ta, d
```

(iv) You can only be working if you were already working in the previous slot, OR you just started:
```
x_{ta,p,d}  ≤  x_{ta,p-1,d} + y_{ta,p,d}     ∀ ta, p, d   (with x_{ta,0,d} := 0)
```

(v) If you work on a day, you work at least 2 slots:
```
∑_p  x_{ta,p,d}  ≥  2 · ∑_p  y_{ta,p,d}     ∀ ta, d
```

#### Julia/JuMP code for the new constraints

```julia
@variable(m, y[ta=1:TA, p=1:P, d=1:D], Bin)

@constraint(m, [ta=1:TA, d=1:D], sum(y[ta,p,d] for p=1:P) <= 1)

@constraint(m, [ta=1:TA, d=1:D, p=1:P],
    x[ta,p,d] <= (p>1 ? x[ta,p-1,d] : 0) + y[ta,p,d])

@constraint(m, [ta=1:TA, d=1:D],
    sum(x[ta,p,d] for p=1:P) >= 2*sum(y[ta,p,d] for p=1:P))
```

#### Optimal value: **121.97** (worse than 94.98 — the consecutive-block requirement makes things less convenient overall, as you'd expect)

### Likely follow-up questions

1. **"Why does the inconvenience get *worse* with the new constraints?"** Because adding constraints to a minimization problem can only weakly increase the optimum (restriction → equal or worse). The TAs lose flexibility to fragment their shifts where it would have been least painful.

2. **"What does the y variable mean? Why do you need it?"** y_{ta,p,d} marks the start of a contiguous block. Without it, you can't express "consecutive" using a simple linear constraint — you need a way to *anchor* the block.

3. **"Can you remove the integrality of y?"** Yes — if x is binary and the start constraints involve only x and y, y will naturally take 0/1 values at the optimum. But declaring it `Bin` is clearer and helps the solver.

4. **"Why = 52 and not ≤ 52 in the work hours constraint?"** Because each TA is *contracted* to work 52 hours and gets paid for 52 hours, regardless of how few are needed. Fewer would not save money. With ≤ 52, you'd just see TAs working as little as possible (down to total demand).

5. **"What if we allowed a TA to take a day off (work 0 hours that day)?"** That's already allowed — x_{ta,p,d} = 0 for all p that day means they're off. The y-start constraints handle this correctly because if no x is 1 that day, no y is 1 either.

6. **"What if we wanted to *minimize the maximum* inconvenience for any single TA, instead of the total?"** Introduce z, add `∑_{p,d} Inconvenience_{ta,p,d} · x_{ta,p,d} ≤ z ∀ta`, and `min z`. (Minimax trick from the toolkit.)


---

## 5.3 Tennis

**Classical OR problem:** Chinese Postman Problem (find a shortest closed walk in a graph that covers every required edge at least once).

### Story (one sentence)

A clay tennis court has 12 line-intersection points; a sweeper must traverse every line at least once and minimize total walking distance. The court layout (one half) has 12 points labeled A0, B0, D0, E0, B1, C1, D1, A2, B2, C2, D2, E2, with coordinates and a list of required line segments between them.

### Setup (used in all 4 sub-questions)

- 12 points with given (x, y) coordinates (in feet)
- **Distance_{p1,p2}**: Euclidean distance between any two points
- **Lines_{p1,p2}**: 1 if there is a required line segment between p1 and p2 (this is *oriented* — defined only one way, e.g. Lines[1,2]=1 but Lines[2,1]=0)

### 5.3.1 — Q12.1 (analytical, no model needed)

If you can ONLY step on the lines, the result must traverse every line and return to start. The interior rectangle can be cleaned with a single sweep, but the connections must be traversed twice. Optimal distance: **390 feet**. No JuMP needed; solved by hand.

### 5.3.2 — Q12.2 (basic model: walk between lines, return to start)

#### Sets

- **p ∈ Points** = {1, …, 12}

#### Decision variables

- **x_{p1,p2} ∈ {0, 1}**: 1 if the sweeper walks from p1 to p2

#### Objective

```
min  ∑_{p1, p2}  Distance_{p1,p2} · x_{p1,p2}
```

#### Constraints

(i) Flow conservation (what comes in must come out):
```
∑_{p2}  x_{p2,p1}  =  ∑_{p2}  x_{p1,p2}     ∀ p1
```

(ii) Every required line must be cleaned (in either direction):
```
x_{p1,p2} + x_{p2,p1}  ≥  Lines_{p1,p2}     ∀ p1, p2
```

#### Optimal value: **306 feet**

### 5.3.3 — Q12.3 (allow start ≠ end)

The sweeper doesn't have to return to where they started.

#### New decision variables

- **s_p ∈ {0, 1}**: 1 if the sweeper starts at point p
- **e_p ∈ {0, 1}**: 1 if the sweeper ends at point p

#### Modified constraints

(i') Flow conservation, allowing for one start and one end:
```
∑_{p2}  x_{p2,p1}  +  s_{p1}  =  ∑_{p2}  x_{p1,p2}  +  e_{p1}     ∀ p1
```

(In words: total entries to a node = total exits, except at the start node where you have one extra exit, and at the end node where you have one extra entry.)

(iii) Exactly one start:
```
∑_p  s_p  =  1
```

(iv) Exactly one end:
```
∑_p  e_p  =  1
```

#### Optimal value: **280.5 feet**

### 5.3.4 — Q12.4 (start/end must be on outside lines only)

Looking at Q12.3's solution, you'd notice the end point lies in the *interior* of the swept area — meaning the sweeper would have to walk back across already-cleaned clay to leave. So we forbid starting or ending at interior points (B1, C1, D1, B2, C2, D2 — points 5, 6, 7, 9, 10, 11 in the indexing).

Easiest implementation: fix those s and e variables to 0:

```julia
fix(s[5], 0; force=true);  fix(s[6], 0; force=true);  fix(s[7], 0; force=true)
fix(s[9], 0; force=true);  fix(s[10], 0; force=true); fix(s[11], 0; force=true)
fix(e[5], 0; force=true);  fix(e[6], 0; force=true);  fix(e[7], 0; force=true)
fix(e[9], 0; force=true);  fix(e[10], 0; force=true); fix(e[11], 0; force=true)
```

Or equivalently, add constraints `s_p = 0, e_p = 0` for those points.

#### Optimal value: **287.47 feet** (slightly worse than 280.5, as expected — restricting feasibility worsens the optimum)

### Julia/JuMP code (Q12.3 version, the most informative)

```julia
using JuMP, HiGHS

Points = ["A0" "B0" "D0" "E0" "B1" "C1" "D1" "A2" "B2" "C2" "D2" "E2"]
P = length(Points)
x_pos = [0  4.5  31.5  36   4.5  18  31.5   0   4.5  18  31.5  36 ]
y_pos = [0  0    0     0    18   18  18    39   39   39  39    39 ]

Distance = zeros(P, P)
for p=1:P, pp=1:P
    Distance[p,pp] = sqrt((x_pos[p]-x_pos[pp])^2 + (y_pos[p]-y_pos[pp])^2)
end

Lines = zeros(Int8, P, P)
Lines[1,2]=1; Lines[1,8]=1; Lines[2,5]=1; Lines[2,3]=1
Lines[3,4]=1; Lines[3,7]=1; Lines[4,12]=1; Lines[5,6]=1
Lines[5,9]=1; Lines[6,7]=1; Lines[6,10]=1; Lines[7,11]=1

m = Model(HiGHS.Optimizer)
@variable(m, x[1:P, 1:P], Bin)
@variable(m, s[1:P], Bin)
@variable(m, e[1:P], Bin)

@objective(m, Min, sum(Distance[p,pp]*x[p,pp] for p=1:P, pp=1:P))

@constraint(m, [p=1:P],
    sum(x[pp,p] for pp=1:P) + s[p] == sum(x[p,pp] for pp=1:P) + e[p])

@constraint(m, sum(s[p] for p=1:P) == 1)
@constraint(m, sum(e[p] for p=1:P) == 1)

@constraint(m, [p=1:P, pp=1:P], x[p,pp] + x[pp,p] >= Lines[p,pp])

optimize!(m)
```

### Likely follow-up questions

1. **"Why is this called the Chinese Postman Problem?"** A Chinese researcher (Mei-Ko Kwan) first formalized it: a postman wants to walk every street at least once and return home, minimizing total distance. Same as a tennis-court sweeper.

2. **"Why is the Lines matrix oriented (only one direction set)?"** Because the line is the same line regardless of direction. The constraint `x_{p1,p2} + x_{p2,p1} ≥ Lines_{p1,p2}` says "the line p1↔p2 must be walked in at least one direction" — defining `Lines` symmetrically would just create duplicate constraints.

3. **"What's the role of the flow conservation constraint?"** It enforces that the route is a *valid walk*: every time you enter a node, you also leave it (with the start/end variables as the single exception). Without it, the model could "teleport".

4. **"Could you avoid the start/end variables in Q12.3?"** Yes — there's a classical trick: pick *any* node as both fictitious start and end, then enforce flow balance everywhere. But the start/end variables make the model self-explanatory and let Q12.4 use `fix(...)` cleanly.

5. **"How would you forbid traversing a specific line entirely?"** `fix(x[p1,p2], 0)` and `fix(x[p2,p1], 0)`, but you'd also need `Lines[p1,p2] = 0` (otherwise constraint (ii) becomes infeasible).

6. **"Could the optimal route revisit a point?"** Absolutely, and it generally must — the flow conservation constraint allows multiple in/out per node. That's why this isn't a TSP: edges can be traversed multiple times (in opposite directions).

7. **"Why is this a MIP and not just a graph algorithm?"** Pure Chinese Postman has a polynomial-time algorithm (Edmonds–Johnson). But the MIP formulation is general, easy to extend (e.g. forbidden start points in Q12.4), and works as a teaching tool.


---

## 5.4 Food Festival

**Classical OR problem:** Graph Coloring (assign colors to nodes of a graph such that adjacent nodes have different colors, using as few colors as possible).

### Story (one sentence)

A food festival has 25 night-time security shifts; some pairs overlap in time and cannot be done by the same person. Hire as few security workers as possible such that all shifts are covered and no worker is assigned two conflicting shifts.

### The graph-coloring connection

- **Nodes** = the 25 shifts.
- **Edges** = pairs of shifts in conflict.
- **Colors** = workers (each worker = one color).

Goal: color all nodes so adjacent nodes have different colors, minimizing the number of distinct colors used. This is the *chromatic number* of the conflict graph.

### Sets

- **s ∈ Shifts** = {1, 2, …, 25}
- **w ∈ Workers** = {1, …, W}, where W is an upper bound on workers needed. **Use W = S = 25** (worst case: one worker per shift).

### Parameters

- **Conflict_{s1,s2} ∈ {0, 1}**: 1 if shifts s1 and s2 cannot be worked by the same person

### Decision variables

- **x_{w,s} ∈ {0, 1}**: 1 if worker w is assigned shift s
- **y_w ∈ {0, 1}**: 1 if worker w is hired

### Objective

Minimize the number of hired workers:

```
min  ∑_w  y_w
```

### Constraints

(i) Every shift is covered by exactly one worker:
```
∑_w  x_{w,s}  =  1     ∀ s
```

(ii) A worker can only be assigned a shift if they're hired (the activation link from trick #2):
```
x_{w,s}  ≤  y_w     ∀ w, s
```

(iii) A worker cannot do two conflicting shifts:
```
x_{w,s1} + x_{w,s2}  ≤  1     ∀ w, ∀ (s1, s2) with s1 < s2 and Conflict_{s1,s2} = 1
```

(The condition `s1 < s2` avoids generating the same constraint twice in symmetric pairs.)

### Julia/JuMP code (essentials)

```julia
using JuMP, HiGHS
include("FoodFestival_data.jl")  # defines S, Conflict

W = S    # upper bound on workers
m = Model(HiGHS.Optimizer)
@variable(m, x[1:W, 1:S], Bin)
@variable(m, y[1:W], Bin)

@objective(m, Min, sum(y[w] for w=1:W))

@constraint(m, [s=1:S], sum(x[w,s] for w=1:W) == 1)

@constraint(m, [w=1:W, s=1:S], x[w,s] <= y[w])

@constraint(m, [w=1:W, s1=1:S, s2=1:S; s1<s2 && Conflict[s1,s2]==1],
    x[w,s1] + x[w,s2] <= 1)

optimize!(m)
```

### Optimal value: **5 workers**

### Likely follow-up questions

1. **"Why W = S?"** Because in the absolute worst case (every shift conflicts with every other shift), you'd need one worker per shift. This is a safe upper bound. A tighter bound — like the size of the largest *clique* in the conflict graph (the "must all be different" set) as a *lower* bound — would help solver speed.

2. **"This model has a symmetry problem — can you see it?"** Yes. If a feasible solution uses workers 1, 2, 3, you can permute labels and get S! equivalent solutions. This is called *symmetry* and slows down the MIP solver. A standard fix: add **symmetry-breaking constraints**, e.g. `y_w ≥ y_{w+1}` (only hire workers in order: if you hire 3, hire workers 1, 2, 3, not workers 7, 9, 13).

3. **"Why use both x and y?"** y_w gives you the right thing to minimize (number of hired workers); x_{w,s} gives you the assignment. Linking them with `x_{w,s} ≤ y_w` says "you can't assign a shift to a worker you haven't hired".

4. **"What if a worker can cover at most 4 shifts?"** Add `∑_s x_{w,s} ≤ 4 ∀w`.

5. **"What if some workers are pre-committed (e.g. worker 1 must do shift 1)?"** Use `fix(x[1,1], 1; force=true)` and `fix(y[1], 1; force=true)`.

6. **"What's the chromatic number of this conflict graph?"** 5 — that's the optimal objective value. The minimum number of "colors" (workers) needed to color the conflict graph.

7. **"Is graph coloring NP-hard?"** Yes, in general. But for this small instance (25 nodes), HiGHS solves it instantly.


---

## 5.5 The Wedding Planner

**Classical OR problem:** Multi-objective Assignment Problem with side constraints. The hardest of the five — built up in 5 stages.

### Story (one sentence)

20 wedding guests need to be assigned to 3 tables of capacity 9 each, with couples seated together, while balancing three quality goals: maximizing shared interests at each table, balancing genders, and ensuring each guest knows enough other guests at their table.

### Sets (used throughout)

- **g ∈ Guests** = {1, …, 20} (G = 20 in the small instance, 74 in the full)
- **t ∈ Tables** = {1, 2, 3} (T = 3)

### Parameters (used throughout)

- **TableCap** = 9
- **Couple_{g1,g2} ∈ {0, 1}**: 1 if g1 and g2 are a couple (must sit together)
- **SharedInterests_{g1,g2}**: integer count of shared interests between g1 and g2 (only used from stage 2)
- **Male_g, Female_g ∈ {0, 1}**: gender of guest g (used from stage 3)
- **Know_{g1,g2} ∈ {0, 1}**: 1 if g1 and g2 know each other (used from stage 4)

### 5.5.1 — Stage 1: Feasibility (problem 17.1)

Just find any seating that obeys: everyone seated, table capacity respected, couples together.

#### Decision variable

- **x_{g,t} ∈ {0, 1}**: 1 if guest g sits at table t

#### Objective: dummy constant `42` (no optimization, just feasibility)

#### Constraints

(i) Every guest sits at exactly one table:
```
∑_t  x_{g,t}  =  1     ∀ g
```

(ii) Each table seats at most 9:
```
∑_g  x_{g,t}  ≤  TableCap     ∀ t
```

(iii) Couples sit together:
```
x_{g1,t}  =  x_{g2,t}     ∀ t, ∀ (g1, g2) with Couple_{g1,g2} = 1
```

This is the *base*. Each later stage adds variables, constraints, and an objective term.

### 5.5.2 — Stage 2: Maximize shared interests (problem 17.2)

#### New decision variable

- **y_{g1,g2,t} ∈ [0, 1]** (continuous! see trick #10): equals 1 if both g1 and g2 are seated at table t, 0 otherwise. Defined only for `g1 < g2` (avoiding double-counting).

#### New objective (replacing the dummy)

```
max  ∑_{t} ∑_{g1 < g2}  SharedInterests_{g1,g2} · y_{g1,g2,t}
```

#### New constraints (the linearization)

(iv) If guests 1 and 2 are at the same table guests must sit at that table
```
y_{g1,g2,t}  ≤  x_{g1,t}     ∀ t, ∀ (g1, g2) with g1 < g2
```

(v)
```
y_{g1,g2,t}  ≤  x_{g2,t}     ∀ t, ∀ (g1, g2) with g1 < g2
```

We don't need a third constraint `y ≥ x_{g1} + x_{g2} − 1` because the *maximization* objective already pushes y up whenever it's allowed to be 1.

#### Optimal value: **67**

### 5.5.3 — Stage 3: Balance genders (problem 17.3)

We want at most 2 more men than women at any table (and vice versa). Use slack variables for soft enforcement.

#### New decision variables

- **m_t ≥ 0**: excess males at table t beyond the allowed +2
- **f_t ≥ 0**: excess females at table t beyond the allowed +2

#### New objective (when we run *only* this stage)

```
min  ∑_t  (m_t + f_t)
```

#### New constraints

(vi) Excess-males slack:
```
∑_g  (Male_g · x_{g,t} − Female_g · x_{g,t})  ≤  2 + m_t     ∀ t
```

(vii) Excess-females slack:
```
∑_g  (Female_g · x_{g,t} − Male_g · x_{g,t})  ≤  2 + f_t     ∀ t
```

#### Optimal value (this objective alone): **0** (achievable to keep gender balance perfectly tight)

### 5.5.4 — Stage 4: Each guest should know ≥ 3 others at their table (problem 17.4)

#### New decision variable

- **k_g ≥ 0**: shortfall of "people guest g knows at their table" below 3

#### New objective (this stage alone)

```
min  ∑_g  k_g
```

#### New constraint

(viii)
```
k_g  −  3 · x_{g,t}  +  ∑_{g1}  Know_{g,g1} · (y_{g,g1,t} + y_{g1,g,t})  ≥  0     ∀ g, t
```

In words: at the table where g sits (x_{g,t} = 1), the slack k_g must compensate for any shortfall between "3 needed" and "number of known guests at that table".

The `y_{g,g1,t} + y_{g1,g,t}` accounts for the asymmetric definition of y (only defined for g1 < g2 — so depending on which of g, g1 is smaller, the relevant variable is one or the other).

#### Optimal value (this stage alone): **2**

### 5.5.5 — Stage 5: Combined multi-objective (problem 17.5)

All three goals at once, weighted equally:

```
min   − ∑_{t} ∑_{g1<g2}  SharedInterests · y_{g1,g2,t}
      + ∑_t (m_t + f_t)
      + ∑_g k_g
```

(Negate shared interests so that *maximizing* it becomes *minimizing* its negative — letting all three terms be summed in a `min` objective.)

#### Optimal value: **−60**

### Julia/JuMP code (full Stage 5 model — all variables and constraints together)

```julia
using JuMP, HiGHS
include("WeddingData20.jl")  # G, T, TableCap, Couple, SharedInterests, Male, Female, Know

m = Model(HiGHS.Optimizer)

@variable(m, x[g=1:G, t=1:T], Bin)
@variable(m, 0 <= y[g1=1:G, g2=1:G, t=1:T] <= (g1 < g2 ? 1 : 0))
@variable(m, mm[t=1:T] >= 0)    # excess males
@variable(m, ff[t=1:T] >= 0)    # excess females
@variable(m, k[g=1:G] >= 0)     # missing-known slack

@objective(m, Min,
    -sum(SharedInterests[g1,g2]*y[g1,g2,t] for t=1:T, g1=1:G, g2=1:G if g1<g2)
    + sum(mm[t] + ff[t] for t=1:T)
    + sum(k[g] for g=1:G))

@constraint(m, [g=1:G], sum(x[g,t] for t=1:T) == 1)
@constraint(m, [t=1:T], sum(x[g,t] for g=1:G) <= TableCap)
@constraint(m, [g1=1:G, g2=1:G, t=1:T; Couple[g1,g2]==1], x[g1,t] == x[g2,t])

@constraint(m, [t=1:T],
    sum(Male[g]*x[g,t] - Female[g]*x[g,t] for g=1:G) <= mm[t] + 2)
@constraint(m, [t=1:T],
    sum(Female[g]*x[g,t] - Male[g]*x[g,t] for g=1:G) <= ff[t] + 2)

@constraint(m, [g1=1:G, g2=1:G, t=1:T; g1<g2], y[g1,g2,t] <= x[g1,t])
@constraint(m, [g1=1:G, g2=1:G, t=1:T; g1<g2], y[g1,g2,t] <= x[g2,t])

@constraint(m, [g=1:G, t=1:T],
    k[g] - 3*x[g,t] + sum(Know[g,g1]*(y[g,g1,t] + y[g1,g,t]) for g1=1:G) >= 0)

optimize!(m)
```

### Likely follow-up questions

1. **"Why is y declared continuous, not binary?"** Because of the structure: y_{g1,g2,t} is bounded above by x_{g1,t} and x_{g2,t}, both of which are binary. With the maximization pull from SharedInterests in the objective, y will naturally take the value 1 whenever both x's are 1, and 0 otherwise. Continuous is faster to solve.

2. **"Why the condition `g1 < g2` everywhere?"** To avoid counting each pair twice. Otherwise SharedInterests_{g1,g2} contributes to the objective once via y_{g1,g2,t} and again via y_{g2,g1,t}.

3. **"Why is the third linearization constraint omitted (`y ≥ x_{g1} + x_{g2} − 1`)?"** Because the *maximization* objective already pulls y up to 1 whenever both x's are 1. The constraint is redundant given the objective direction.

4. **"What is the role of the slack variables m_t, f_t, k_g?"** They convert hard constraints (which would make the problem infeasible if violated) into soft penalties. The objective rewards keeping them at 0 but allows positive values when necessary.

5. **"How would you weight the objectives differently — e.g. shared interests are 3× more important than gender balance?"** Multiply by weights: `min  −3·∑(SharedInterests·y) + 1·∑(m+f) + 1·∑(k)`. This is *weighted-sum scalarization* of a multi-objective problem.

6. **"What does the negative objective value mean physically?"** Sum of (negative shared interests) + (gender slack) + (knowing slack). −60 means the shared-interest gains outweigh the slack penalties. The actual breakdown is something like: shared interests = 64, gender slack = 2, knowing slack = 2, total = −64 + 2 + 2 = −60.

7. **"Why can't this problem be solved for the full wedding (74 guests)?"** The number of y variables grows as O(G²·T). For G = 74, T = 8 or so, that's around 50,000 continuous y variables and a corresponding huge number of constraints. With tight LP relaxation issues, even Gurobi struggles. The book solves it via *math-heuristics* (Hamming distance / Fix-and-Optimize) — see chapter 6.20.

8. **"What if the bride wants two specific guests to NOT sit together?"** Add `x_{g1,t} + x_{g2,t} ≤ 1 ∀t`.


---

## 6. Whiteboard presentation strategy

You have **20 minutes of prep** in room 176, then no notes at the whiteboard. Here's how to use that time and how to perform.

### The 20-minute prep

1. **Minute 0–2: Calm down**. Read the problem statement twice. Underline the keywords (e.g. "minimize", "at least", "must be assigned to exactly one").
2. **Minute 2–5: Identify the classical OR problem**. Generalized Assignment? Graph Coloring? Chinese Postman? Manpower planning? Assignment with multi-objective? Saying "this is a variant of *X*" early scores points.
3. **Minute 5–10: Write the standard template**. On scratch paper, write the five headings:
   - Sets
   - Parameters
   - Decision variables
   - Objective
   - Constraints
   And fill in each one. State clearly what each variable means in words.
4. **Minute 10–17: Sanity-check**. For each constraint: does it correctly say what I mean it to say? For each parameter: did the problem actually give me this? Does the objective have the right sign (max vs min)?
5. **Minute 17–20: Plan the whiteboard layout**. Decide how you'll partition the board: title at top, sets and parameters on the left, variables in the middle, objective and constraints on the right.

### At the whiteboard

1. **Don't dive in. Set up first.** Write the title and the 5 section headings before writing any math. This buys you 30 seconds of composed silence and signals structure.
2. **Talk while you write.** "I'll define x_{g,t} as a binary variable that is 1 if guest g sits at table t." The examiner is listening to your reasoning, not just reading the math.
3. **Use the right symbols.** ∀ for "for all", ∈ for "in". Subscript indices clearly. Use ∑ with the index explicitly written below.
4. **Do constraints in the order they were given in the problem.** Don't be creative with order — easier for everyone to follow.
5. **For each constraint, say in plain English what it does.** "This constraint says every family must visit on exactly one day."
6. **If you forget a detail, say so.** "I don't recall whether the original problem had 100 or 90 days, but the formulation works the same way for any value of D." That's much better than guessing wrong silently.

### When they ask a follow-up question

- **Pause before answering.** It's fine to think for 5 seconds.
- **Modify the model on the board, don't erase it.** Add the new variable next to the existing ones, the new constraint at the bottom. Show the *delta*.
- **If the question is "what's the optimal value?", admit you don't memorize numerical values** unless you do remember it. Saying "I don't recall the exact value, but the model is small enough that HiGHS would solve it in seconds" is acceptable.
- **If you don't know, say so.** "I'm not sure how I'd handle that — let me think." Honest beats bluffing.

### Numbers to memorize (just in case)

| Problem | Optimal value |
|---------|---------------|
| Santa, 1000 fam / 20 days | 164,068 |
| Santa, 5000 fam / 100 days | 43,622 |
| TA Workplan (Q9.1, basic) | 94.98 |
| TA Workplan (Q9.2, with blocks) | 121.97 |
| Tennis Q12.1 (analytical) | 390 ft |
| Tennis Q12.2 (start = end) | 306 ft |
| Tennis Q12.3 (start ≠ end) | 280.5 ft |
| Tennis Q12.4 (start/end on outside) | 287.47 ft |
| Food Festival | 5 workers |
| Wedding Planner stage 2 (shared interests) | 67 |
| Wedding Planner stage 3 (gender) | 0 |
| Wedding Planner stage 4 (knowing) | 2 |
| Wedding Planner stage 5 (combined) | −60 |

---

## 7. The Julia/JuMP submission (May 22 → 29)

You will receive a problem on **Friday May 22**. You must email the Julia/JuMP code to Thomas by **Friday May 29, 23:59**. **Without this submission, you cannot sit the oral exam.**

### How to approach the new problem

1. **Read the whole problem before doing anything.** Identify the classical OR problem it's a variant of.
2. **Write the model on paper first**, in the standard template. Don't open Julia until you have a written formulation. This is how the course intends you to work.
3. **Code it up incrementally.**
   - First, just read the data and print a few values to confirm sizes.
   - Then code the variables and a *dummy objective* (e.g. `min 42`).
   - Then add constraints one at a time, running `optimize!` after each addition to see the model is still feasible.
   - Finally, add the real objective.
4. **Sanity-check the optimum.** Does the solution make sense? If you minimize, is the objective non-negative when it should be? Does each variable take a sensible value?
5. **Save and email** with subject line `42112 re-exam Julia/JuMP submission [your name]`.

### What to put in the file you submit

```julia
#************************************************************************
# 42112 Re-exam JuMP Submission
# [Your name], [Your student number]
# Date: 2026-05-29
# Problem: [one-sentence description]
#************************************************************************
using JuMP, HiGHS

# ====== Data ======
include("provided_data_file.jl")   # or define inline

# ====== Model ======
m = Model(HiGHS.Optimizer)

# Decision variables
@variable(m, x[...] , Bin)   # explain in a comment what x means

# Objective
@objective(m, Min, ...)       # one-line explanation

# Constraint 1: every X must Y
@constraint(m, [...], ...)

# Constraint 2: ...
@constraint(m, [...], ...)

# ====== Solve ======
optimize!(m)
println("Status: ", termination_status(m))
println("Objective: ", objective_value(m))

# ====== Report ======
# Print the solution in a human-readable way, e.g. one row per family
```

The examiner will read this *and* ask you about it at the oral. Comment generously. Make the structure clear.

### What you should be able to defend at the oral

- **Why** you chose your decision variables (could you have used a different formulation? what would change?)
- **Why** each constraint is correct (in plain English)
- **What** the LP relaxation would look like and roughly what bound it gives
- **How** the model would scale: what if data were 10× bigger?
- **What** changes if a constraint were added or relaxed (e.g. "what if a family could visit on multiple days?")

---

## 8. Self-test (try these without notes)

After studying, sit down with a blank piece of paper and try to write the full model for each of these prompts. Time yourself: aim for under 10 minutes each.

1. **Santa**: 200 children, 30 days, each child has a number of friends with whom they should visit on the same day if possible. Each day must have between 5 and 10 children. Write a model that maximizes the number of "same-day-friend" pairs while obeying the daily limits.

2. **TA Workplan**: There are 6 TAs and a 5-day course. Each TA must work between 30 and 40 hours, and the maximum stretch they can work in one block is 4 hours. Demand is given. Minimize total inconvenience.

3. **Tennis**: Same court, but now the sweeper has *two* brooms (and helps from a friend) and they must between them cover all lines. Each can start and end anywhere, but they must between them traverse every required line. Minimize the total walking distance of both.

4. **Food Festival**: Same problem, but each worker has a maximum of 3 shifts they can work, and some workers are *unavailable* for certain shifts (e.g. worker 1 cannot do shift 5). Minimize hires.

5. **Wedding Planner**: The bride wants the *most* shared interests at the *worst* table to be as high as possible (a maximin objective). Write the model.

(Hints to all five live in the toolkit, sections 4 and 4b. If you can do all five, you're ready.)

---

## 9. Final reminders

- Memorize the **standard template** (Sets / Parameters / Decision variables / Objective / Constraints). Every problem follows it.
- Memorize the **identification table** in section 5: which assignment is which classical OR problem.
- Internalize the **modeling tricks** (section 4b) — these are reusable across problems.
- For the **May 29 submission**, write the math first, then the code. Comment well. Submit on time.
- At the oral, **structure beats speed**. Calm, in-order, in-words wins.
- If you blank: write the standard template headings and start filling them in. The structure will pull the content out of your memory.

Good luck.
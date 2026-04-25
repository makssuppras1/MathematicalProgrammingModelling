# =============================================================================
# 6.1 Young Couple — course book (Table 6.1)
# =============================================================================
# 1.1: Assign each of 4 tasks to Eve or Steven; minimize total person-hours.
#     Optimal: 18.2 h (book).
# 1.2: Same + each person does exactly 2 tasks (fair by count).
#     Optimal: 18.4 h (book).

using JuMP
using HiGHS

task_names = ["Cleaning", "Cooking", "Dishwashing", "Laundry"]
person_names = ["Eve", "Steven"]

tasks = 1:length(task_names)      # 1:4 — use ranges for JuMP (not length alone as axis)
people = 1:length(person_names)   # 1:2

# Table 6.1: task_time[t, p] = hours if person p does task t (rows = tasks, cols = people)
task_time = [
    4.5 4.9
    7.8 7.2
    3.6 4.3
    2.9 3.1
]

# --- Assignment 6.1.1 ---------------------------------------------------------
m1 = Model(HiGHS.Optimizer)
set_optimizer_attribute(m1, "output_flag", false)

# 1.1: Assign each of 4 tasks to Eve or Steven; minimize total person-hours.
@variable(m1, x[tasks, people], Bin)

# minimize total person-hours
@objective(m1, Min, sum(task_time[t, p] * x[t, p] for t in tasks, p in people))

# each task is done by exactly one person
@constraint(m1, one_person[t in tasks], sum(x[t, p] for p in people) == 1)

println("=== 6.1.1 Min total hours ===")
println(m1)
println()
optimize!(m1)
println("Status: ", termination_status(m1), "  objective (book 18.2): ", objective_value(m1))
for t in tasks, p in people
    value(x[t, p]) > 0.5 && println("  ", task_names[t], " → ", person_names[p])
end

# --- Assignment 6.1.2 (fair: same number of tasks each) ---------------------
m2 = Model(HiGHS.Optimizer)
set_optimizer_attribute(m2, "output_flag", false)

# 1.2: Same + each person does exactly 2 tasks (fair by count).
@variable(m2, y[tasks, people], Bin)

# minimize total person-hours
@objective(m2, Min, sum(task_time[t, p] * y[t, p] for t in tasks, p in people))

# each task is done by exactly one person
@constraint(m2, one_person2[t in tasks], sum(y[t, p] for p in people) == 1)

# each person does exactly 2 tasks
@constraint(m2, fair[p in people], sum(y[t, p] for t in tasks) == 2)


println("=== 6.1.2 Min total hours, each does 2 tasks ===")
print(m2)
println()
optimize!(m2)
println()
println("Status: ", termination_status(m2), "  objective (book 18.4): ", objective_value(m2))
for t in tasks, p in people
    value(y[t, p]) > 0.5 && println("  ", task_names[t], " → ", person_names[p])
end

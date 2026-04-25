# How to attack a modelling problem

**Formula:** *sets → one clear meaning per variable → sum for the objective → one constraint per limit or rule → check units and domain.*

---

## 1. What do I control?

Name it in one phrase (e.g. “how much of each product per month”). Everything else is data or a derived quantity.

## 2. Sets (indexing)

List indices you will actually use: products, periods, machines, arcs, … If the story repeats “for each …”, that is usually a set.

## 3. Variables

One variable = one decision quantity (often “amount” or “flow” per index tuple). Do not add variables “just in case.”

## 4. Objective

Max or min? Write it as a **sum** over indices: \(\sum_i (\text{coeff}_i \times \text{var}_i)\). Coefficients come from the text (profit, cost, time, …).

## 5. Constraints (main work)

For **each** limit or rule in the text, write **one** (family of) constraint(s):

| Pattern        | Typical form                          |
|----------------|----------------------------------------|
| Capacity       | usage \(\leq\) limit                   |
| Fixed demand   | flow or production \(=\) requirement   |
| Choice / split | sums that must equal 1 or total        |
| Inventory / time | balance: *in + produced = out + used* |

Ask: *per which index is this limit?* (per machine, per month, global, …)

## 6. Time / inventory (only if the story has “carry over” or periods)

Link consecutive periods with a balance: what enters the period plus what is created equals what leaves plus what stays.

## 7. Units

One time unit everywhere (e.g. all minutes or all hours). Check that left-hand side and right-hand side match.

## 8. Domain

LP: continuous \(\geq 0\) unless the text says otherwise. Integer/binary only when the story requires indivisible or yes–no decisions.

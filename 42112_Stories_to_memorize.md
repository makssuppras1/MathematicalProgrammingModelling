# 42112 — Memorable Stories Cheat Sheet

---

## §6.5 Micro Brewery 2

**The story:** A brewer can only run one beer through the tank per month. Everything you don't sell sits in storage costing money.

| Element | Story |
|---|---|
| **Demand[b,m]** | Thirsty customers — how many litres they want this month |
| **BrewCap = 120** | The tank holds 120 litres max |
| **StoreCap = 300** | The cellar holds 300 litres total |
| **Cost = 0.1** | Every litre sitting in the cellar costs 10 cents a month |
| **InitialStorage[b]** | What's already in the cellar when you start January |
| **x[b,m]** | How much you brew this month |
| **y[b,m]** | How full the cellar is at the end of the month |
| **q[b,m]** | Did the brewery run this month? Yes or no |
| **Objective** | Minimise the cellar bill — every litre stored costs money |
| **Inventory balance** | Cellar tonight = cellar last night + what you brewed − what you sold |
| **x ≤ BrewCap · q** | You can't brew anything if the brewery isn't running, and if it is, max 120L |
| **∑q ≤ 1** | Only one tap on the tank — one beer type at a time |
| **∑y ≤ StoreCap** | The cellar only fits 300 litres total |

---

## §6.9 TA Workplan

**The story:** Four teaching assistants need to staff a help desk. Students need help at specific times. TAs hate inconvenient shifts. Nobody should arrive, leave, come back.

| Element | Story |
|---|---|
| **Demand[p,d]** | How many TAs must be at the desk at this hour |
| **Inconvenience[ta,p,d]** | How much this particular TA hates this particular slot |
| **x[ta,p,d]** | Is this TA standing at the desk right now? |
| **y[ta,p,d]** | Did this TA just walk in the door this slot? |
| **Objective** | Minimise total TA misery |
| **∑x ≥ Demand** | Enough bodies at the desk every hour |
| **∑x = 52** | Each TA works their contracted hours, no more, no less |
| **∑y ≤ 1** | You can only arrive once per day |
| **x ≤ x_prev + y** | You're only here if you were here last hour, or you just arrived |
| **∑x ≥ 2·∑y** | If you bothered coming in, you stay at least 2 hours |

---

## §6.12 Tennis

**The story:** A court sweeper must drag a brush over every line. They can walk between lines freely but want to minimise total footsteps.

| Element | Story |
|---|---|
| **Distance[p1,p2]** | How far apart two intersection points are |
| **Lines[p1,p2]** | Is there a line between these two points that needs sweeping? |
| **x[p1,p2]** | Does the sweeper walk from point A to point B? |
| **s[p]** | Did the sweeper start their shift here? |
| **e[p]** | Did the sweeper finish their shift here? |
| **Objective** | Minimise total steps taken |
| **Flow conservation** | Every time you walk into a point, you also walk out — you can't teleport |
| **∑s = 1, ∑e = 1** | One place to start, one place to finish |
| **x[p1,p2] + x[p2,p1] ≥ Lines** | Every line gets swept — at least one direction |
| **fix(s/e = 0 for interior)** | You can't start or end in the middle of the court — you'd have to walk back across clean clay |

---

## §6.14 Tariff Rates

**The story:** A power company decides each night how many generators to run across five time blocks. Starting a generator costs a one-time fee. The plan repeats every day, so yesterday's last shift is today's first shift's predecessor.

| Element | Story |
|---|---|
| **PDEM[h]** | How hungry the grid is in this time block |
| **NHP[h]** | How many hours this block lasts |
| **NG[p]** | How many generators of this type the company owns |
| **MINL/MAXL[p]** | Every generator has a minimum it must run at, and a ceiling it can't exceed |
| **MINC[p]** | What it costs per hour just to keep one generator ticking over at minimum |
| **PC[p]** | Extra cost per MW above minimum — ramping up is expensive |
| **STARTC[p]** | The ignition fee — every time a cold generator starts |
| **nRun[p,h]** | How many of this generator type are humming right now |
| **prod[p,h]** | Total MW this generator type is actually pushing to the grid |
| **nStart[p,h]** | How many generators of this type just switched on this block |
| **Objective** | Pay the running bill + the ramping bill + the ignition bill |
| **prod ≥ MINL · nRun** | A running generator can't idle below its minimum — physics |
| **prod ≤ MAXL · nRun** | A running generator can't exceed its rated maximum — also physics |
| **∑prod ≥ PDEM** | The lights stay on — demand is always met |
| **nStart ≥ nRun − nRun_prev** | If more are running now than last block, someone must have pressed the start button |
| **∑MAXL · nRun ≥ 1.15 · PDEM** | Even if demand spikes 15%, enough generators are warm to cover it |

---

## §6.17 Wedding Planner

**The story:** A wedding planner seats 20 guests across 3 tables. Couples must stay together. Beyond that, the planner wants guests who share interests close together, genders balanced, and nobody surrounded by strangers.

| Element | Story |
|---|---|
| **TableCap = 9** | No table can be crowded beyond 9 seats |
| **Couple[g1,g2]** | These two come as a package deal |
| **SharedInterests[g1,g2]** | How much these two have to talk about |
| **Male[g] / Female[g]** | Guest g's gender flag |
| **Know[g1,g2]** | Do these two already know each other? |
| **x[g,t]** | Is this guest sitting at this table? |
| **y[g1,g2,t]** | Are these two guests sitting at the same table? |
| **m[t] / f[t]** | How many too many men / women are at this table beyond the allowed imbalance of 2 |
| **k[g]** | How many familiar faces this guest is missing — shortfall below 3 known people |
| **Objective 17.2** | Pack each table with people who have things in common |
| **Objective 17.3** | Minimise gender imbalance across tables |
| **Objective 17.4** | Minimise the number of guests who feel like strangers |
| **Objective 17.5** | Do all three at once |
| **∑x = 1** | Every guest sits somewhere — exactly once |
| **∑x ≤ TableCap** | Don't overcrowd the table |
| **x[g1,t] = x[g2,t]** | Couples are glued together |
| **y ≤ x[g1,t]; y ≤ x[g2,t]** | You can only count a pair as "together" if both are actually at that table |
| **Male·x − Female·x ≤ 2 + m[t]** | At most 2 more men than women — or pay a penalty |
| **k − 3·x + ∑Know·y ≥ 0** | At your table you should know at least 3 people — or the shortfall is counted against you |

---

## SIP Production Planning

**The story:** A 3D printing shop picks which customer orders to run today. Three machines all have 8-hour limits. In Assignment 2, delivering to a buyer costs a flat fee whether you send them one item or ten.

| Element | Story |
|---|---|
| **Price[i]** | What the customer offered to pay |
| **PrintTime / PolishTime / PaintTime[i]** | How long each machine needs for this item |
| **Minutes = 480** | Each machine runs for 8 hours — then it stops |
| **BuyerId[i]** | Whose order is this item part of? |
| **TransportCost = 50** | One delivery van per buyer, regardless of how many items |
| **x[i]** | Do we produce this item today? |
| **y[b]** | Are we sending a delivery to this buyer today? |
| **Objective 1** | Maximise today's revenue |
| **Objective 2** | Maximise revenue minus delivery costs |
| **∑PrintTime · x ≤ 480** | The printer can't run beyond its shift |
| **∑PolishTime · x ≤ 480** | The polisher can't run beyond its shift |
| **∑PaintTime · x ≤ 480** | The painter can't run beyond its shift |
| **x[i] ≤ y[BuyerId[i]]** | You can't produce an item without sending a delivery to its buyer |

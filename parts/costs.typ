/// Costs computations for the project plan


#let round = calc.round.with(digits: 2)


// TODO
/// Personnel costs:
/// - `role`: Role
/// - `hours`: Number of hours
/// - `cph`: Cost per hour
/// - `total`: Total cost
#let personnel-costs = (
  (role: [Project manager], hours: 1.5, cph: 65),
  (role: [Analyst], hours: 1.5, cph: 35),
  (role: [Programmer], hours: 1.5, cph: 30),
  (role: [Tester], hours: 1.5, cph: 20),
).map(p => (..p, total: p.hours * p.cph)) // compute totals

#let total-personnel-costs = personnel-costs.map(p => p.total).sum()


// TODO
/// Equipment costs:
/// - `item`: Item name
/// - `c`: Cost
/// - `d`: Duration
/// - `u`: Usage
/// - `D`: Depreciation
/// - `C`: Chargeable cost
#let equipment-costs = (
  (item: [Laptop], c: 1, u: 1, d: 1, D: 1),
).map(i => (..i, C: i.c * i.u * i.d / i.D)) // compute chargeable cost

#let total-equipment-costs = equipment-costs.map(i => i.C).sum()

// TODO
/// Indirect costs
/// - `resource`: Resource name
/// - `unit`: Resource measuring unit
/// - `count`: Number of units used
/// - `cpu`: Cost per unit
/// - `total`: Total cost
#let indirect-costs = (
  (resource: [Project manager], unit: $k W h$, count: 1.5, cpu: 65),
).map(r => (..r, total: r.count * r.cpu)) // compute totals

#let total-indirect-costs = indirect-costs.map(r => r.total).sum()

#let total-costs = (
  total-personnel-costs + total-equipment-costs + total-indirect-costs
)


/// Project cost increments
/// - `name`: Increment name
/// - `inc`: Increment factor
/// - `partial`: Partial cost
/// - `agg`: Aggregated cost
#let increments = (
  (
    (name: [Project cost], inc: 0),
    (name: [Risk], inc: .2),
    (name: [Benefits], inc: .15),
    (name: [Tax], inc: .21),
  )
    // compute partial and aggregated costs
    .fold((arr: (), agg: total-costs), (state, item) => {
      let partial-cost = state.agg * item.inc
      let agg-cost = state.agg * (1 + item.inc)
      let newItem = (..item, partial: partial-cost, agg: agg-cost)

      (arr: state.arr + (newItem,), agg: agg-cost)
    })
    .arr
)

#let total-offer = increments.map(i => i.partial).sum()

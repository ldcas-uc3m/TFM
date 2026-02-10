/// Costs computations for the project plan


#let total-hours = 25 * 4 * 13


/// Personnel costs:
/// - `role`: Role
/// - `hours`: Number of hours
/// - `cph`: Cost per hour
/// - `total`: Total cost
#let personnel-costs = (
  (role: [Project manager], hours: 5 * 4 * 13, cph: 20),
  (role: [Analyst], hours: 400, cph: 15),
  (role: [Programmer], hours: 700, cph: 10),
  (role: [Tester], hours: 200, cph: 12),
).map(p => (..p, total: p.hours * p.cph)) // compute totals

#let total-personnel-costs = personnel-costs.map(p => p.total).sum()


/// Equipment costs:
/// - `item`: Item name
/// - `c`: Cost
/// - `d`: Duration
/// - `u`: Usage
/// - `D`: Depreciation
/// - `C`: Chargeable cost
#let equipment-costs = (
  (item: [Laptop], c: total-hours, u: .7, d: 13, D: 7 * 12),
  (item: [Monitor], c: 149.99, u: 1, d: 13, D: 8 * 12),
  (item: [Video cable], c: 7.99, u: .3, d: 13, D: 3 * 12),
  (item: [Software], c: 0, u: .4, d: 13, D: 10 * 12),
).map(i => (..i, C: i.c * i.u * i.d / i.D)) // compute chargeable cost

#let total-equipment-costs = equipment-costs.map(i => i.C).sum()


/// Indirect costs
/// - `resource`: Resource name
/// - `unit`: Resource measuring unit
/// - `count`: Number of units used
/// - `cpu`: Cost per unit
/// - `total`: Total cost
#let indirect-costs = (
  (
    resource: [Electricity],
    unit: $k W h$,
    count: ((80 + 20) * total-hours) / 1000,
    cpu: .1282,
  ),
  (resource: [Internet], unit: $"month"$, count: 13, cpu: 11.69),
  (resource: [Transportation], unit: $"month"$, count: 13, cpu: 10),
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

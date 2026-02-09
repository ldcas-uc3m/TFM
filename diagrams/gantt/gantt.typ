/* GANTT config, lifted from the manual */

// Import the base library
#import "@preview/gantty:0.5.1" as gantty
// Here we import many drawers
#import gantty: (
  dependencies.orthogonal-dependencies-drawer, dividers.default-dividers-drawer,
  drawers.default-drawer, field.default-field-drawer, gantt,
  milestones.default-milestones-drawer, sidebar.default-sidebar-drawer,
  task.default-tasks-drawer,
)

// And some specific drawers for headings
#import gantty.header: (
  default-headers-drawer, default-month-header, default-week-header,
)

// (This is a library I've found to help render patterns better)
#import "@preview/modpattern:0.1.0": modpattern
// Here is the pattern we create with it.
#let hatched = modpattern((4pt, 4pt))[
  #place(line(start: (100%, 0%), end: (0%, 100%)))
]

// Now, let us configure how our Gantt chart will be drawn
#let drawer = (
  // Firstly, we configure the sidebar:
  sidebar: default-sidebar-drawer.with(
    // We override how the sidebar items are formatted so that the
    // toplevel tasks appear right-justified in a normal font
    formatters: ((task => align(right, task.name)),),
    // We don't style any dividers between any of the items.
    dividers: (none,),
  ),
  // Nor do we style any dividers in the Gantt chart as a whole.
  dividers: default-dividers-drawer.with(styles: (none,)),
  // Let us choose which headers we want
  headers: default-headers-drawer.with(
    headers: (
      // Namely the month header, but without any gridlines
      default-month-header(gridlines-style: none),
      // And the week header, with a dashed gridline
      default-week-header(gridlines-style: (
        stroke: (paint: black, dash: "loosely-dashed", thickness: 0.5pt),
      )),
    ),
  ),
  // Next we configure tasks.
  tasks: default-tasks-drawer.with(
    // We represent tasks as white rectangles with black outlines.
    // We use our hatched pattern for the any section made redundant by
    // completeing early.
    styles: (
      (
        uncompleted: (style: (stroke: black), width: 8pt),
        completed-early: (
          timeframe: (style: (stroke: black), width: 8pt),
          body: (style: (stroke: black, fill: hatched), width: 8pt),
        ),
        completed-late: (
          timeframe: (style: (fill: black), width: 8pt),
          body: (style: (stroke: black), width: 8pt),
        ),
      ),
    ),
  ),
  // We choose to draw dependencies with a nondefault drawer. This lets us
  // render them as straight lines, more infitting with our design as a whole.
  dependencies: orthogonal-dependencies-drawer.with(style: (
    stroke: black + 0.75pt,
    radius: 5pt,
    mark: (end: "straight"),
  )),
  // default fields
  field: default-field-drawer,
  // And finally, don't show the today milestone
  milestones: default-milestones-drawer.with(today-content: none),
)

// draw the diagram
#let diagram = gantt(yaml("gantt.yaml"), drawer: drawer)
#diagram

#import "@preview/gantty:0.5.1": gantt

#let data = yaml("gantt.yaml")

#let short = (
  ..data,
  // remove subtasks
  tasks: data.tasks.map(t => {
    if "subtasks" in t {
      return (
        name: t.name,
        // infer start/end from subtasks
        intervals: (
          (
            start: t.subtasks.at(0).start,
            end: t.subtasks.at(-1).end,
          ),
        ),
      )
    }
    t
  }),
)


#let diagram = gantt(short)
#diagram

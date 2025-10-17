// LTeX: enabled=false

#import "@preview/cetz:0.4.2"


#cetz.canvas({
  import cetz.draw: *
  import cetz.decorations: *

  let box-height = .5

  set-style(
    content: (frame: "rect", stroke: none, fill: none, padding: .1),
    mark: (stroke: (dash: none)),
  )

  let dash-stroke = (dash: "dashed")

  /* interrupt register */

  // base
  rect((), (rel: (1.5, box-height)), name: "base")
  content("base", text(size: .8em)[`0B 00 B5`], anchor: "mid")
  brace(
    (rel: (0, -.05), to: "base.south-west"),
    (rel: (0, -.05), to: "base.south-east"),
    thickness: 0.020cm,
    name: "base-brace",
    flip: true,
  )
  content(
    (rel: (0, -.2), to: "base-brace"),
    text(size: .8em)[`base`],
    anchor: "north",
    name: "base-content",
  )

  line(
    (rel: (0, -.2), to: "base-content"),
    (rel: (0, (-3 * box-height) + .75)),
    stroke: dash-stroke,
  )
  line((), (rel: (2.4, 0)), stroke: dash-stroke)
  line((), (rel: (0, 2.15)), stroke: dash-stroke)
  line((), (rel: (.65, 0)), mark: (end: "straight"), stroke: dash-stroke)

  // excode
  rect("base.mid", (rel: (1, box-height)), name: "excode")
  content("excode", text(size: .8em)[`00 0C`], anchor: "mid")
  brace(
    (rel: (0, -.05), to: "excode.south-west"),
    (rel: (0, -.05), to: "excode.south-east"),
    thickness: 0.020cm,
    name: "excode-brace",
    flip: true,
  )
  content(
    (rel: (0, -.2), to: "excode-brace"),
    text(size: .8em)[`type`],
    anchor: "north",
    name: "excode-content",
  )

  line(
    (rel: (0, -.2), to: "excode-content"),
    (rel: (0, (-2 * box-height) + .7)),
  )
  line((), (rel: (1.8, 0)), mark: (end: ")>"))

  // title
  content((rel: (-.7, .3), to: "excode.north"), [Interrupt register])


  /* interrupt vector table */
  for i in range(5) {
    let id = "iv" + str(i)

    // interrupt vector
    rect(
      (rel: (2.5, -i * box-height), to: "excode"),
      (rel: (3, box-height)),
      name: id,
    )
    content((id), text(size: .8em)[Interrupt Vector #i], anchor: "mid")

    // offset
    rect(
      (id + ".south-west"),
      (rel: (-.65, box-height)),
      name: id + "offset",
    )
    content(
      id + "offset.east",
      text(size: .8em)[`+`#raw(upper(str(4 * i, base: 16)))],
      anchor: "east",
    )
  }

  // title
  content((rel: (-.3, .3), to: "iv0.north"), [Interrupt vector table])

  /* handler address */
  line("iv3.east", (rel: (1.25, 0)), mark: (end: ")>"))
  rect((rel: (.05, -box-height / 2)), (rel: (2, box-height)), name: "handler")
  content("handler", text(size: .8em)[`0x00C0FFEE`])
  content((rel: (0, .3), to: "handler.north"), [Handler address])
})

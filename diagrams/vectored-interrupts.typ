#import "@preview/cetz:0.4.2"

#cetz.canvas({
  import cetz.draw: *

  let box-height = .5

  set-style(content: (frame: "rect", stroke: none, fill: none, padding: .1))

  // exception code
  rect((), (rel: (2.5, box-height)), name: "type")
  content("type", text(size: .8em)[`0x00000008`], anchor: "mid")
  content((rel: (0, .3), to: "type.north"), [Exception code])

  line("type.south", (rel: (0, -box-height)))
  line((), (rel: (2, 0)), mark: (end: ">"))

  // interrupt vector table
  for i in range(4) {
    let id = "iv" + str(i)

    // interrupt vector
    rect(
      (rel: (2.7, -i * box-height), to: "type"),
      (rel: (4, box-height)),
      name: id,
    )
    content((id), text(size: .8em)[Interrupt Vector #i], anchor: "mid")

    // offset
    content(
      (rel: (-.1, 0), to: "iv" + str(i) + ".west"),
      [`+`#raw(str(4 * i, base: 16))],
      anchor: "mid-east",
    )
  }
  content((rel: (0, .3), to: "iv0.north"), [Interrupt vector table])

  // handler address
  line("iv2.east", (rel: (1.5, 0)), mark: (end: ">"))
  rect((rel: (0, -box-height / 2)), (rel: (2.5, box-height)), name: "handler")
  content("handler", text(size: .8em)[`0x00c0ffee`])
  content((rel: (0, .3), to: "handler.north"), [Handler address])
})

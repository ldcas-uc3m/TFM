//! Auxiliar helper macros
// LTeX: enabled=false

#import "/uc3m-thesis-ieee-typst/arguments.typ": format-value

/// Auxiliar table.header
#let table-header(..children, repeat: true) = {
  (table.header(..children, repeat: repeat), table.hline())
}


/// Scales content to the desired width/height relative to its container.
///
/// - body (content): The content to scale
/// - width (ratio, auto): Desired width (relative to its container)
/// - height (ratio, auto): Desired heigth (relative to its container)
/// -> content
#let scale-to-container(body, width: auto, height: auto) = layout(ly => {
  if width == auto and height == auto { return body }

  scale(
    x: if width == auto { auto } else { ly.width * width },
    y: if height == auto { auto } else { ly.height * height },
    reflow: true,
    body,
  )
})



#import "@preview/lovelace:0.3.0": line-label, pseudocode-list


/// Creates an algorithm figure, using the `lovelace` package.
///
/// - body (content): Argument to be passed to `lovelace:pseudocode-list`
/// - title (content, none): Algorithm title
/// - label (label, none): Figure label
/// - width (auto, fraction, relative): Width of the figure
/// - placement (auto, none, alignment): Figure placement
/// -> content
#let algorithm(body, title: none, label: none, width: 75%, placement: auto) = [
  // for some reason, setting `placement` to `auto` breaks `line-label` (see
  // https://github.com/andreasKroepelin/lovelace/issues/28)
  #set figure(placement: none)

  #figure(
    box(
      width: width,
      pseudocode-list(
        body,
        line-numbering: "1:",
        booktabs: true,
        booktabs-stroke: 0.7pt + black,
        // hooks: .5em,
        indentation: 1.5em,
        numbered-title: title,
      ),
    ),
    caption: title,
    kind: "algorithm",
    supplement: [Algorithm],
    placement: placement,
  )
  #if label != none {
    assert(
      type(label) == std.label,
      message: "You must provide a label, e.g. `<alg:stuff>`",
    )
    label
  }
]


/// Creates an inline comment inside `algorithm`.
///
/// - body (content): Comment
/// -> content
#let alg-comment(body) = {
  h(1fr)
  set text(size: .9em)
  sym.gt.tri
  [~]
  emph(body)
}


/// Prints the number and name of the specified heading.
///
/// - label (label): Heading label
/// -> content
#let headref(label) = context {
  let el = query(label).first()
  assert(el.func() == heading, message: "Label must reference a heading")

  ref(label)
  [, ]
  link(el.location(), emph(el.body))
}

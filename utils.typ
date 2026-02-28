//! Auxiliar helper macros
// LTeX: enabled=false

#import "@preview/oxifmt:1.0.0": strfmt
#import "@preview/metalogo:1.2.0": LaTeX, TeX



/// Auxiliar table.header
///
/// Usage:
/// ```typc
/// table(
///   // ...
///   ..table-header([], ...),
/// )
/// ```
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


/// Creates an algorithm figure, using the `lovelace` package. These will be of kind `"algorithm"`.
///
/// - body (content): Argument to be passed to `lovelace:pseudocode-list`
/// - title (content, none): Algorithm title
/// - label (label, none): Figure label
/// - width (auto, fraction, relative): Width of the figure
/// - placement (auto, none, alignment): Figure placement
/// -> content
#let algorithm(body, title: none, label: none, width: auto, placement: auto) = [
  // for some reason, setting `placement` to `auto` breaks `line-label` (see
  // https://github.com/andreasKroepelin/lovelace/issues/28)
  #set figure(placement: none)

  // don't show the figure caption, as we're already including it inside the
  // figure
  // however, we don't set caption to `none` bc we want the caption to be shown
  // in the list of algorithms
  #show figure.caption: {}

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
    caption: title, // we want to show it on TOC
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
  sym.space.nobreak
  emph(body)
}


/// Prints the number and name of the specified heading.
///
/// - label (label): Heading label
/// -> content
#let headref(label) = context {
  let label-ref = query(label)
  assert(
    label-ref.len() != 0,
    message: strfmt("Label '{}' not found!", label),
  )
  let el = label-ref.first()
  assert(el.func() == heading, message: "Label must reference a heading")

  ref(label)
  [, ]
  // link(el.location(), emph(el.body))
  emph(el.body)
}


/// Prints the number and name of the specified heading.
///
/// - label (label): Heading label
/// -> content
#let algref(label) = context {
  let el = query(label).first()
  assert(el.kind == "algorithm", message: "Label must reference an algorithm")

  [ #emph(el.caption.body) (#ref(label)) ]
}


/// Like LaTeX's `\noindent`, removes the first-line indentation of the paragraph.
///
/// - body (content): Content.
/// -> content
#let noindent(body) = {
  set par(first-line-indent: 0pt)
  body
}


/// Creates an inline comment inside `tree-list`.
///
/// - body (content): Comment
/// -> content
#let tree-comment(body) = {
  sym.space.nobreak
  box(width: 1fr, repeat([.], gap: 2pt))
  sym.space.nobreak
  emph(body)
}


/// Formats the specified quantity as a two-digit number
#let round = calc.round.with(digits: 2)


/// Formats the specified value as money.
/// - value (int | float): Value to format
/// -> content
#let money(value) = {
  $#strfmt(
    "{:.2}",
    float(value),
    fmt-decimal-separator: ",",
    fmt-thousands-separator: ".",
  ) euro$
}


/// Put big-ass things in a new page, rotated
///
/// - body (content): Body
/// -> content
#let big-ass-thing(body) = page(
  // TODO: visually rotate page, but keep the header on the short side
  // see: https://github.com/typst/typst/discussions/4138
  place(
    horizon + center,
    rotate(
      -90deg,
      reflow: true,
      body,
      // [
      //   #figure(table, caption: caption, placement: none)
      //   #if label != none {
      //     assert(
      //       type(label) == std.label,
      //       message: "You must provide a label, e.g. `<alg:stuff>`",
      //     )
      //     label
      //   }
      // ],
    ),
  ),
)


/// Places a bunch of figures "right here" (`placement: none`).
///
/// - body (content): Body containing figures
/// -> content
#let right-here(body) = {
  set figure(placement: none)
  body
}

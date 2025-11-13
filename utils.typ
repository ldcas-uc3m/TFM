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



#import "@preview/lovelace:0.3.0": pseudocode-list

/// Creates an algorithm figure, using the `lovelace` package. Its label is `alg:<id>`.
///
/// - body (content): Argument to be passed to `lovelace:pseudocode-list`
/// - title (content, none): Algorithm title
/// - id (str, none): Algorithm ID, used for the label
/// - id (str, none): Algorithm ID, used for the label
/// - width (auto, fraction, relative): Width of the figure
/// -> content
#let algorithm(body, title: none, id: none, width: 75%) = [
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
  )
  #if id != none {
    label("alg:" + id)
  }
]

/// Creates an inline comment inside `algorithm`.
///
/// - body (content): Comment
/// -> content
#let alg-comment(body) = {
  h(1fr)
  sym.gt.tri
  [~]
  smallcaps(body)
}

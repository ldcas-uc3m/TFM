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
  let body-size = measure(body)

  scale(
    x: if width == auto { auto } else { ly.width / body-size.width * width },
    y: if height == auto { auto } else { ly.height / body-size.height * height },
    reflow: true,
    body,
  )
})


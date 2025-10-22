//! Auxiliar helper macros
// LTeX: enabled=false

#import "/uc3m-thesis-ieee-typst/arguments.typ": format-value

/// Auxiliar table.header
#let table-header(..children, repeat: true) = {
  (table.header(..children, repeat: repeat), table.hline())
}

/// Computes the current page's textwidth
///
/// - page (function): Typst's `page` function
/// -> length
#let textwidth(page) = {
  // Margins are set automatically to 2.5/21 times the smaller dimension of the
  // page.
  let default-margin = (2.5 / 21) * calc.min(page.width, page.height)

  if page.margin == auto {
    return page.width - (2 * default-margin)
  }

  if "x" in page.margin {
    return page.width - (2 * page.margin.x.length)
  }

  let left-margin = if "left" in page.margin {
    page.margin.left.length
  } else if "inside" in page.margin {
    page.margin.inside.length
  } else if "rest" in page.margin {
    page.margin.rest.length
  } else { default-margin }

  let right-margin = if "right" in page.margin {
    page.margin.right.length
  } else if "outside" in page.margin {
    page.margin.outside.length
  } else if "rest" in page.margin {
    page.margin.rest.length
  } else { default-margin }

  return page.width - left-margin - right-margin
}

/// Scales content to the desired width.
///
/// - body (content):
/// - width (fraction): desired width
/// -> content
#let scale-to-width(body, width: 100%) = context {
  let body-width = measure(body).width
  scale(textwidth(page) / body-width * width, reflow: true, body)
}


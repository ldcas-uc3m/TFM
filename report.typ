// LTeX: enabled=false

#import "uc3m-thesis-ieee-typst/lib.typ": conf
#import "glossary.typ": glossary-entries


#show: conf.with(
  degree: "Máster Universitario en Ingeniería Informática",
  title: "Implementing Interrupts, Timers, and Memory-Mapped I/O in CREATOR",
  // short-title: "",
  author: "Luis Daniel Casais Mezquida",
  advisors: ("Félix García Carballeira", "Alejandro Calderón Mateos"),
  location: "Leganés, Madrid",
  thesis-type: "TFM",
  date: datetime(year: 2026, month: 2, day: 20),
  language: "en",
  style: "fancy",
  // titlepage-style: "fancy",
  license: true,
  double-sided: true,
  flyleaf: true,
  bibliography-content: bibliography("references.bib", style: "ieee"),
  epigraph: (
    quote: [`git commit -m "minor updates"`],
    author: "Alejandro Calderón",
    // source: "",
  ),
  abstract: (
    body: [Minor updates.],
    // see
    // https://www.ieee.org/content/dam/ieee-org/ieee/web/org/pubs/ieee-taxonomy.pdf
    keywords: ("Computer science education", "Digital simulation"),
  ),
  acknowledgements: [Mi churri.],
  outlines: (
    // contents is compulsory
    figures: true,
    tables: true,
    listings: false,
    // custom: []
  ),
  // appendixes: [],
  // glossary: glossary-entries,
  // abbreviations: (TFM: "Trabajo de Fin de Máster"),
  genai-declaration: (usage: false),
)


/* Custom set/show rules */

// no numbering on headings above level 4
// the following doesn't work bc we're overriding the heading show in lib
// ```typ
// #show heading: it => {
//   if (it.level >= 4) {
//     set heading(numbering: none)
//     it
//   } else { it }
// }
// ```
#show (
  heading
    .where(level: 4)
    .or(
      heading.where(level: 5),
    )
): set heading(numbering: none)


// more space around figures
// https://stackoverflow.com/questions/78622060/add-spacing-around-figure-in-typst
#show figure.where(kind: image).or(figure.where(kind: table)): it => {
  let spacing = 0.75em

  if it.placement == none {
    block(it, inset: (y: spacing))
  } else {
    place(
      it.placement,
      float: true,
      clearance: spacing,
      block(align(center, it), width: 100%),
    )
  }
}

// indent lists
#set list(indent: 1em)
#set enum(indent: 1em)

// prevent floating elements from spilling into the next section
#show heading.where(level: 2): it => {
  place.flush()
  it
}

// "booktab" table style
#show table: block.with(stroke: (y: 0.7pt))
#set table(column-gutter: .2em, stroke: none)
#set table.hline(stroke: 0.4pt)

// code font
#show raw: set text(font: "CaskaydiaCove NFM")


/* Thesis */

#include "parts/introduction.typ"
#include "parts/state_of_the_art.typ"
#include "parts/analysis.typ"
#include "parts/design.typ"
#include "parts/implementation.typ"
#include "parts/verification.typ"
#include "parts/project_plan.typ"
#include "parts/conclusions.typ"



// glossary
// #import "@preview/glossarium:0.5.9": gls, glspl
// #gls("API")



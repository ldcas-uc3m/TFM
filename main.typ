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

// more space around figures
// https://github.com/typst/typst/issues/6095#issuecomment-2755785839
#show figure.where(kind: image).or(figure.where(kind: table)): it => {
  let figure_spacing = 0.75em

  if it.placement == none {
    block(it, inset: (y: figure_spacing))
  } else if it.placement == top {
    place(it.placement, float: true, block(
      width: 100%,
      inset: (bottom: figure_spacing),
      align(center, it),
    ))
  } else if it.placement == bottom {
    place(it.placement, float: true, block(
      width: 100%,
      inset: (top: figure_spacing),
      align(center, it),
    ))
  }
}



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



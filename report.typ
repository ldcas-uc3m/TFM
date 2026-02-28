// LTeX: enabled=false

#import "uc3m-thesis-ieee-typst/lib.typ": conf
#import "glossary.typ": glossary-entries


#show: conf.with(
  degree: "Máster Universitario en Ingeniería Informática",
  title: "Implementing Interrupts, Timers, and Memory-Mapped I/O in CREATOR",
  // short-title: "Implementing Interrupts, Timers, and MMIO in CREATOR",
  author: "Luis Daniel Casais Mezquida",
  advisors: ("Alejandro Calderón Mateos",),
  location: "Leganés, Madrid",
  thesis-type: "TFM",
  date: datetime(year: 2026, month: 2, day: 11),
  language: "en",
  style: "fancy",
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
    body: [
      CREATOR is a didactic and generic assembly language simulator that
      simulates the behaviour of different Instruction Set Architecture (ISA).
      It is used in computer structure and computer architecture courses around
      the world as a tool where students can apply their theoretical knowledge
      in a friendly interface.

      One of the most requested features by university professors is support for
      interrupts. Due to the current geopolitical and commercial climate, where
      chip design has become crucial for a country's economic independence, and
      open and modular standards such RISC-V thrive, understanding interrupts
      and timers---some of the bases of computer hardware---has become
      paramount. Furthermore, in a technological age in which high-performance
      computation through the use of specialized devices such as GPUs is
      becoming increasingly more important, understanding how these devices
      communicate and syncronize with the CPU is critical.

      This thesis describes the design and implementation of these features in
      the CREATOR simulator, and the challenges and solutions found along the
      way.

      // le falta algo, pero ni se me ocurre ni tengo tiempo de que se me ocurra
    ],
    // see
    // https://www.ieee.org/content/dam/ieee-org/ieee/web/org/pubs/ieee-taxonomy.pdf
    keywords: (
      "Computer science education",
      "Digital simulation",
      "Interrupts",
      "I/O",
    ),
  ),

  acknowledgements: [
    // #strike[Mi cuchipurruchi.] Nadie. Estoy jodidamente solo.

    // amigos y familia (no hay novia esta vez)
    It is tradition to thank family and friends first, so I'll start by thanking
    my parents. This time around they didn't #quote[pay for the dammned
      thing]---I did, with my hard work, while also paying for hospitals and
    roads---but they did support me throughout. My friends also supported me,
    although they just listened to me while I screamed about JavaScript or some
    other crap, politely nodding. Still, they helped me relax by telling jokes
    or doing stupid stuff, and listened to my feelings and tales of my
    (somewhat) sad life. I would be very bored without all of them.

    // colegas del proyecto: Alex, Félix, Jorge, Diego, Alvaro, Elisa
    Although this thesis _is_ a project, it was also part of a bigger project,
    which was also my job, at the ARCOS research group. There are some truly
    smart and wonderful people there, but I do have to name the ones I was
    actually _supposed_ to be working and talking to. Alex, my tutor, is one of
    those trully wonderful persons that's good to its core. The guy just wants
    to learn about cool (computer) stuff, share the knowledge, and reap the
    benefits of seing people making even cooler stuff; but he also has a couple
    of left hands to deal with weird administrative and/or technical problems,
    finding solutions that nobody else would think of (for better or for worse).
    Félix, similarly to Alex, also offered great guidance on what the features
    were supposed to be doing, and where to go and search for the information
    about how to do it. Jorge, my _brother in arms_, was a great juxtaposition
    to my programming style and personality, and I probably learnt more from him
    than he did from me. I also have to thank Diego, CREATOR's creator (sic),
    who was always had the patience for answering my questions about the code,
    and Álvaro and Elisa, who worked on different parts of the project, but
    helped me when I needed to interact with them.

    // GUL
    I also want to give a special thanks to _el GUL_. It's a wonderful set of
    (arguably weird) people willing to share their time, knowledge and
    excitement. My time has come to step down from the role of voluntary
    dictator, but I know I have left the position in good hands, and that I can
    come back 20 years from now and still find "Linux freaks" doing cool stuff
    together at this university.


    // colegas de carrera (brothers in arms) y profes
    I can't forget to thank my teachers, specially Carlos Galán (the great
    musician), and my fellow classmates, in particular Fran, Diego, and Lucas.
    They made this sixth year of my bachelor's degree more bearable.

    // comunidad software libre
    Finally, I want to thank the free software community. Great people doing
    great things for the sake of doing them. Please God don't let AI slop ruin
    this.
  ],

  outlines: (
    // contents is compulsory
    figures: true,
    tables: true,
    custom: (
      outline(
        title: [List of algorithms],
        target: figure.where(kind: "algorithm"),
      ),
    ),
  ),

  // appendixes: [],
  // glossary: glossary-entries,

  abbreviations: (
    ISA: "Instruction Set Architecture",
    UI: "User Interface",
    GUI: "Graphical User Interface",
    CLI: "Command Line Interface",
    CPU: "Central Processing Unit",
    "I/O": "Input/Output",
    MMIO: "Memory-Mapped Input/Output",
    API: "Application Programming Interface",
    CAPI: "CREATOR API",
    AI: "Artificial Intelligence",
    IoT: "Internet of Things",
    PC: "Program Counter",
    GPU: "Graphics Processing Unit",
    FOSS: "Free Open-Source Software",
  ),
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


// prevent floating elements from spilling into the next section
#show heading.where(level: 2): it => {
  place.flush()
  it
}

// set figure placement to `auto` by default
#set figure(placement: auto)

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
// #include "parts/verification.typ" // no dio tiempo
#include "parts/project_plan.typ"
#include "parts/conclusions.typ"



// glossary
// #import "@preview/glossarium:0.5.9": gls, glspl
// #gls("API")



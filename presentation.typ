#import "utils.typ": *

#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import "@preview/numbly:0.1.0": numbly


#let azuluc3m = rgb("#000e78")

#set text(
  lang: "es",
  region: "es",
)

#show: metropolis-theme.with(
  aspect-ratio: "4-3",
  // footer: self => self.info.title,
  config-info(
    title: [Implementing Interrupts, Timers, and Memory-Mapped I/O in CREATOR],
    subtitle: [Trabajo de Fin de Máster],
    author: [Autor: Luis Daniel Casais Mezquida\
      Tutor: Alejandro Calderón Mateos],
    date: [02 de marzo de 2026],
    institution: [Máster en Ingeniería Informática -- Universidad Carlos III de
      Madrid],
  ),
  config-colors(
    primary: azuluc3m,
    primary-light: rgb("#406ed8"),
    secondary: azuluc3m,
    neutral-lightest: rgb("#fafafa"),
    neutral-dark: rgb("#000e58"),
    neutral-darkest: rgb("#23373b"),
  ),
)

#set heading(numbering: numbly("{1}.", default: "1.1"))

// "booktab" table style
#show table: block.with(stroke: (y: 0.7pt))
#set table(column-gutter: .2em, stroke: none)
#set table.hline(stroke: 0.4pt)



// START

#title-slide(logo: image("uc3m-thesis-ieee-typst/img/new_uc3m_logo.svg"))

= Introducción
== Motivación
#slide[
  -
  - _Entorno de desarrollo integrado para formación e investigación en
    procesadores RISC_ (#link(
      "https://researchportal.uc3m.es/display/act562858",
    )[PDC2023-145832-I00])
    - Soporte interrupciones, temporizadores, dispositivos E/S en #link(
        "https.//creatorsim.github.io",
      )[CREATOR]
    - Modernizar la aplicación
][
  #figure(
    grid(
      gutter: 5%,
      image("img/arcos.png", width: 80%),
      image("img/creator.png", width: 55%),
    ),
    // caption: [ARCOS],
  )
]

== Objetivos del proyecto
#slide[
  1.
][
  // #figure(
  //   caption: [],
  //   image("img/", width: 60%),
  // )
]


= Estado de la cuestión
== Interrupciones


== Temporizadores


== Dispositivos de E/S



= Análisis
// == Requisitos

== Arquitectura
#figure(
  caption: [Arquitectura],
  image("diagrams/architecture/core.svg", height: 80%),
)


== Soluciones





== Planificación
#figure(
  caption: [Diagrama Gantt del proyecto],
  scale(
    {
      import "/diagrams/gantt/gantt-short.typ": diagram as gantt-chart
      gantt-chart
    },
    85%,
  ),
)

= Conclusiones
== Conclusiones del proyecto
Objetivos cumplidos:
1.

== Conclusiones personales y trabajos futuros
#slide[
  === Conclusiones personales
  -
][
  === Trabajos futuros
  -
]


#focus-slide[
  ¡Muchas gracias por su atención!
]
// Con esto concluyo mi presentación y quedo a disposición del tribunal.

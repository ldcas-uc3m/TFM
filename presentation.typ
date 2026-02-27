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
    date: [02 de febrero de 2026],
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

#show table: block.with(stroke: (y: 0.7pt))
#set table(
  row-gutter: 0.2em, // Row separation
  stroke: (_, y) => if y == 0 { (bottom: 0.2pt) },
)



// START

#title-slide(logo: image("uc3m-thesis-ieee-typst/img/new_uc3m_logo.svg"))

= Introducción
== Motivación
#slide[
][
  #figure(
    grid(
      columns: 2,
      gutter: 10%,
      image("img/arcos.png", width: 90%),
    ),
    caption: [ARCOS],
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




== Resultados

= Entorno socioeconómico
== Presupuesto
#figure(
  caption: [Coste total],
  table(
    columns: (auto, auto),
    align: (left + horizon, right + horizon),
    table.header([*Concepto*], [*Coste*]),
    [Recursos humanos ], [6908.46 €],
    [Recursos materiales ], [369.20 €],
    [Costes indirectos ], [5175.00 €],
    table.hline(stroke: 0.3pt + black),
    [*Total del proyecto* ], [*12452.66 €*],
    table.hline(stroke: 0.3pt + black),
    [Beneficio industrial (16%)], [1992.43€],
    [IVA (21%) ], [2615.06€],
    table.hline(stroke: 0.3pt + black),
    [*Importe final* ], [*17478.56 €*],
  ),
)

== Planificación
#figure(
  caption: [Diagrama Gantt del proyecto],
  scale(
    {
      import "/diagrams/gantt/gantt.typ": diagram as gantt-chart
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

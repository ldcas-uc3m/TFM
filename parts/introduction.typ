#import "/utils.typ": *



= Introduction <chap:introduction>
This first chapter briefly presents the project: why it came to be (#headref(
  <sec:intro-objectives>,
)), the objectives it strives to fulfill (#headref(<sec:intro-objectives>)), and
a description of the overall structure (#headref(
  <sec:document-structure>,
)).


== Motivation <sec:motivation>
// CREATOR
CREATOR (_didaCtic and geneRic assEmbly progrAmming simulaTOR_) is an
educational interactive plaftorm for assembly programming. It is developed by
the ARCOS research group at Universidad Carlos III de Madrid in order to aid in
the #highlight[teaching] of the Computer Structure and Computer Architecture
courses. Its focus is on providing a simple interactive experience for the
students, while being able to support multiple architectures, or modify existing
ones, without needing to create a new simulator for each language
@Camarmas2024CREATOR.


// project financed by EU


// interrupts, timers, and devices (real ecall)
// - añadir dispositivos (usados en la vida real para todo)
// - profes piden poder enseñar interrupciones (la base del hardware)
// - añadir timers (OS, context switching, Real-Time Systems)
// - unirlo implementando un ecall "real"
//   -> dispositivos mmio para escribir a consola



== Objectives <sec:intro-objectives>
The main objective of this work is to expand the CREATOR simulator with support
for interrupts, timers, and I/O devices, while keeping a generic approach that
is flexible enough for defining multiple ISAs, and without defeating its
educational purposes.

// TODO: finish
The secondary objectives, derived from the main objective, are as follows:
- *O1:* Simulate interrupts...
- *O2:* Simulate a timer that generate interrupts...
- *O3:* Simulate a MMIO...
- *O4:* Integrate these new features in a modular simulator...
- *O5:* Didactic...



== Document Structure <sec:document-structure>
This document contains the following chapters:
- #headref(<chap:introduction>), briefly presents the project, its motivations
  and objectives, and a description of the contents of the document.
- #headref(<chap:state-of-the-art>), discusses the technological environment
  surrounding interrupts, timers, and I/O devices, including its hardware
  implementation and simulation.
- #headref(<chap:design>), describes the design and implementation process,
  detailing the system's architecture, and justifying the different decisions
  taken. It also outlines the necessary steps for its deployment.
- #headref(<apx:genai>), describes the use of Generative AI in this work.

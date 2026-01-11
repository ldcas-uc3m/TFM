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
the ARCOS research group of Universidad Carlos III de Madrid in order to aid in
the #highlight[teaching] of the Computer Structure and Computer Architecture
courses. Its focus is on providing a simple interactive experience for the
students, while being able to support multiple architectures, or modify existing
ones, without needing to create a new execution language @Camarmas2024CREATOR.

// TODO: finish

// project


// interrupts, timers, and devices (real ecall)



== Objectives <sec:intro-objectives>
The main objective of this work is to expand the CREATOR simulator with support
for interrupts, timers, and I/O devices, while keeping a generic approach that
is flexible enough for defining multiple ISAs, and without defeating its
educational purposes.

// TODO: finish
The secondary objectives, derived from the main objective, are as follows:
- *O1:* Simulate
- *O2:* Integrate
- *O3:*
- *O4:*



== Document Structure <sec:document-structure>
This document contains the following chapters:
- #headref(<chap:introduction>), briefly presents the project, its motivations
  and objectives, and a description of the contents of the document.
- #headref(<chap:state-of-the-art>), discusses the technological environment
  surrounding interrupts, timers, and I/O devices, including its hardware
  implementation and simulation.
- #headref(<apx:genai>), describes the use of Generative AI in this work.

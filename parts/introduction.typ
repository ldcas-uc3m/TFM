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
the teaching of the Computer Structure and Computer Architecture courses. Its
focus is on providing a simple interactive experience for the students, while
being able to support multiple architectures, or modify existing ones, without
needing to create a new simulator for each language @Camarmas2024CREATOR.

// socio-economic environment (why interrupts, timers, devices)
In 2010, RISC-V appears as an open, modular ISA @riscvOrigin. This comes at a
time when the commercial war between the USA and China has just started,
affecting the exportation of microchips and, specially, GPUs. This forces
countries and corporations to start investing in manufacturing their own chips,
and an open standard such as the mentioned RISC-V can act as a base for
designing and implementing their own. Furthermore, recent technological advances
in cloud computing, IoT, and AI greatly benefit from hardware acceleration
through the use of external devices, making communication with them critical. On
the other hand, these advancements (and overall push) in computing has also put
a great focus in parallelization, with one of the most basic mechanisms to
moderate that being timers and interrupts. As the dependence on computing
increases, the cibersecurity risks associated to them also increase, and many of
these vulnerabilities and exploits occur at the assembly level. All of this
creates a high demand for people with deep knowledge of assembly programming in
general, and interrupts, timers and MMIO in particular. Currently, there are not
many didactic assembly simulators that support interrupts, timers, and/or
MMIO#footnote[This will be detailed in @chap:state-of-the-art.], and virtually
none that are also generic. Nevertheless, most university courses on computer
architecture teach these key concepts, while lacking the tools to help the
students visualize and learn.

// project financed by EU
This work is part of "_Integrated development environment for teaching and
research on RISC-V processors_", funded by the _Agencia Estatal de
Investigación_ (AEI) and by the European Union NextGenerationEU/PRTR
@PDC2023-145832-I00.

// objetivo final: real ecall
// - añadir dispositivos (usados en la vida real para todo)
// - profes piden poder enseñar interrupciones (la base del hardware)
// - añadir timers (OS, context switching, Real-Time Systems)
// - unirlo implementando un ecall "real"
//   -> dispositivos mmio para escribir a consola

// ... no he sabido meter ésto



== Objectives <sec:intro-objectives>
The main objective of this work is to expand the CREATOR simulator with support
for interrupts, timers, and I/O devices, while keeping a generic approach that
is flexible enough for defining multiple ISAs, and without defeating its
educational purposes.

#noindent[The secondary objectives, derived from the main objective, are as
  follows:]
- *O1:* Simulate interrupts in a generic way, allowing the emulation of multiple
  ISAs.
- *O2:* Simulate a generic timer that can generate interrupts according to the
  ISA specification.
- *O3:* Simulate memory-mapped I/O devices that allow for different new
  features.
- *O4:* Integrate these new features in a modular simulator that is easy to
  maintain and expand.
// - *O5:* Keep a didactic approach, making the simulator accessible and easy to
//   use.



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
// - #headref(<chap:evaluation>),
- #headref(<chap:project-plan>), presents the concepts related to the followed
  planning, and breaks down all project costs. It also discusses the regulatory
  framework and socio-economic environment that applies to the project.
- #headref(<chap:conclusions>), highlights the contributions of the project,
  discusses the overall conclusions, and presents what future work could be done
  in order to improve the system.
- #headref(<apx:genai>), describes the use of Generative AI in this work.

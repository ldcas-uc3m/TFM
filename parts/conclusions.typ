#import "/utils.typ": *


= Conclusions <chap:conclusions>
This chapter presents both the conclusions of the project #headref(
  <sec:project-conclusions>,
), and personal conclusions #headref(<sec:personal-conclusions>). It also
highlights some of the contributions that were made during this project that are
not directly related to it #headref(<sec:contributions>), and discusses what
future work could be done to the project #headref(<sec:future-work>).


== Project conclusions <sec:project-conclusions>
This document has described the design, and implementation of interrupts,
timers, and MMIO in the CREATOR simulator. The project presents a simple,
open-source, and intuitive simulator, focused on providing the user an intuitive
knowledge of interrupts, timers, and MMIO in assembly programming.

// product conclusions
As stated in @sec:intro-objectives, the main objective in this project was to
add generic interrupts, timers, and MMIO to CREATOR, and this goal was reached.

All secondary objectives were also fulfilled:
- *O1*: The simulator correctly simulates both RISC-V and Z80 architectures'
  interrupts.
- *O2*: The simulator correctly simulates both RISC-V and Z80 architectures'
  timers.
- *O3*: The assembly code is able to directly interact---through memory---with
  the application's console.
- *O4*: The design makes use of software design patterns that make it easy to
  extend.

// process conclusions
The greatest challenge was, without a doubt, the refactoring. Trying to make
sense of a ~90000 lines of code project, with little documentation and a
_challenging_ structure was a hard task. Learning to do things the right way,
while doing a big refactor, while the application was still actively being
developed (although, not very much) is one of those things computer scientists
deal with every day, but that still hunts us in our dreams. Nevertheless, the
results speak for themselves, and the source code quality has improved greatly,
which lead to faster implementation times for the rest of the features.



== Personal conclusions <sec:personal-conclusions>
This project has been a great opportunity for me personally, as it has allowed
not only to make use of all the knowledge I have gained throughout my degree and
master, but to learn other different skills. At the beginning of the project, I
had a passing knowledge of frontend development, JavaScript/Typescript
development, and how to do big refactors (and not die trying). Moreover, reading
and implementing technical specifications is a skill that will most surely be
useful in the future, and the design process of trying to do something generic
enough so it gives the required flexibility, while still trying to constrain and
abstract ideas was extremely challenging, in a good way.

Lastly, being able to write a big document such as this in my beloved Typst has
been a pleasure, and creating tools for other people to use, while working with
other people, is one of the most fulfilling things that I can think of.

// madre del amor hermoso, son casi las dos de la mañana y no sé ni lo que
// digo... menos mal que ni se lo van a leer



== Additional contributions <sec:contributions>
// plantilla
This document was created and written in Typst @typst. Not only the source code
of this report is publicly available at https://github.com/ldcas-uc3m/TFM, but
the code was structured in such a way that it is easily reusable, through the
use of a Typst template file that contains the configuration for the formatting
of the document. This template was based on the template document provided by
the Universidad Carlos III de Madrid's library @UC3MthesisTemplate, and follows
the master's thesis guidelines for this university @UC3MthesisStyleGuide. The
template @uc3mthesistypst~---in collaboration with some members of the GUL-UC3M
student association @gul~---, along with documentation, is made publicly
available in order to provide a better and easier to use bachelor and master
thesis template for future engineering students.

// srs
The source code for this document also makes use of a package for automating the
process of generating tables for software engineering tasks @SRStypst, such as
requirements, use cases, traceability matrices, etc. This package---inspired by
the author's #LaTeX version @SRSlatex~---adds several features such as allowing
the definition of the different items, and complete customization over how they
are displayed. The source code for the package is also publicly available, in
order to aid computer science students to perform these tasks in Typst.

// rivet
Some other contributions#footnote[Specifically,
  https://git.kb28.ch/HEL/rivet-typst/pulls/13.] were made to the Typst package
'rivet' @rivet, a package for defining and visualizing the layout of CPU
registers, which was used for the RISC-V register diagrams in
@subsec:interrupt-handling.

// creator-wiki
Finally, a comprehensive documentation for the CREATOR simulator @creatorwiki
was created in order to aid users of the simulator, and to showcase its new
features. In includes in-depth advanced guides for defining ISAs, as well as API
references and documentation for developers.



== Future work <sec:future-work>
This project implemented all the features it set to, but there are several lines
of work that could be explored, in order to better expand them:
// concurrent interrupts
- Currently, the system supports multiple interrupt types, but it only allows
  one of them to be active each cycle, leaving the ISA definition to decide.
  Perhaps the simulator could support that in a more explicit way.
// UI memory for devices
- The devices' memory segments are not shown in the UI if they are not mapped to
  existing addresses. A custom visualizer for these devices could be
  implemented.
// extra devices
- Currently, only two devices are implemented---covering all of CREATOR's system
  calls---, but some other devices should be added, for example a sound board or
  a LED matrix, as WepSIM has.
// kernels?
- The new SAIL @SAIL execution engine makes use of preloaded kernels for its
  system calls and other interrupt handling. The system could also support this
  for the regular execution engine, as an alternative to the
  architecture-defined interrupt handler.
// more timers
- Currently, only one timer is advanced each tick. It is possible to write the
  timer action definitions to support multiple timers, but this should be made
  more explicit in the UI, allowing more in-depth configuration.

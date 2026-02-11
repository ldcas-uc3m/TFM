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

All secondary objectives were also fulfilled:
- *O1*:
- *O2*:
- *O3*:
- *O4*:

// process conclusions



== Personal conclusions <sec:personal-conclusions>




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

// support multiple types of interrupts
// concurrent interrupts

#import "/utils.typ": *
#import "/requirements/lib.typ": *



= Analysis <chap:analysis>
This chapter describes the proposed solution by briefly recapping the project
(#headref(<sec:project-overview>)), and specifying the system's requirements
(#headref(<sec:requirements>)).


== Project overview <sec:project-overview>
The main objective of this project is to create an application that is capable
of simulating interrupts, timers, and MMIO according to an user-defined ISA, for
educational purposes. This will help the user learn these basic concepts by
incentivizing experimentation and, in turn, giving the user a deeper
understanding. As stated in @chap:state-of-the-art, current simulators either
don't offer these features, or offer a small, non-configurable subset of them.
The aim is to provide the user with an interactive approach to understanding
these concepts.


// == Use Cases <sec:use-cases>  // NO HAY TIEMPO


== Requirements <sec:requirements>
This section provides a detailed description of the system's requirements. For
the requirement specification task, the IEEE recommended practices @IEEE830-1984
were followed. According to these practices, a good specification must address
the software functionality, performance issues, external interfaces, other
non-functional features and design or implementation constraints.

Moreover, the requirement specification must be:
- *Complete:* The document reflects all significant software requirements.
- *Consistent:* Requirements must not generate conflicts with each other.
- *Correct:* Every requirement is one that the software shall meet according to
  the user needs.
- *Modifiable:* The structure of the specification allows changes to the
  requirements in a simple, complete and consistent way.
- *Ranked based on importance:* Every requirement must indicate its importance.
// and its stability.
- *Traceable:* The origin of every requirement is clear, and it can be easily
  referenced in further stages.
- *Unambiguous:* Every requirement has a single interpretation.
// - *Verifiable:* Every requirement must be verifiable, that is, there exists
// some process to verify that the software complies with every single
// requirement.  // #LOL

Starting from the user requirements (@sec:reqs-user), which constitute an
informal reference to the product the client expects, the software requirements
(@sec:reqs-software) were derived. These requirements guided the design process
with specific information on the functionality of the system, as well as any and
other related characteristics.


=== User Requirements <sec:reqs-user>
This section provides a detailed description of the user's requirements for the
project. These requirements indicate the main functionality and restrictions the
developed system must fulfill. The user requirements are divided into two
distinct types:
- *Capabilities:* Describe the expected system's functionality.
- *Restrictions:* Impose constraints or conditions that the system must fulfill.

Each user requirement is uniquely identified by an ID, which follows the format
_R-U-YY-XX_, where _YY_ identifies the type of the requirement---either a
capacity (_CA_) or a restriction (_RE_)---and _XX_ identifies the sequential
number of the requirement within that type, starting at _01_. @srs:RU-template
provides the template used for the specification of the requirements, including
the description of each attribute.

#right-here({
  show-template(("R", "U"), "RU-template")
  show-items(("R", "U", "CA"))
  show-items(("R", "U", "RE"))
})
// @srs:R-U-RE-user-req


=== Software Requirements <sec:reqs-software>
This section provides a detailed description of the system's software
requirements for the project. These requirements are derived from the user
requirements, defined in @sec:reqs-user, and comprise the software
specifications for the system. The software requirements are divided into two
distinct types:
- *Functional requirements:* Specify the software's functionalities and
  characteristics.
- *Non-functional requirements:* Specify other non-functional characteristics of
  the software.

Each software requirement is uniquely identified by an ID, which follows the
format _R-S-YY-XX_, where _YY_ identifies the type of the requirement---either
functional (_FC_) or non-functional (_NF_)---and _XX_ identifies the sequential
number of the requirement within that type, starting at _01_. @srs:RS-template
provides the template used for the specification of the requirements, including
the description of each attribute.

#right-here({
  show-template(("R", "S"), "RS-template") // FIXME: "Origins" is not shown bc it's not a terminal class... https://github.com/rajayonin/srs-typst/issues/3
  show-items(("R", "S", "FN"))
  show-items(("R", "S", "NF"))
})
// @srs:R-S-NF-cool-req


=== Traceability <sec:reqs-traceability>
A traceability matrix verifies if software requirements cover all user
requirements and, as @srs:R-S-FN-traceability shows, all functional requirements
cover the capabilities, proving the analysis was correct.
// and all non-functional requirements cover the
// restrictions (@srs:R-S-NF-traceability),

#big-ass-thing({
  set text(size: 10pt) // ugly hack, as it also affects the caption
  show-traceability(("R", "S", "FN"))
})

// lo escondo porque quedaría feo ver que es una matriz identidad
// #show-traceability(("R", "S", "NF"))



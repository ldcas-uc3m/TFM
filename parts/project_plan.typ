#import "/utils.typ": *
#import "costs.typ": *
#import "@preview/oxifmt:1.0.0": strfmt



= Project Plan
This chapter presents an overview of the development and logistics of the
project. The planning of the project (#headref(<sec:budget>)) is detailed,
analyzing its budget and overall cost (#headref(<sec:budget>)). Furthermore, it
analyzes the different legislation and regulations that may apply to the project
(#headref(<sec:regulation>)), and discusses the socio-economic environment in
which it was carried out, including the Sustainable Development Goals @sdg-un
(#headref(
  <sec:environment>,
)).



== Planning <sec:planning>
This section details the project's planning, by describing the followed
methodology and detailing the duration of each part.


=== Methodology
Due to the characteristics of the design, the development process was divided
into four iterations:
#[
  // TODO
  #set enum(numbering: "I.")
  + *dfd*.
  + *Interrupts*.
  + *Timers*.
  + *Memory-mapped I/O*.
]

// \begin{enumerate}[label=\Roman*.]
//   \item \textbf{\Gls{memory} and \Gls{register} File}. This iteration's goal was to implement the \reqref{Text Memory}, \reqref{Data Memory}, and \reqref{Register File} components separately.
//   \item \textbf{Control Unit and \gls{ALU}}. This phase consists on implementing the \reqref{Control Unit} and \reqref{ALU} components, and connecting them to all the previous components. The goal of this iteration is to be able to simulate the full \gls{CPU} and \gls{memory}, and interpret LUISP-DA instructions.
//   \item \textbf{Compiler}. This iteration consists on implementing the \reqref{Compiler} component, with the purpose of being able to load \glspl{ISA} and interpret full programs.
//   \item \textbf{\gls{CLI}}. The final iteration implements the \reqref{CLI} component, adding features such as the \gls{REPL environment} and the whole \gls{UI}.
// \end{enumerate}

An iterative methodology was chosen, based on Bohem's spiral model
@BohemBSpiral, in order to ensure that, before implementing a component, all
components that it depends on are correctly implemented. It also simplifies the
development life cycle and makes it more flexible, as it allows the developer to
go back and modify previous elements, and encourages quick prototyping.

The life cycle development process of this model (@fig:spiral_model) has four
phases, which are repeated during the different iterations of the model. These
phases are:
+ *Planning:* The user requirements are gathered, and the iteration's objectives
  are determined.
+ *Analysis:* An analysis of the user requirements is performed in order to
  identify potential risks, and the test cases are designed.
+ *Development and testing:* The architecture is designed, implemented, and the
  tests are performed.
+ *Evaluation:* The software is evaluated with the client, in order to provide
  feedback. In this specific case, the tutor acted as the client. This is the
  critical task of the life cycle, as the iteration isn't finished until the
  software is approved.

#figure(
  caption: [Spiral model life cycle @boehm2000spiral],
  image("/img/spiral_model.svg", width: 70%),
) <fig:spiral_model>



=== Time estimation
The time estimation of the project was designed with the use of a Gantt chart
@clark1922gantt. This diagram---shown in @fig:gantt~---displays all the
performed tasks in each iteration of the life cycle, plus an extra documentation
task in each iteration for the drafting of this thesis. A final _Report_ task
was added to represent the time spent finishing this report.

The project had a total duration of 13 months, with a personal dedication of 25
hours per week, totaling $1300 h$.

#figure(
  caption: [Gantt chart for the project],
  {
    import "/diagrams/gantt/gantt.typ": diagram as gantt-chart
    gantt-chart
  },
) <fig:gantt>



== Budget <sec:budget>
This section details the project's budget, based on the time estimation and
planning described in @sec:planning. @tab:project-info summarizes the main
characteristics of the project, including the total budget.

#figure(
  caption: [Project information],
  placement: none, // quieto aquí
  table(
    columns: (3.5cm, 9cm),
    align: left,
    [*Title*],
    [_"Implementing Interrupts, Timers, and Memory-Mapped I/O in CREATOR"_],

    [*Author*], [Luis Daniel Casais Mezquida],
    [*Department*],
    [Departamento de Informática.\ Universidad Carlos III de Madrid.],

    [*Start date*], [5th of November of 2024],
    [*End date*], [31st of December of 2025],
    [*Duration*], [13 months],
    [*Total budget*], $#round(total-costs) euro$,
  ),
) <tab:project-info>


=== Direct costs
Direct costs are those that are directly related with the development of the
project. These can be divided into two groups:
- *Personnel costs:* These vary in relation to the qualifications, experience,
  and geographical location of each member.
- *Equipment costs:* These are all the costs associated to the tools required
  for developing the software, mainly hardware and software tools.

// personnel costs
Personnel costs can be divided between four different roles #footnote[The tutor
  played the role of project manager, while the student played the rest of the
  roles.]:
- *Project manager:* Manages the project's schedule and provides feedback.
- *Analyst:* Analyzes the user's requirements, designs the architecture of the
  system, and writes documentation.
- *Programmer:* Implements the required functionalities.
- *Tester:* Designs and performs the tests for the different functionalities.

@tab:personnel-cost shows the direct costs caused by each of the roles, and the
total personnel costs.

#figure(
  caption: [Personnel costs],
  placement: none,
  table(
    columns: 4,
    align: (left, ..(right,) * 3),
    ..table-header([*Role*], [*Hours*], [*Cost per hour*], [*Total*]),
    ..for p in personnel-costs {
      (
        p.role,
        $#p.hours h$,
        $#p.cph euro"/"h$,
        $#round(p.total) euro$,
      )
    },

    table.hline(),

    [*TOTAL*],
    $#personnel-costs.map(p => p.hours).sum() h$,
    [],
    [*$#round(total-personnel-costs) euro$*],
  ),
) <tab:personnel-cost>

// equipment costs
Equipment costs refer to those caused by equipment acquisition and usage. For
software, all the software tools used for this project were FOSS. The chargeable
cost, $C$, for each item is calculated using @eq:chargeable-cost, where:
- $c$ is the cost of the item.
- $d$ is the time the item has been used.
- $u$ is the percentage of the total time the item was used for the project.
- $D$ is the item's depreciation period.

#math.equation(
  block: true,
  alt: "C is c times u times d, over D",
  $ C = (c dot u dot d) / D $,
) <eq:chargeable-cost>

@tab:equipment-cost shows the equipment costs associated to this project.

#figure(
  caption: [Equipment costs],
  placement: none, // put it here bro
  table(
    columns: 6,
    align: (left, ..(right,) * 5),
    ..table-header(
      [*Item*],
      [*Cost* ($c$)],
      [*Usage* ($u$)],
      [*Dedication* ($d$)],
      [*Depreciation* ($D$)],
      [*Chargeable cost* ($C$)],
    ),
    ..for i in equipment-costs {
      (
        i.item,
        $#i.c euro$,
        $#{ i.u * 100 } %$,
        $#i.d #{ "month" + if i.d > 1 { "s" } else { "" } }$,
        $#i.D #{ "month" + if i.D > 1 { "s" } else { "" } }$,
        $#round(i.C) euro$,
      )
    },

    table.hline(),

    [*TOTAL*],
    [#equipment-costs.map(i => i.c).sum() #sym.euro],
    [],
    [],
    [],
    [*#round(total-equipment-costs) #sym.euro*],
  ),
) <tab:equipment-cost>


=== Indirect costs
Indirect costs are those that are present during the development process, but
cannot be assigned directly to any product. For the energy consumption, it is
assumed that the laptop's energy usage averages $80W$, and the monitor and mouse
average $20W$, and that they were used during the whole development process,
totaling $360h$. Therefore, the total energy consumed is
$100 W dot 360 h = 3600 W h$. The internet plan includes a 600mb optic fiber
connection, $31.80 euro"/""month"$, which is shared between three people, two of
them not included in the project, therefore the cost applicable to the project
is a third of that.

@tab:indirect-cost shows the indirect costs associated to this project.

#figure(
  caption: [Indirect costs],
  placement: none,
  table(
    columns: 4,
    align: (left, ..(right,) * 3),
    ..table-header([*Role*], [*Hours*], [*Cost per hour*], [*Total*]),
    ..for r in indirect-costs {
      (
        r.resource,
        $#r.count #r.unit$,
        $#r.cpu euro"/"#r.unit$,
        $#round(r.total) euro$,
      )
    },

    table.hline(),

    [*TOTAL*],
    [],
    [],
    [*$#round(total-indirect-costs) euro$*],
  ),
) <tab:indirect-cost>


=== Costs summary
@tab:cost-summary includes a summary of the costs of the whole project.

#figure(
  caption: [Costs summary],
  placement: none,
  table(
    columns: (3cm, 3cm),
    align: (left, right),
    [Personnel], $#round(total-personnel-costs) euro$,
    [Equipment], $#round(total-equipment-costs) euro$,
    [Indirect], $#round(total-indirect-costs) euro$,
    table.hline(),
    [*TOTAL*], [*$round(#total-costs) euro$*],
  ),
) <tab:cost-summary>


=== Project offer proposal
@tab:offer-proposal details an offer proposal for the project. This proposal
includes the estimated risks, expected benefits, and taxes. After applying all
these concepts, the final cost of this project, in case it is presented to a
third-party client, is *$#round(total-offer) euro$*.

#figure(
  caption: [Offer proposal],
  placement: none, // put it here bro
  table(
    columns: 4,
    align: (left, ..(right,) * 3),
    ..table-header([*Concept*], [*Increment*], [*Partial cost*], [*Aggregated
    cost*]),
    ..for (i, item) in increments.enumerate() {
      (
        item.name,
        if i == 0 [--] else { $#{ item.inc * 100 } %$ },
        if i == 0 [--] else { $round(item.partial) %$ },
        $#round(item.agg) euro$,
      )
    },

    table.hline(),

    [*TOTAL*],
    $#round(total-offer * 100 / total-costs) %$,
    [],
    [*$#round(total-offer) euro$*],
  ),
) <tab:offer-proposal>



== Regulatory framework <sec:regulation>

=== Applicable legislation

=== Technical standards

=== Licenses



== Socio-economic environment <sec:environment>

=== Sustainable Development Goals

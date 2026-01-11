#import "/utils.typ": *

= Design <chap:design>

// TODO: blah blah


== Study of the Solution <sec:study-solution>

#algref(<alg:creator5-execution-cycle>) must be modified as shown in
@alg:creator6-execution-cycle.


#algorithm(
  title: [CREATOR 6's instruction execution cycle],
  label: <alg:creator6-execution-cycle>,
)[
  + Decode _instruction_
  + Increment `PC`
  + Execute _instruction_
  + Handle interrupts (@alg:creator6-interrupt-handler)
  + Handle timers (@alg:creator6-timer-handler)
  + Handle devices (@alg:creator6-device-handler)
  + Fetch _instruction_
]



=== Interrupts

#algorithm(
  title: [CREATOR 6's interrupt handling subroutine],
  label: <alg:creator6-interrupt-handler>,
)[
  + *if* _not_ `interruptsGlobalEnabled()` *then*
    + *return*
  - *end if*
  + *if* _not_ `interruptPending()` *then*
    + *return*
  - *end if*
  + `pending_interrupt` $<-$ `getInterrupt()`
  + *if* ! $#raw("interruptEnabled(pending_interrupt)")$ *then*
    + *return*
  - *end if*
  + `interruptHandle(pending_interrupt)`
]


=== Timers

#algorithm(
  title: [CREATOR 6's timer handling subroutine],
  label: <alg:creator6-timer-handler>,
)[
  + *if* _not_ `timerEnabled()` *then*
    + *return*
  - *end if*
  + `advanceTimer()`
  + `handleTimer()`
]


=== Memory-mapped I/O


#algorithm(
  title: [CREATOR 6's device handling subroutine],
  label: <alg:creator6-device-handler>,
)[
  + *for-each* `device` *in* `devices`
    + *if* _not_ `device.enabled()` *then*
      + *continue*
    - *end if*
  + `device.handler()`
]


== System Architecture <sec:sys-architecture>

#figure(
  image("/diagrams/architecture/core.svg", width: 80%),
  caption: [`core` module architecture],
)

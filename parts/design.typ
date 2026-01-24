#import "/utils.typ": *

= Design <chap:design>

// TODO: blah blah


== Study of the Solution <sec:study-solution>
In order to implement the features described in #headref(<sec:requirements>),
the execution cycle of the simulator had to be modified, as shown in
@alg:creator6-execution-cycle, to incorporate the interrupt, timer, and device
handling subroutines.

#algorithm(
  title: [CREATOR 6's instruction execution cycle],
  label: <alg:creator6-execution-cycle>,
)[
  + Decode _instruction_
  + Increment `PC`
  + Execute _instruction_
  + Handle timers (@alg:creator6-timer-handler)
  + Handle devices (@alg:creator6-device-handler)
  + Handle interrupts (@alg:creator6-interrupt-handler)
  + Fetch _instruction_
]

// why @ end of cycle
The main change with respect to CREATOR 5's execution cycle
(@alg:creator5-execution-cycle) is that the interrupt detection--along with the
timer and devices subroutines--, and the instruction fetch are performed at the
end of the cycle instead of at the beginning of it. The execution order stays
consistent: execute, check for interrupts, and fetch next instruction; but the
with the current approach, the simulator can infer the state after the current
instruction's execution and display it in the UI in the current cycle. This is
relevant for step-by-step execution, as the UI needs to show the next
instruction before the user decides to execute it. In the case of the first
instruction, some extra logic is performed by the assembler in order to fetch
the first instruction.

// why devices -> timers -> int
The order of the interrupt, timer, and device handling is also relevant. An
interrupt can be generated as the result of executing an instruction, but timers
and devices can also generate them, therefore we must check for possible
interrupts _after_ executing those handlers. To allow timers to interact and
influence devices, the timer handler is executed before the device handler.



=== Interrupts <subsec:design-interrupt>

// "ponerle puertas al campo"
Simulating interrupts in a "generic" way is a somewhat difficult task. As shown
in @sec:soa-interrupt, each ISA can define its own way of handling interrupts,
but all approaches tend to converge to the same core idea: something unexpected
happens and the processor either ignores it or stops execution, handles it, and
resumes execution. One of the objectives of this simulator is to give the end
users the ability to implement any ISA without needing to implement the whole
simulator, by giving them the optimal tools for the task. The result is a
"generic" interrupt model.

// "generic" interrupt model
// - pending
// - handle
// - isEnabled / global
// - enable/disable/global
// - create
// - clear/global


// handler
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
  + *if* _not_ $#raw("interruptEnabled(pending_interrupt)")$ *then*
    + *return*
  - *end if*
  + `interruptHandle(pending_interrupt)`
]


// auxiliar functions


// CREATOR vs Architecture handler

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
  - *end for-each*
]


== System Architecture <sec:sys-architecture>

// big ol' refactor

#figure(
  image("/diagrams/architecture/core.svg", width: 90%),
  caption: [`core` module architecture],
)

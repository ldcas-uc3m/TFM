#import "/utils.typ": *

= Design <chap:design>
This chapter provides a full description of the proposed solution. It details
the system's design process, by discussing the different alternatives (#headref(
  <sec:study-solution>,
)), and describes the proposed architecture (#headref(<sec:sys-architecture>)),
including all components and design decisions.


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
The approach is to divide the interrupt model into a set of common actions whose
behaviour is then defined by each specific ISA. The selected interrupt handler
will implement the behaviour of each action. As stated in
@subsec:interrupt-taxonomy, most ISAs differentiate between different interrupt
types, therefore our model must support multiple interrupt types. Some
ISAs--like RISC-V--also support enabling and disabling interrupts globally, that
is, all interrupt types.

#noindent[The set of actions in the model is the following:]
- Generating a specific type of interrupt.
- Evaluating what types of interrupts are currently pending, and returns the
  highest priority one.
- Clearing pending interrupts, both globally and by type.
- Handling a pending interrupt type.
- Enabling and disabling interrupts, either one specific type of interrupt, or
  globally.
- Evaluating if interrupts are enabled, both globally and by type.

// handling subroutine
The handling subroutine, specified in @alg:creator6-interrupt-handler, evaluates
the pending interrupts and executes its handler, if interrupts are globally
enabled and that type of interrupt is enabled. This algorithm only allows for
one type of interrupt to be handled each time, and it's up to the implementation
of the evaluating action to apply the correct priority to each interrupt type
and return the highest priority interrupt. As stated previously, instructions,
timers, and devices can generate interrupts through the use of the specified
action.

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

/* interrupt handler */

// why? (syscall)
One of the objectives of the interrupt feature in the simulator--as stated in
#highlight[User Requirement XXX]--is for it to be "opt-in", that is, ensuring
that the average user that doesn't need to understand interrupts in order to use
the simulator's basic functionalities. The problem arises with the system calls,
which _must_ be implemented with interrupts, but are part of the basic example
programs of the simulator, as they enable communication with the keyboard and
display. In CREATOR 5, the system call instructions#footnote[`ecall` instruction
  in RISC-V, `syscall` instruction in MIPS-32.] doesn't make use of any type of
interrupts or execution mode changes; instead, it emulates an operating system
by implementing its functionality in the instruction
definition#footnote[Currently, it uses a switch case that reads one or more
  specific registers and calls the desired internal functions.]. The objective
is to allow the user to implement its own interrupt handler, while also
providing a "fallback" system that is transparent for the regular users.

// approaches
There are two possible approaches to solving this: embedding a basic interrupt
handler--written in assembly--with each program, and allowing the user to
replace it; and using multiple interrupt handlers, a default one that bypasses
the architecture-defined interrupt actions, and another that executes the
actions, forcing the user to write their own interrupt handler. The main
difference between the two approaches is that the latter allows writting the
default interrupt handler in JavaScript, which in turns allows interaction with
the system through the CREATOR API (CAPI), offering the user more flexibility
and ease of use. Furthermore, this approach allows switching handlers without
needing to recompile, although this is perhaps only useful for debugging
purposes. For the reasons mentioned, the multiple handler approach was selected.

// y ahora, querido lector, es cuando me he dado cuenta de que elegí mal, pero
// es demasiado tarde para cambiar el código...



=== Timers <sec:design-timer>

// actions
As with interrupts, a generic timer model can be divided into a set of actions:
- Advancing the timer once per tick.
- Handling the different timers, typically evaluating if they reach certain
  threshold and generating an exception if it does.
- Enabling and disabling timers.
- Evaluating if timers are enabled.

// handling subroutine
The timer handling subroutine, specified in @alg:creator6-timer-handler, would
therefore advance and handle the timers once every tick--a tick being a unit of
time composed of one or several clock cycles--if the timers are enabled.

#algorithm(
  title: [CREATOR 6's timer handling subroutine],
  label: <alg:creator6-timer-handler>,
)[
  + *if* _not_ `timerEnabled()` *then*
    + *return*
  - *end if*
  + *if* $#raw("clk_cycles") % #raw("tick_cycles") = 0$ *then*
    + `timerAdvance()`
    + `timerHandle()`
  - *end if*
]


=== Memory-mapped I/O <sec:design-mmio>
// why mmio?
As stated in @sec:soa-devices, there are two main approaches used for I/O
communication in computers: using specific ports for communication, and using
memory. Ports, as they require special instructions, can be emulated in the
instruction definition with CREATOR 6's plugin system #footnote[This system is
  out of the scope of the thesis, but it will be briefly described in
  @sec:sys-architecture.], but for ISAs that don't offer those
instructions--like RISC-V--, interaction with the devices the simulator offers
can only occur through the use of MMIO.

// device definition
It is possible to model a "generic" device as a set of registers and a handler
function. Most devices have at least a control register for the CPU to signal an
action to perform, and optionally a status register for the device to broadcast
its status. Instead of a single data register, and to enable more flexibility
for device definition, a data range is provided, that is, a set of contiguous
memory that can be used for communication and to represent several different
registers. The handler is in charge of interacting with the different registers
and interacting with the simulator, having _Direct Memory Access_. A device can
also be enabled or disabled in the architecture definition.

// address decoding
To give the users flexibility over ISA definition, the addresses of the
different devices' registers are configured in the architecture definition. This
also gives the user the ability to map the registers to addresses both inside
and outside main memory#footnote[The size and layout of the main memory is
  already configured in the architecture definition.]. For address decoding, any
access to memory will first check if the address belongs to a device register,
and perform the operation in the device's memory if it does.

// handling subroutine
The device handling subroutine, as shown in @alg:creator6-device-handler,
executes the handler of all enabled devices once per cycle.

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
) <fig:arch-core>

// mention plugin system


=== Interrupt Manager


#figure(
  image("/diagrams/architecture/interrupts.svg", width: 100%),
  caption: [Interrupt Manager architecture],
) <fig:arch-interrupts>

=== Devices

#figure(
  image("/diagrams/architecture/devices.svg", width: 50%),
  caption: [Device Manager architecture],
) <fig:arch-devices>


=== Timer Manager

#figure(
  image("/diagrams/architecture/timers.svg", width: 35%),
  caption: [Timer Manager architecture],
) <fig:arch-timers>



=== CAPI

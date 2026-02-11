// LTeX: enabled=false

#import "/utils.typ": *
#import "srs-typst/src/lib.typ" as _srs


#let _functional(id, ..fields) = _srs.make-item(id, ("R", "S", "FN"), ..fields)
#let _nonfunctional(id, ..fields) = _srs.make-item(
  id,
  ("R", "S", "NF"),
  ..fields,
)


#let soft-reqs = (
  /* FUNCTIONAL */
  _functional(
    "int-generic-detection",
    origins: (("R", "U", "CA", "int-generic"),),
    Description: [The system shall be able to emulate any ISA's interrupt
      detection cycle.],
    Necessity: "h",
    Priority: "h",
  ),
  _functional(
    "int-generic-hook",
    origins: (("R", "U", "CA", "int-generic"),),
    Description: [The system shall be able to emulate any ISA's interrupt
      hook.],
    Necessity: "h",
    Priority: "h",
  ),
  _functional(
    "int-generic-rti",
    origins: (("R", "U", "CA", "int-generic"),),
    Description: [The system shall be able to emulate any ISA's
      return-from-interrupt subroutine.],
    Necessity: "h",
    Priority: "h",
  ),
  _functional(
    "int-interrupt-types",
    origins: (("R", "U", "CA", "int-generic"),),
    Description: [The system shall support multiple interrupt types.],
    Necessity: "h",
    Priority: "h",
  ),
  ..for action in ("enable", "disable", "clear") {
    (
      ..for global in (false, true) {
        (
          _functional(
            strfmt("int-interrupt-{}{}", action, if global {
              "-global"
            } else {}),
            origins: (("R", "U", "CA", "int-generic"),),
            Description: [The user shall be able to #action #{
                if global [all] else [any type of]
              }
              interrupt#{ if global [s] }.],
            Necessity: "m",
            Priority: "m",
          ),
        )
      },
    )
  },
  ..for (type, parts) in (
    int: (
      "interrupt detection cycle",
      "interrupt hook",
      "return-from-interrupt subroutine",
    ),
    tim: (
      "timer comparison cycle",
      "timer hook",
    ),
  ).pairs() {
    (
      ..for part in parts {
        (
          _functional(
            strfmt("{}-definition-{}", type, part.split(" ").join("-")),
            origins: (
              ("R", "U", "CA", strfmt("{}-generic", type)),
              ("R", "U", "CA", strfmt("{}-definition", type)),
            ),
            Description: [The user shall be able to define the ISA's #part.],
            Necessity: if type == "int" { "h" } else { "m" },
            Priority: if type == "int" { "h" } else { "m" },
          ),
        )
      },
    )
  },
  _functional(
    "tim-generic",
    origins: (("R", "U", "CA", "tim-generic"),),
    Description: [The user shall be able to define how many cycles the timer
      advances.],
    Necessity: "m",
    Priority: "m",
  ),
  // interrupts
  _functional(
    "int-privilege",
    origins: (("R", "U", "CA", "int-privilege"),),
    Description: [The system shall support two privilege levels of execution:
      user and kernel.],
    Necessity: "m",
    Priority: "m",
  ),
  _functional(
    "int-privilege-change",
    origins: (("R", "U", "CA", "int-privilege"),),
    Description: [The system shall be able to switch between execution modes.],
    Necessity: "m",
    Priority: "m",
  ),
  _functional(
    "int-handlers",
    origins: (("R", "U", "CA", "int-handlers"),),
    Description: [The system shall be able to execute system calls without
      interrupts.],
    Necessity: "l",
    Priority: "l",
  ),
  _functional(
    "int-handlers-change",
    origins: (("R", "U", "CA", "int-handlers"),),
    Description: [The user shall be able to select whether to execute with or
      without interrupts.],
    Necessity: "l",
    Priority: "l",
  ),
  // mmio
  // es copia-pega... puta bida
  _functional(
    "mmio",
    origins: (("R", "U", "CA", "mmio"),),
    Description: [The system shall support memory-mapped devices.],
    Necessity: "h",
    Priority: "m",
  ),
  _functional(
    "mmio-devices",
    origins: (("R", "U", "CA", "mmio-devices"),),
    Description: [The system' memory-mapped devices shall provide the same
      capabilities as the system calls.],
    Necessity: "m",
    Priority: "m",
  ),
  _functional(
    "mmio-definition",
    origins: (("R", "U", "CA", "mmio-definition"),),
    Description: [The user shall be able to define the ISA's device addresses.],
    Necessity: "h",
    Priority: "m",
  ),
  /* NON-FUNCTIONAL */
  // es copia-pega... puta bida
  _nonfunctional(
    "no-spagghetti-0",
    origins: (("R", "U", "RE", "no-spagghetti-0"),),
    Description: [The system's source code shall follow modern standards.],
    Necessity: "h",
    Priority: "m",
  ),
  _nonfunctional(
    "no-spagghetti-1",
    origins: (("R", "U", "RE", "no-spagghetti-1"),),
    Description: [The system's source code shall be maintainable.],
    Necessity: "h",
    Priority: "h",
  ),
  _nonfunctional(
    "foss",
    origins: (("R", "U", "RE", "foss"),),
    Description: [The system shall be licensed under the LGPL-2.1 license.],
    Necessity: "h",
    Priority: "l",
  ),
)

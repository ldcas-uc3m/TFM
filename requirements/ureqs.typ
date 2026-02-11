// LTeX: enabled=false

#import "/utils.typ": *
#import "srs-typst/src/lib.typ" as _srs


#let _capability(id, ..fields) = _srs.make-item(id, ("R", "U", "CA"), ..fields)
#let _restriction(id, ..fields) = _srs.make-item(id, ("R", "U", "RE"), ..fields)

#let user-reqs = (
  /* CAPABILITIES */
  // interrupts, timers
  ..for feature in ("interrupt", "timer") {
    (
      _capability(
        strfmt("{}-generic", feature.slice(0, 3)),
        Description: [The system shall be able to emulate any ISA's #feature
          implementation.],
        Necessity: if feature == "interrupt" { "h" } else { "m" },
        Priority: if feature == "interrupt" { "h" } else { "m" },
      ),
      _capability(
        strfmt("{}-definition", feature.slice(0, 3)),
        Description: [The user shall be able to define the ISA's #feature
          implementation.],
        Necessity: if feature == "interrupt" { "h" } else { "m" },
        Priority: if feature == "interrupt" { "m" } else { "l" },
      ),
    )
  },
  _capability(
    "int-privilege",
    Description: [The system shall support two privilege levels of execution:
      user and kernel.],
    Necessity: "m",
    Priority: "l",
  ),
  _capability(
    "int-handlers",
    Description: [The system shall support system calls without requiring the
      usage of interrupts.],
    Necessity: "m",
    Priority: "m",
  ),
  // mmio
  _capability(
    "mmio",
    Description: [The system shall support memory-mapped devices.],
    Necessity: "h",
    Priority: "m",
  ),
  _capability(
    "mmio-devices",
    Description: [The system' memory-mapped devices shall provide the same
      capabilities as the system calls.],
    Necessity: "m",
    Priority: "m",
  ),
  _capability(
    "mmio-definition",
    Description: [The user shall be able to define the ISA's device addresses.],
    Necessity: "h",
    Priority: "m",
  ),
  /* RESTRICTIONS */
  _restriction(
    "no-spagghetti-0",
    Description: [The system's source code shall follow modern standards.],
    Necessity: "h",
    Priority: "m",
  ),
  _restriction(
    "no-spagghetti-1",
    Description: [The system's source code shall be maintainable.],
    Necessity: "h",
    Priority: "h",
  ),
  _restriction(
    "foss",
    Description: [The system shall be licensed under the LGPL-2.1 license.],
    Necessity: "h",
    Priority: "l",
  ),
)

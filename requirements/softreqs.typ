#import "srs-typst/src/lib.typ" as _srs


#let soft-reqs = (
  _srs.make-item(
    "cool-req",
    _srs.make-tag("R", "S", "NF"),
    origins: (_srs.make-tag("R", "U", "RE", "user-req"),),
    Description: [The software shall be cool.],
    Necessity: "h",
    Priority: "h",
    Stability: "c",
    Verifiability: "l",
  ),
  _srs.make-item(
    "cool-req-patata",
    _srs.make-tag("R", "S", "NF"),
    origins: (
      _srs.make-tag("R", "U", "RE", "user-req"),
    ),
    Description: [The software shall veryyy be cool.],
    Necessity: "h",
    Priority: "h",
    Stability: "c",
    Verifiability: "l",
  ),
)

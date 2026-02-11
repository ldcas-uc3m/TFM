/// Dumbed-down (for time) srs.defaults.base-classes

#import "srs-typst/src/lib.typ" as srs

#let content-field = "content"

#let _scale-type = srs.make-enum-field(
  h: "High",
  m: "Medium",
  l: "Low",
)

#let item-namer = srs.defaults.incremental-namer-maker(
  prefix: (tag, root-class-name, class-name, separator) => {
    tag.join(separator)
  },
  separator: "-",
  start: 1,
  width: 2,
)

#let item-identifier = srs.defaults.identifier-maker(
  prefix: (tag, root-class-name, class-name, separator) => {
    tag.join(separator)
  },
  separator: "-",
)

#let classes = (
  srs.make-class(
    "R",
    "Requirement",
    namer: item-namer,
    identifier: item-identifier,
    fields: (
      srs.make-field(
        "Description",
        content-field,
        [Detailed description of the requirement],
      ),
      srs.make-field(
        "Necessity",
        _scale-type,
        [Priority of the requirement of the user],
      ),
      srs.make-field(
        "Priority",
        _scale-type,
        [Priority of the requirement for the developer],
      ),
    ),
    classes: (
      srs.make-class(
        "U",
        "User",
        classes: (
          srs.make-class("CA", "Capability"),
          srs.make-class("RE", "Restriction"),
        ),
      ),
      srs.make-class(
        "S",
        "Software",
        classes: (
          srs.make-class(
            "FN",
            "Functional",
            origins: srs.make-origins(
              [User requirements that derived this requirement.],
              srs.make-tag("R", "U", "CA"),
            ),
          ),
          srs.make-class(
            "NF",
            "Non-functional",
            origins: srs.make-origins(
              [User requirements that derived this requirement.],
              srs.make-tag("R", "U", "RE"),
            ),
          ),
        ),
      ),
    ),
  ),
)

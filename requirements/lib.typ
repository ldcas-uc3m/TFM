#import "srs-typst/src/lib.typ" as _srs

#import "ureqs.typ": *
#import "softreqs.typ": *


#let _reqs = _srs.create(
  config: _srs.make-config(
    language: "en",
    template-formatter: _srs.defaults.table-template-formatter-maker(
      style: (columns: (8em, 1fr), align: left),
      header-hline: true,
    ),
    item-formatter: _srs.defaults.table-item-formatter-maker(
      style: (columns: (8em, 1fr), align: left),
      header-hline: true,
    ),
    traceability-formatter: _srs
      .defaults
      .table-traceability-formatter-maker(
        style: (row-gutter: 0em),
        rotation-angle: 0deg,
        column-size: 7em,
      ),
    classes: _srs.defaults.base-classes,
  ),

  ..user-reqs,
  ..soft-reqs,
  // ..use-cases, // no time!
)


// bind _reqs to the functions we're gonna use
#let show-items = _srs.show-items.with(_reqs)
#let show-traceability = _srs.show-traceability.with(_reqs)
#let show-template = _srs.show-template.with(_reqs)

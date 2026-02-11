// LTeX: enabled=false

#import "srs-typst/src/lib.typ" as _srs


#import "ureqs.typ": *
#import "softreqs.typ": *
#import "classes.typ": classes, item-identifier, item-namer


#let textwidth = 21cm - 3cm - 2.5cm
#let item-style = (
  style: (columns: (8em, .85 * textwidth - 8em), align: left),
  header-hline: true,
)

#let _reqs = _srs.create(
  config: _srs.make-config(
    language: "en",
    template-formatter: _srs.defaults.table-template-formatter-maker(
      ..item-style,
    ),
    item-formatter: _srs.defaults.table-item-formatter-maker(
      ..item-style,
    ),
    traceability-formatter: _srs
      .defaults
      .table-traceability-formatter-maker(
        style: (
          row-gutter: 0em,
          column-gutter: 0em,
        ),
        rotation-angle: 0deg,
        column-size: 6em,
      ), // a bit ugly...
    classes: classes,
  ),

  ..user-reqs,
  ..soft-reqs,
  // ..use-cases, // no time!
)


// bind _reqs to the functions we're gonna use
#let show-items = _srs.show-items.with(_reqs)
#let show-traceability = _srs.show-traceability.with(_reqs)
#let show-template = _srs.show-template.with(_reqs)
#let reqref = _srs.show-ref.with(_reqs)

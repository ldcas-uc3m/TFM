// LTeX: enabled=false

// TODO: use the official version when updated w/ my patches
// #import "@preview/rivet:0.3.0": config, schema
#import "rivet-typst/src/lib.typ": config, schema

#let rv32-config = (
  default-font-family: "CaskaydiaCove NFM",
  default-font-size: 11pt,
  background: none,
  values-gap: 0,
  margins: (0, 0, 0, 0),
  all-bit-i: false,
)


#let top-32-bits(width: 100%) = schema.render(
  schema.load(
    (
      structures: (
        main: (
          bits: 16,
          start: 16,
          ranges: (),
        ),
      ),
    ),
  ),
  config: config.config(..rv32-config),
  width: width,
)

/// Generates a RISC-V register using RIVET, returns a function that takes an optional `width` parameter and returns the diagram.
///
/// - structure (dictionary): RIVET structure (inside `main`)
/// - top-16 (boolean): Whether to add the to 16 bits
/// - custom-config (dictionary): Custom configuration to pass to `config.config`
/// -> (width: ratio) => content
#let riscv-reg(
  structure,
  top-16: false,
  custom-config: (:),
) = (width: 100%) => {
  if top-16 { top-32-bits(width: width) }

  schema.render(
    schema.load((
      structures: (
        main: structure,
      ),
    )),
    config: config.config(..custom-config, ..rv32-config),
    width: width,
  )
}

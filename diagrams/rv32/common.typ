// LTeX: enabled=false

#import "@preview/rivet:0.3.0": config, schema

#let rv32-config = (
  default-font-family: "CaskaydiaCove NFM",
  default-font-size: 11pt,
  background: none,
  values-gap: 0,
  margins: (0, 0, 0, 0),
  all-bit-i: false,
)

#let gray = gray.to-hex()

#let top-32-bits = schema.render(
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
)

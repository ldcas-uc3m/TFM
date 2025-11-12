// LTeX: enabled=false

#import "common.typ": *


#let diagram = riscv-reg(
  (
    bits: 32,
    ranges: (),
  ),
  custom-config: (bit-width: 15),
)

#diagram()


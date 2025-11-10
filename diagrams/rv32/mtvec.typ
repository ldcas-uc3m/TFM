// LTeX: enabled=false

#import "common.typ": *



#let diagram = riscv-reg(
  (
    bits: 32,
    ranges: (
      "0-1": (name: "MODE"),
      "2-31": (name: "BASE"),
    ),
  ),
  custom-config: (bit-width: 15),
)

#diagram


// LTeX: enabled=false

#import "common.typ": *


#let diagram = riscv-reg(
  (
    bits: 16,
    ranges: (
      "3": (name: "MIE"),
      "7": (name: "MPIE"),
      "12-11": (name: "MPP"),
    ),
  ),
  top-16: true,
)

#diagram()


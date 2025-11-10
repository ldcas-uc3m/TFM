// LTeX: enabled=false

#import "common.typ": *


#let diagram = riscv-reg(
  (
    bits: 16,
    ranges: (
      "3": (name: "MSIP"),
      "7": (name: "MTIP"),
      "12-11": (name: "MEIP"),
    ),
  ),
  top-16: true,
)

#diagram



// LTeX: enabled=false

#import "common.typ": *


#let diagram = riscv-reg(
  (
    bits: 16,
    ranges: (
      "3": (name: "MSIE"),
      "7": (name: "MTIE"),
      "11": (name: "MEIE"),
    ),
  ),
  top-16: true,
)

#diagram()


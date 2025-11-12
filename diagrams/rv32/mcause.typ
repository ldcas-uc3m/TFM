// LTeX: enabled=false

#import "common.typ": *



#let diagram = riscv-reg(
  (
    bits: 32,
    ranges: (
      "0-30": (name: "Exception Code"),
      "31": (name: "I"),
    ),
  ),
  custom-config: (bit-width: 15),
)

#diagram()




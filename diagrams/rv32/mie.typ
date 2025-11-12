// LTeX: enabled=false

#import "common.typ": *


#let diagram(width: 100%) = {
  top-32-bits(width: width)

  schema.render(
    schema.load(
      (
        structures: (
          main: (
            bits: 16,
            ranges: (
              "3": (name: "MSIE"),
              "7": (name: "MTIE"),
              "12-11": (name: "MEIE"),
            ),
          ),
        ),
      ),
    ),
    config: config.config(..rv32-config),
    width: width,
  )
}

#diagram()


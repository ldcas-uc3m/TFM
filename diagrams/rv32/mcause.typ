
// LTeX: enabled=false

#import "common.typ": *

#schema.render(
  schema.load(
    (
      structures: (
        main: (
          bits: 32,
          ranges: (
            "0-30": (name: "Exception Code"),
            "31": (name: "I"),
          ),
        ),
      ),
    ),
  ),

  config: config.config(bit-width: 18, ..rv32-config),
)


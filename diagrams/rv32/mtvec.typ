
// LTeX: enabled=false

#import "common.typ": *

#schema.render(
  schema.load(
    (
      structures: (
        main: (
          bits: 32,
          ranges: (
            "0-1": (name: "MODE"),
            "2-31": (name: "BASE"),
          ),
        ),
      ),
    ),
  ),

  config: config.config(bit-width: 15, ..rv32-config),
)


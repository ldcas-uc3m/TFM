// LTeX: enabled=false

#import "common.typ": *


#top-32-bits

#schema.render(
  schema.load(
    (
      structures: (
        main: (
          bits: 16,
          ranges: (
            "3": (name: "MIE"),
            "7": (name: "MPIE"),
            "12-11": (name: "MPP"),
          ),
        ),
      ),
    ),
  ),
  config: config.config(..rv32-config),
)


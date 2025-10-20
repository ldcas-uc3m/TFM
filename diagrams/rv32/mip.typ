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
            "3": (name: "MSIP"),
            "7": (name: "MTIP"),
            "12-11": (name: "MEIP"),
          ),
        ),
      ),
    ),
  ),
  config: config.config(..rv32-config),
)


// LTeX: enabled=false

#import "common.typ": *


#schema.render(
  schema.load(
    (
      structures: (
        main: (
          bits: 32,
          ranges: (),
        ),
      ),
    ),
  ),
  config: config.config(bit-width: 15, ..rv32-config),
)


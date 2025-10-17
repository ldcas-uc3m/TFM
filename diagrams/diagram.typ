#set page(height: auto, width: auto, fill: none)

#let filename = sys.inputs.at("FILE", default: none)
#assert(
  filename != none,
  message: "Missing input FILE. Remember to pass it with `--input FILE=<diagram-file.typ>`",
)

#include filename

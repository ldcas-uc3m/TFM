#let filename = sys.inputs.at("FILE", default: none)
#assert(
  filename != none,
  message: "Missing input FILE. Remember to pass it with `--input FILE=<diagram-file.typ>`",
)

// we can't set page width/height to auto or else the compiler explodes (see
// https://git.kb28.ch/HEL/rivet-typst/issues/14)
#let is-rivet = filename.starts-with("rv32")

#set page(
  height: if is-rivet { 6cm } else { auto },
  width: if is-rivet { 21cm } else { auto },
  fill: none,
)

#include filename

//! Auxiliar helper macros

/// Auxiliar table.header
#let table-header(..children, repeat: true) = {
  (table.header(..children, repeat: repeat), table.hline())
}

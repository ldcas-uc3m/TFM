# Diagrams
The diagrams are made in [Typst](https://typst.app/) using [CeTZ](https://cetz-package.github.io/).

To export a specific diagram as SVG, use `diagram.typ` as such:
```sh
typst compile --input FILE=<diagram-file.typ> diagram.typ <diagram-file.svg>
```
Where `<diagram-file.typ>` is the name of the diagram file, e.g. `vectored-interrupts.typ`.

To export as other file formats, modify the output file extension (e.g. `<diagram-file.png`), or use the `--format` flag.
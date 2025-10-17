# Diagrams
The diagrams are made in [Typst](https://typst.app/) using [CeTZ](https://cetz-package.github.io/).

To export a specific diagram as SVG, use `diagram.typ` as such:
```sh
typst compile --format svg --input FILE=<diagram-file.typ> diagram.typ
```
Where `<diagram-file.typ>` is the name of the diagram file, e.g. `vectored-interrupts.typ`.

To export as other file formats, modify the `--format` flag, e.g. `--format png`.
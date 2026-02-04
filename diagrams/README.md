# Diagrams

## Drawio diagrams
Some diagrams are made in [draw.io](https://www.drawio.com/) (`.drawio` files) or [Mermaid](https://mermaid.js.org/) (`.mmd` files) and need to be converted to SVG to be inserted in Typst.

You can use the provided [`export.sh`](architecture/export.sh) script to export them, using:
- [Draw.io Export](https://github.com/rlespinasse/drawio-export) (a docker image) 
- [Mermaid CLI](https://github.com/mermaid-js/mermaid-cli)

> [!NOTE]
> Only Linux is supported for this script. You can try other methods to convert the files (e.g. their online apps). YMMV.



## Typst diagrams
Files ending in `.typ` are made in [Typst](https://typst.app/) using [CeTZ](https://cetz-package.github.io/).

To export a specific diagram as SVG, use `diagram.typ` as such:
```sh
typst compile --input FILE=<diagram-file.typ> diagram.typ <diagram-file.svg>
```
Where `<diagram-file.typ>` is the name of the diagram file, e.g. `vectored-interrupts.typ`.

To export as other file formats, modify the output file extension (e.g. `<diagram-file.png`), or use the `--format` flag.
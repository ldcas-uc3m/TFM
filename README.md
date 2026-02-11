# TFM
By Luis Daniel Casais Mezquida  
Máster Universitario en Ingeniería Informática  
Universidad Carlos III de Madrid


## Compilation
> [!IMPORTANT]
> Make sure to initialize the submodules.
> 
> You can either add the `--recurse-submodules` flag when doing `git clone` or
> do `git submodule update --init --recursive` once it is already cloned.


> [!WARNING]
> Make sure to install the [CaskaydiaCove Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.zip) font, or change the raw text font in [`report.typ`](report.typ).  
>
> More information:
> - [Typst docs](https://typst.app/docs/reference/text/text/#parameters-font)
> - You can check out your system's fonts using `typst fonts`.


Install [Typst](https://github.com/typst/typst?tab=readme-ov-file#installation) and run:
```
typst c main.typ --pdf-standard=a-4
```

> [!TIP]
> For [VS Code](https://code.visualstudio.com/) users, it is recommended to use the [Tinymist Typst](https://marketplace.visualstudio.com/items/?itemName=myriad-dreamin.tinymist) extension, which works without needing to install the compiler.

> [!TIP]
> For [Neovim](https://neovim.io/) users, it is recommended to use the [typst-preview.nvim](https://github.com/chomosuke/typst-preview.nvim) plugin.

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


Install [Typst](https://github.com/typst/typst?tab=readme-ov-file#installation) and run:
```
typst c main.typ
```

> [!TIP]
> For [VS Code](https://code.visualstudio.com/) users, it is recommended to use the [Tinymist Typst](https://marketplace.visualstudio.com/items/?itemName=myriad-dreamin.tinymist) extension, which works without needing to install the compiler.

> [!TIP]
> For [Neovim](https://neovim.io/) users, it is recommended to use the [typst-preview.nvim](https://github.com/chomosuke/typst-preview.nvim) plugin.

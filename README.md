# My NeoVim configuration
This repository contains my whole NeoVim .config directory, that's it.

## Main "features"
- Kanagawa theme.
- Configured `cmp` and `lspconfig`.
- NeaTerm simple terminal windows.
- Barbecue (says where you are in the file, so per example "file.py -> if -> for").
- Telekasten for easy note taking.

 ## Configuration structure
```bash
 .
└── lua/
    ├── config/
    │   ├── user/
    │   │   ├── keymap.lua
    │   │   ├── autocmd.lua
    │   │   ├── colorscheme.lua
    │   │   └── options.lua
    │   └── plugin/
    │       ├── cmp.lua
    │       ├── lazy.lua
    │       ├── lsp.lua
    │       └── notify.lua
    └── plugins/
        └── ...
```
All the configuration is inside the `lua/` directory, as in (almost) every neovim config.

The `lua/config/` directory contains two subdirectories, each having configuration files for either user (keymaps, autocmds, etc.), located in `lua/config/user/` or plugins (`lspconfig`, `cmp`, etc.), located in `lua/config/plugin`.

The `lua/plugins/` directory contains all plugins installed.

## Screenshots
<img src="https://github.com/user-attachments/assets/cc70ee5c-c14d-4265-949a-705c3a8fa7ab" alt="4 buffers open" width="700" heigth="500" title="4 buffers open"> <img src="https://github.com/user-attachments/assets/fb8f2fc7-d6ed-4b17-99e9-c22f898e43f2" alt="ranger-like file explorer" width="700" height="375" title="file explorer">



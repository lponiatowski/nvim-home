# Neovim Configuration

This directory contains the Neovim configuration using Lua.

## Structure

```
nvim/
├── init.lua                    # Main entry point
├── README.md                   # This file
└── lua/
    ├── config/
    │   ├── autocmds.lua       # Autocommands
    │   ├── diagnostics.lua     # Diagnostic configuration
    │   ├── keymaps.lua        # Key mappings
    │   ├── lazy.lua           # Plugin manager configuration
    │   └── options.lua         # Vim options
    └── plugins/
        ├── autopairs.lua      # nvim-autopairs
        ├── blink.lua          # blink.cmp
        ├── bufferline.lua     # bufferline.nvim
        ├── colorscheme.lua    # Color scheme
        ├── comment.lua        # Comment.nvim
        ├── conform.lua        # conform.nvim
        ├── gitsigns.lua       # gitsigns.nvim
        ├── lazygit.lua        # lazygit.nvim
        ├── lsp.lua            # LSP configuration
        ├── lualine.lua        # lualine.nvim
        ├── markdown.lua       # Markdown support
        ├── mason.lua          # mason.nvim
        ├── mermaid.lua        # mermaid-vim
        ├── nvim-tree.lua      # nvim-tree.lua
        ├── rust.lua           # Rust support
        ├── telescope.lua      # telescope.nvim
        ├── tmux.lua           # tmux navigation
        ├── treesitter.lua     # nvim-treesitter
        └── which-key.lua      # which-key.nvim
```

## Setup

1. Ensure Neovim 0.9+ is installed
2. Clone this configuration to `~/.config/nvim`
3. Install plugins with `:Lazy sync`

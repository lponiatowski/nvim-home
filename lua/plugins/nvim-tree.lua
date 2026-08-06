-- nvim-tree.lua configuration
return {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
  keys = {
    {
      "<leader>e",
      "<cmd>NvimTreeToggle<CR>",
      desc = "Toggle file explorer",
    },
    {
      "<leader>E",
      "<cmd>NvimTreeFindFile<CR>",
      desc = "Find file in explorer",
    },
  },
  opts = {
    disable_netrw = true,
    hijack_netrw = true,
    sync_root_with_cwd = true,
    prefer_startup_root = false,
    sort = {
      sorter = "name",
      folders_first = true,
      files_first = false,
    },
    view = {
      width = 30,
      side = "left",
      preserve_window_proportions = true,
      number = false,
      relativenumber = false,
      signcolumn = "yes",
    },
    renderer = {
      add_trailing = false,
      group_empty = true,
      highlight_git = true,
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          bookmark = "",
          modified = "●",
          folder = {
            arrow_closed = "",
            arrow_open = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
          },
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌",
          },
        },
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
          modified = true,
          diagnostics = true,
        },
      },
      indent_markers = {
        enable = true,
        icons = {
          corner = "└ ",
          edge = "│ ",
          item = "│ ",
          bottom = "─ ",
          none = "  ",
        },
      },
    },
    hijack_directories = {
      enable = true,
      auto_open = true,
    },
    filters = {
      dotfiles = false,
      custom = { "^\\.git$" },
      exclude = { ".gitignore", ".DS_Store" },
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 400,
    },
    filesystem_watchers = {
      enable = true,
      debounce_delay = 50,
    },
    actions = {
      open_file = {
        resize_window = true,
        window_picker = {
          enable = true,
          chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
          exclude = {
            filetype = { "notify", "packer", "qf" },
            buftype = { "terminal", "help" },
          },
        },
      },
    },
    trash = {
      cmd = "trash",
      require_confirm = true,
    },
  },
}

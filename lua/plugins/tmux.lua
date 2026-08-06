-- tmux navigation configuration
return {
  "alexghergh/nvim-tmux-navigation",
  event = "VeryLazy",
  opts = {
    disable_when_zoomed = true,
    keybindings = {
      left = "<C-h>",
      down = "<C-j>",
      up = "<C-k>",
      right = "<C-l>",
      previous = "<C-p>",
      next = "<C-n>",
    },
    -- Override tmux prefix key (default: <C-b>)
    -- This allows using <C-a> as prefix for tmux commands
    -- while still using <C-h/j/k/l> for navigation
    tmux_prefix = "<C-a>",
  },
}

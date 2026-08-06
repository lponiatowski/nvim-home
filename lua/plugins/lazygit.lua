-- lazygit.nvim configuration
return {
  "kdheepak/lazygit.nvim",
  cmd = "LazyGit",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "<leader>gg",
      "<cmd>LazyGit<CR>",
      desc = "Open LazyGit",
    },
  },
  init = function()
    -- lazygit.nvim uses vim.g variables for configuration, not setup()
    vim.g.lazygit_floating_window_winblend = 0
    vim.g.lazygit_floating_window_scaling_factor = 0.9
    vim.g.lazygit_floating_window_border_chars = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }
    vim.g.lazygit_floating_window_use_plenary = 1
  end,
}

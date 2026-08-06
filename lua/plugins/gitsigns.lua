-- gitsigns.nvim configuration
return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "│" },
    },
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame = false,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 1000,
    },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,
    max_file_length = 40000,
    preview_config = {
      border = "rounded",
      style = "minimal",
    },
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")
      local keymap = vim.keymap

      keymap.set("n", "<leader>gp", gitsigns.prev_hunk, { buffer = bufnr, desc = "Previous hunk" })
      keymap.set("n", "<leader>gn", gitsigns.next_hunk, { buffer = bufnr, desc = "Next hunk" })
      keymap.set("n", "<leader>gh", gitsigns.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
      keymap.set("n", "<leader>gr", gitsigns.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })
      keymap.set("n", "<leader>gR", gitsigns.reset_buffer, { buffer = bufnr, desc = "Reset buffer" })
      keymap.set("n", "<leader>gb", gitsigns.blame_line, { buffer = bufnr, desc = "Blame line" })
      keymap.set("n", "<leader>gd", gitsigns.diffthis, { buffer = bufnr, desc = "Diff this" })
    end,
  },
}

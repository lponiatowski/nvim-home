-- which-key.nvim configuration
-- Shows a popup with available keybindings when leader is pressed

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    win = {
      border = "rounded",
    },
    -- Ensure leader mappings are discovered and shown
    defaults = {
      ["<leader>"] = { name = "+Leader" },
    },
  },
}



-- blink.cmp configuration
return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  priority = 100,
  dependencies = { "saghen/blink.lib", "nvim-treesitter/nvim-treesitter", "hrsh7th/nvim-cmp" },
  keys = {
    {
      ",",
      function()
        local ok, blink = pcall(require, "blink.cmp")
        -- Check if blink is loaded and expandable function exists and returns true
        if ok and type(blink.expandable) == "function" and blink.expandable() then
          blink.expand()
        else
          -- Fallback: insert comma directly
          local key = vim.api.nvim_replace_termcodes(",", true, true, true)
          vim.api.nvim_feedkeys(key, "i", true)
        end
      end,
      mode = "i",
      desc = "Trigger completion",
    },
  },
}

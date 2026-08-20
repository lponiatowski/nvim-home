-- blink.cmp configuration
return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  priority = 100,
  dependencies = { "saghen/blink.lib", "nvim-treesitter/nvim-treesitter", "hrsh7th/nvim-cmp" },
  keys = {
    {
      "<C-,>",
      function()
        local ok, blink = pcall(require, "blink.cmp")
        -- Check if blink is loaded and expandable function exists and returns true
        if ok and type(blink.expandable) == "function" and blink.expandable() then
          blink.expand()
        end
      end,
      mode = "i",
      desc = "Trigger completion",
    },
  },
}

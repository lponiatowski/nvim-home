-- Comment.nvim configuration
return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  config = function()
    require("Comment").setup({
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      padding = true,
      sticky = true,
      ignore = nil,
      toggler = {
        line = "gcc",
        block = "gBC",
      },
      opleader = {
        line = "gz",
        block = "gB",
      },
      extra = {
        above = "gzO",
        below = "gzo",
        eol = "gzA",
      },
      mappings = {
        basic = true,
        extra = true,
      },
    })
  end,
}

-- Autocommands configuration
local api = vim.api

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when text is yanked",
  group = api.nvim_create_augroup("yank-highlight", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 400 })
  end,
})

-- Auto format on save
api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

-- Set filetype for specific extensions
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.md" },
  callback = function()
    vim.bo.filetype = "markdown"
  end,
})

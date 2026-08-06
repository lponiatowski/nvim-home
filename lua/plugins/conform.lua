-- conform.nvim configuration
return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>F",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black", "isort" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      rust = { "rustfmt" },
      go = { "gofmt", "goimports" },
    },
    format_on_save = false,
    notify_on_error = true,
  },
}

-- Markdown support configuration
return {
  {
    "plasticboy/vim-markdown",
    ft = "markdown",
    config = function()
      vim.g.vim_markdown_folding = 1
      vim.g.vim_markdown_math = 1
      vim.g.vim_markdown_frontmatter = 1
      vim.g.vim_markdown_toc_autofit = 1
    end,
  },
  {
    "dhruvasagar/vim-table-mode",
    ft = "markdown",
    cmd = "TableModeToggle",
  },
  {
    "godlygeek/tabular",
    ft = "markdown",
    cmd = "Tabularize",
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    cmd = { "MarkdownPreview", "MarkdownPreviewToggle", "MarkdownPreviewStop" },
    keys = {
      {
        "<leader>mp",
        "<cmd>MarkdownPreviewToggle<CR>",
        desc = "Toggle Markdown Preview",
      },
    },
    config = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 1
      vim.g.mkdp_theme = "dark"
      vim.g.mkdp_browser = "open"
    end,
  },
}

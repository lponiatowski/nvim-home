-- mermaid.nvim configuration
return {
  "kevalin/mermaid.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  ft = { "mermaid" },
  config = function()
    require("mermaid").setup({
      format = {
        shift_width = 4, -- Indentation size (spaces)
      },
      lint = {
        enabled = true, -- Enable diagnostics via mmdc
        command = "mmdc", -- Path to mermaid-cli executable
      },
      preview = {
        renderer = "mermaid.js", -- "mermaid.js" or "beautiful-mermaid"
        theme = "default", -- Theme name (renderer-specific)
      },
    })

    -- Filetype detection
    vim.filetype.add({
      extension = {
        mmd = "mermaid",
        mermaid = "mermaid",
      },
      pattern = {
        ["%.mmd$"] = "mermaid",
        ["%.mermaid$"] = "mermaid",
      },
    })

    -- Syntax highlighting for mermaid code blocks in markdown
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        vim.treesitter.language.add("markdown.mermaid")
      end,
    })

    -- Mermaid key mappings
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "mermaid",
      callback = function()
        local buf = vim.api.nvim_get_current_buf()
        vim.keymap.set("n", "<leader>mp", "<cmd>MermaidPreview<CR>",
          { buffer = buf, desc = "Mermaid Preview" })
        vim.keymap.set("n", "<leader>mf", "<cmd>MermaidFormat<CR>",
          { buffer = buf, desc = "Mermaid Format" })
        vim.keymap.set("n", "<leader>mr", "<cmd>MermaidRender<CR>",
          { buffer = buf, desc = "Mermaid Render" })
        vim.keymap.set("n", "<leader>mc", "<cmd>MermaidCopyURL<CR>",
          { buffer = buf, desc = "Mermaid Copy URL" })
      end,
    })

    -- Global keymap to stop preview from anywhere
    vim.keymap.set("n", "<leader>mx", "<cmd>MermaidPreviewStop<CR>",
      { desc = "Mermaid Stop Preview" })
  end,
}

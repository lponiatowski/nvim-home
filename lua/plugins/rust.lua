-- Rust support configuration
return {
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
      vim.g.rustfmt_emit_files = 1
      vim.g.rustfmt_fail_silently = 0
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^7",
    ft = "rust",
    init = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(_, bufnr)
            local keymap = vim.keymap

            keymap.set("n", "K", function()
              vim.cmd.RustLsp({ "hover", "actions" })
            end, { buffer = bufnr, desc = "Hover actions" })
            keymap.set("n", "<leader>ra", function()
              vim.cmd.RustLsp("codeAction")
            end, { buffer = bufnr, desc = "Code actions" })
            keymap.set("n", "<leader>rr", function()
              vim.cmd.RustLsp("runnables")
            end, { buffer = bufnr, desc = "Runnables" })
            keymap.set("n", "<leader>rt", function()
              vim.cmd.RustLsp("openCargo")
            end, { buffer = bufnr, desc = "Open Cargo.toml" })
            keymap.set("n", "<leader>rc", function()
              vim.cmd.RustLsp("expandMacro")
            end, { buffer = bufnr, desc = "Expand macro" })
          end,
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
          default_settings = {
            ["rust-analyzer"] = {
              check = {
                command = "clippy",
              },
              procMacro = {
                enable = true,
              },
              diagnostics = {
                enable = true,
                experimental = {
                  enable = true,
                },
              },
              cargo = {
                allFeatures = true,
                buildScripts = {
                  enable = true,
                },
              },
            },
          },
        },
        tools = {
          hover_actions = {
            auto_focus = true,
            border = "rounded",
          },
        },
      }
    end,
  },
  {
    "Saecki/crates.nvim",
    ft = "rust",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      completion = {
        insert_closing_quote = true,
      },
      popup = {
        autofocus = true,
        border = "rounded",
      },
    },
  },
}

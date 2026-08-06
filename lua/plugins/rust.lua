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
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = { "nvim-lua/plenary.nvim", "hrsh7th/cmp-nvim-lsp" },
    opts = function()
      return {
        server = {
          on_attach = function(_, bufnr)
            local rt = require("rust-tools")
            local keymap = vim.keymap

            keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr, desc = "Hover actions" })
            keymap.set("n", "<leader>ra", rt.code_action_group.code_action_group, { buffer = bufnr, desc = "Code actions" })
            keymap.set("n", "<leader>rr", rt.runnables.runnables, { buffer = bufnr, desc = "Runnables" })
            keymap.set("n", "<leader>rt", rt.open_cargo_toml.open_cargo_toml, { buffer = bufnr, desc = "Open Cargo.toml" })
            keymap.set("n", "<leader>rc", function()
              rt.expand_macro.expand_macro({ bufnr = bufnr })
            end, { buffer = bufnr, desc = "Expand macro" })
          end,
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = {
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
          inlay_hints = {
            auto = true,
            only_current_line = false,
            show_parameter_hints = true,
            parameter_hints_prefix = "<-",
            other_hints_prefix = "=>",
          },
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
      src = {
        insert_closing_quote = true,
        validate_cargo_toml = true,
      },
      popup = {
        autofocus = true,
        border = "rounded",
      },
    },
  },
}

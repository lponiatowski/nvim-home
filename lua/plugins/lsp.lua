-- LSP configuration
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      { "folke/neodev.nvim", opts = {} },
    },
    opts = {
      -- Automatically set up servers listed in mason-lspconfig
      automatic_installation = false,
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = { library = vim.env.VIMRUNTIME },
              telemetry = { enable = false },
            },
          },
        },
        pyright = {},
        ts_ls = {},
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              diagnostics = { enable = true },
              procMacro = { enable = true },
              cargo = { allFeatures = true },
              checkOnSave = { command = "clippy" },
            },
          },
        },
        bashls = {},
        jsonls = {},
        yamlls = {},
        html = {},
        cssls = {},
        marksman = {},
      },
      capabilities = function()
        local caps = vim.lsp.protocol.make_client_capabilities()
        -- Add cmp-nvim-lsp capabilities if available
        local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
        if ok then
          caps = cmp_lsp.default_capabilities(caps)
        end
        return caps
      end,
    },
    config = function(_, opts)
      -- Global keymaps for LSP
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local keymap = vim.keymap

          keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf, desc = "Go to definition" })
          keymap.set("n", "gr", vim.lsp.buf.references, { buffer = args.buf, desc = "Go to references" })
          keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = args.buf, desc = "Go to declaration" })
          keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = args.buf, desc = "Go to implementation" })
          keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf, desc = "Show hover" })
          keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = args.buf, desc = "Type definition" })
          keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = args.buf, desc = "Rename" })
          keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = args.buf, desc = "Code action" })
          keymap.set("n", "<leader>cf", function()
            vim.lsp.buf.format({ async = true })
          end, { buffer = args.buf, desc = "Format" })
        end,
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "pyright",
        "ts_ls",
        "rust_analyzer",
        "bashls",
        "jsonls",
        "yamlls",
        "html",
        "cssls",
        "marksman",
      },
      automatic_installation = true,
    },
  },
}

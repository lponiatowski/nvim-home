-- nvim-cmp configuration
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
  },
  opts = {
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = {
      ["<C-Space>"] = require("cmp").mapping.complete(),
      ["<C-e>"] = require("cmp").mapping.abort(),
      ["<CR>"] = require("cmp").mapping.confirm({ select = true }),
      ["<Tab>"] = require("cmp").mapping(function(fallback)
        if require("cmp").visible() then
          require("cmp").select_next_item()
        elseif require("luasnip").expandable() then
          require("luasnip").expand()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = require("cmp").mapping(function(fallback)
        if require("cmp").visible() then
          require("cmp").select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    sources = require("cmp").config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    }),
  },
}

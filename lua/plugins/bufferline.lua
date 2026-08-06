-- bufferline.nvim configuration
return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      mode = "tabs",
      numbers = "buffer_id",
      close_command = function(bufnr)
        require("bufdelete").bufdelete(bufnr, false)
      end,
      right_mouse_command = function(bufnr)
        require("bufdelete").bufdelete(bufnr, false)
      end,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      offsets = {
        {
          filetype = "nvim-tree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
      },
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      separator_style = "slant",
    },
  },
}

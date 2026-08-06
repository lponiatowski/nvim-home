-- Main Neovim configuration entry point
-- Load config modules
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.diagnostics")

-- Load plugin manager (lazy.nvim)
require("config.lazy")

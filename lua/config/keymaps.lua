-- Key mappings configuration
local keymap = vim.keymap

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Clear search highlights
keymap.set("n", "<leader>h", ":nohl<CR>", { silent = true, desc = "Clear search highlights" })

-- Window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Save and quit
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap.set("n", "<leader>Q", ":q!<CR>", { desc = "Force quit" })

-- Buffer management
keymap.set("n", "<leader>bc", ":bdelete!<CR>", { desc = "Close buffer" })
keymap.set("n", "<leader>bC", ":bdelete! %d<CR>", { desc = "Force close buffer" })

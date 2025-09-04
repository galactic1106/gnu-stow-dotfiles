-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- use `vim.keymap.set`

vim.keymap.set("i", "jj", "<esc>", { desc = "Exit insert mode" })

-- vim-tmux-navigator keymaps
vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>")
-- vim.keymap.set("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>")
-- vim.keymap.set("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNext<CR>")

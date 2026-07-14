-- Load built-in packages introduced in v0.12
vim.cmd("packadd undotree")
vim.cmd("packadd difftool")

-- Keymaps for built-in tools
vim.keymap.set('n', '<leader>ut', ':Undotree<CR>', { desc = 'Toggle UndoTree' })
vim.keymap.set('n', '<leader>dt', ':DiffTool<CR>', { desc = 'Toggle DiffTool' })

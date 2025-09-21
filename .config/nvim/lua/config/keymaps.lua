vim.keymap.set('n', '<leader>o', ':update<CR>:source<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>w', function()
    vim.lsp.buf.format()
    vim.cmd('w')
end)

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

-- vim.keymap.set('n', '<leader>ff', ':Pick files<CR>')
-- vim.keymap.set('n', '<leader>fh', ':Pick help<CR>')

vim.keymap.set('n', '<leader>ff', ':Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fh', ':Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fg', ':Telescope help_tags<cr>')

-- vim.keymap.set('n', '<leader>e', ':Oil<CR>')

vim.keymap.set("n", "<leader>e", function()
    require("yazi").yazi()
end)

vim.keymap.set('i', 'jj', '<esc>')

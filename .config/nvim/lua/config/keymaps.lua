vim.keymap.set('n', '<leader>o', ':update<CR>:source<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>w', function()
    vim.lsp.buf.format()
    vim.cmd('w')
end)

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)


vim.keymap.set('n', '<leader>ff', ':Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<cr>')
vim.keymap.set('n', '<leader>fc', ':Telescope commands<cr>')
vim.keymap.set('n', '<leader>fk', ':Telescope keymaps<cr>')

vim.keymap.set("n", "<leader>e", function()
    require("yazi").yazi()
end)

vim.keymap.set('i', 'jj', '<esc>')

vim.keymap.set('n', '<leader>tf', ':Neotree toggle source=filesystem<cr>')
vim.keymap.set('n', '<leader>tg', ':Neotree toggle source=git_status<cr>')
vim.keymap.set('n', '<leader>tb', ':Neotree toggle source=buffers<cr>')
vim.keymap.set('n', '<leader>tt', ':Neotree toggle<cr>')

vim.keymap.set('n', '<C-w>v', ':set splitright<CR>:sp<CR>')
vim.keymap.set('n', '<C-w>h', ':set splitbelow<CR>:sp<CR>')

vim.keymap.set("n", "<leader>la", ":Artisan<cr>", { desc = "Laravel Artisan" })
vim.keymap.set("n", "<leader>lc", ":Composer<cr>", { desc = "Composer" })
vim.keymap.set("n", "<leader>lr", ":LaravelRoute<cr>", { desc = "Laravel Routes" })
vim.keymap.set("n", "<leader>lm", ":LaravelMake<cr>", { desc = "Laravel Make" })


vim.keymap.set({ "n", "x" }, "<leader>ca", function()
    require("tiny-code-action").code_action()
end, { noremap = true, silent = true })


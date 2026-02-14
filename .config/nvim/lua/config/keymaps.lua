-- Helper function for smart LSP formatting
local function smart_format()
    local buf_ft = vim.bo.filetype
    if buf_ft == 'vue' then
        -- For Vue files, specifically request formatting from vue_ls
        vim.lsp.buf.format({ name = "vue_ls", async = true })
    else
        -- For all other files, use the default behavior
        vim.lsp.buf.format({ async = true })
    end
end

vim.keymap.set('n', '<leader>lf', smart_format)

-- Telescope keymaps
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<cr>', { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<cr>', { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<cr>', { desc = 'Find Buffers' })
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<cr>', { desc = 'Help Tags' })
vim.keymap.set('n', '<leader>fc', ':Telescope commands<cr>', { desc = 'Commands' })
vim.keymap.set('n', '<leader>fk', ':Telescope keymaps<cr>', { desc = 'Keymaps' })
vim.keymap.set('n', '<leader>fo', ':Telescope oldfiles<cr>', { desc = 'Recent Files' })
vim.keymap.set('n', '<leader>fw', ':Telescope grep_string<cr>', { desc = 'Find Word Under Cursor' })
vim.keymap.set('n', '<leader>fr', ':Telescope resume<cr>', { desc = 'Resume Last Search' })
vim.keymap.set('n', '<leader>fs', ':Telescope lsp_document_symbols<cr>', { desc = 'Document Symbols' })

-- Toggle hidden files in find_files
vim.keymap.set('n', '<leader>fH', function()
    require('telescope.builtin').find_files({
        find_command = { 'fd', '--type', 'f', '--hidden', '--no-ignore', '--strip-cwd-prefix' },
        prompt_title = 'Find Files (Hidden + No Ignore)',
    })
end, { desc = 'Find Files (Include Hidden/Ignored)' })

-- Toggle hidden files in live_grep
vim.keymap.set('n', '<leader>fG', function()
    require('telescope.builtin').live_grep({
        additional_args = function()
            return { "--hidden", "--no-ignore" }
        end,
        prompt_title = 'Live Grep (Hidden + No Ignore)',
    })
end, { desc = 'Live Grep (Include Hidden/Ignored)' })

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

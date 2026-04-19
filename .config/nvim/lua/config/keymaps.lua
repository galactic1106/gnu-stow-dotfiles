-- General
vim.keymap.set('i', 'jj', '<esc>', { desc = 'Escape to Normal Mode' })
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { silent = true, desc = 'Clear search highlight' })

-- View messages and errors
vim.keymap.set('n', '<leader>m', ':messages<CR>', { desc = 'Show Messages/Errors' })
vim.keymap.set('n', '<leader>un', function() Snacks.notifier.show_history() end, { desc = 'Notification History' })

-- Quick save / quit (Uncomment to enable)
-- vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
-- vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Quit' })
-- vim.keymap.set('n', '<leader>Q', ':qa<CR>', { desc = 'Quit all' })

-- Window & Buffer Management
-- Window splits
vim.keymap.set('n', '<C-w>v', ':set splitright<CR>:vsplit<CR>', { desc = 'Split Right' })
vim.keymap.set('n', '<C-w>s', ':set splitbelow<CR>:split<CR>', { desc = 'Split Below' })

-- Resize windows with arrow keys
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', { silent = true, desc = 'Increase window height' })
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', { silent = true, desc = 'Decrease window height' })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { silent = true, desc = 'Decrease window width' })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { silent = true, desc = 'Increase window width' })

-- Buffer navigation
vim.keymap.set('n', '[b', ':bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', ']b', ':bnext<CR>', { desc = 'Next buffer' })

-- Quick list navigation
vim.keymap.set('n', '[q', ':cprev<CR>', { desc = 'Previous quickfix' })
vim.keymap.set('n', ']q', ':cnext<CR>', { desc = 'Next quickfix' })
vim.keymap.set('n', '[l', ':lprev<CR>', { desc = 'Previous location' })
vim.keymap.set('n', ']l', ':lnext<CR>', { desc = 'Next location' })

-- Better terminal navigation (Uncomment to enable)
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- vim.keymap.set('t', '<C-h>', '<Cmd>wincmd h<CR>', { desc = 'Terminal navigate left' })
-- vim.keymap.set('t', '<C-j>', '<Cmd>wincmd j<CR>', { desc = 'Terminal navigate down' })
-- vim.keymap.set('t', '<C-k>', '<Cmd>wincmd k<CR>', { desc = 'Terminal navigate up' })
-- vim.keymap.set('t', '<C-l>', '<Cmd>wincmd l<CR>', { desc = 'Terminal navigate right' })

-- Text Editing & Movement
-- Move lines up and down
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Toggles (Snacks)
Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")

-- Toggle tiny-inline-diagnostic
vim.keymap.set('n', '<leader>ud', function() require("tiny-inline-diagnostic").toggle() end,
    { desc = 'Toggle Inline Diagnostics' })

Snacks.toggle({
    name = "Blink Auto Show",
    get = function() return vim.g.blink_cmp_auto_show end,
    set = function(state) vim.g.blink_cmp_auto_show = state end,
}):map("<leader>ub")

-- LSP & Diagnostics
Snacks.keymap.set('n', 'gd', vim.lsp.buf.definition,
    { lsp = { method = "textDocument/definition" }, desc = 'Go to Definition' })
Snacks.keymap.set('n', 'gD', vim.lsp.buf.declaration,
    { lsp = { method = "textDocument/declaration" }, desc = 'Go to Declaration' })
Snacks.keymap.set('n', 'gr', vim.lsp.buf.references,
    { lsp = { method = "textDocument/references" }, desc = 'Find References' })
Snacks.keymap.set('n', 'gi', vim.lsp.buf.implementation,
    { lsp = { method = "textDocument/implementation" }, desc = 'Go to Implementation' })
Snacks.keymap.set('n', 'gt', vim.lsp.buf.type_definition,
    { lsp = { method = "textDocument/typeDefinition" }, desc = 'Go to Type Definition' })
Snacks.keymap.set('n', 'K', vim.lsp.buf.hover, { lsp = { method = "textDocument/hover" }, desc = 'Hover Documentation' })
Snacks.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help,
    { lsp = { method = "textDocument/signatureHelp" }, desc = 'Signature Help' })
Snacks.keymap.set('n', 'grn', vim.lsp.buf.rename, { lsp = { method = "textDocument/rename" }, desc = 'Rename Symbol' })
Snacks.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action,
    { lsp = { method = "textDocument/codeAction" }, desc = 'Code Actions' })

Snacks.keymap.set('n', '<leader>lf', function()
    require("conform").format({ async = true, lsp_fallback = true })
end, { desc = 'Format Buffer' })

vim.keymap.set('n', 'gl', function()
    vim.diagnostic.open_float({
        border = 'rounded',
        source = 'always',
        scope = 'line',
        focus = false,
        header = '',
        prefix = function(diagnostic, i, total)
            local signs_map = {
                [vim.diagnostic.severity.ERROR] = '󰅚 ',
                [vim.diagnostic.severity.WARN] = '󰀪 ',
                [vim.diagnostic.severity.HINT] = '󰌶 ',
                [vim.diagnostic.severity.INFO] = '󰋽 ',
            }
            local icon = signs_map[diagnostic.severity] or ' '
            local prefix_text = string.format("%d/%d ", i, total)
            return prefix_text .. icon, 'DiagnosticSign' .. vim.diagnostic.severity[diagnostic.severity]
        end,
    })
end, { desc = 'Line Diagnostics (Floating)' })

-- Finding & Navigation (Telescope)
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

vim.keymap.set('n', '<leader>fF', function()
    require('telescope.builtin').find_files({
        find_command = { 'fd', '--type', 'f', '--hidden', '--no-ignore', '--strip-cwd-prefix' },
        prompt_title = 'Find Files (Hidden + No Ignore)',
    })
end, { desc = 'Find Files (Include Hidden/Ignored)' })

vim.keymap.set('n', '<leader>fG', function()
    require('telescope.builtin').live_grep({
        additional_args = function()
            return { "--hidden", "--no-ignore" }
        end,
        prompt_title = 'Live Grep (Hidden + No Ignore)',
    })
end, { desc = 'Live Grep (Include Hidden/Ignored)' })

-- File Explorers
-- Yazi
vim.keymap.set("n", "<leader>e", function() require("yazi").yazi() end, { desc = 'File Explorer (Yazi)' })

-- NeoTree
vim.keymap.set('n', '<leader>tf', ':Neotree toggle source=filesystem<cr>', { desc = 'Toggle Filesystem' })
vim.keymap.set('n', '<leader>tg', ':Neotree toggle source=git_status<cr>', { desc = 'Toggle Git Status' })
vim.keymap.set('n', '<leader>tb', ':Neotree toggle source=buffers<cr>', { desc = 'Toggle Buffers' })
vim.keymap.set('n', '<leader>ts', ':Neotree toggle source=document_symbols<cr>', { desc = 'Toggle Document Symbols' })
vim.keymap.set('n', '<leader>tt', ':Neotree toggle<cr>', { desc = 'Toggle NeoTree' })

-- Tools & Frameworks
-- Terminal
vim.keymap.set({ "n", "t" }, "<C-/>", function() Snacks.terminal.toggle() end, { desc = "Toggle Terminal" })

-- Laravel
Snacks.keymap.set("n", "<leader>la", ":Artisan<cr>", { ft = { "php", "blade" }, desc = "Laravel Artisan" })
Snacks.keymap.set("n", "<leader>lc", ":Composer<cr>", { ft = { "php", "blade" }, desc = "Composer" })
Snacks.keymap.set("n", "<leader>lr", ":LaravelRoute<cr>", { ft = { "php", "blade" }, desc = "Laravel Routes" })
Snacks.keymap.set("n", "<leader>lm", ":LaravelMake<cr>", { ft = { "php", "blade" }, desc = "Laravel Make" })

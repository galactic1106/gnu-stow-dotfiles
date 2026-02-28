-- LSP keymaps
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition' })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to Declaration' })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Find References' })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to Implementation' })
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { desc = 'Go to Type Definition' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature Help' })
vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature Help' })
vim.keymap.set('n', 'grn', vim.lsp.buf.rename, { desc = 'Rename Symbol' })
vim.keymap.set('n', '<leader>D', vim.diagnostic.open_float, { desc = 'Show Line Diagnostics' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous Diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next Diagnostic' })

-- LSP formatting
vim.keymap.set('n', '<leader>lf', function()
    vim.lsp.buf.format({ async = true })
end, { desc = 'Format Buffer' })

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
end, { desc = 'File Explorer (Yazi)' })

vim.keymap.set('i', 'jj', '<esc>', { desc = 'Escape to Normal Mode' })

vim.keymap.set('n', '<leader>tf', ':Neotree toggle source=filesystem<cr>', { desc = 'Toggle Filesystem' })
vim.keymap.set('n', '<leader>tg', ':Neotree toggle source=git_status<cr>', { desc = 'Toggle Git Status' })
vim.keymap.set('n', '<leader>tb', ':Neotree toggle source=buffers<cr>', { desc = 'Toggle Buffers' })
vim.keymap.set('n', '<leader>tt', ':Neotree toggle<cr>', { desc = 'Toggle NeoTree' })

vim.keymap.set('n', '<C-w>v', ':set splitright<CR>:vsplit<CR>', { desc = 'Split Right' })
vim.keymap.set('n', '<C-w>s', ':set splitbelow<CR>:split<CR>', { desc = 'Split Below' })

vim.keymap.set("n", "<leader>la", ":Artisan<cr>", { desc = "Laravel Artisan" })
vim.keymap.set("n", "<leader>lc", ":Composer<cr>", { desc = "Composer" })
vim.keymap.set("n", "<leader>lr", ":LaravelRoute<cr>", { desc = "Laravel Routes" })
vim.keymap.set("n", "<leader>lm", ":LaravelMake<cr>", { desc = "Laravel Make" })


-- Better window navigation
vim.keymap.set('n', '<leader>w', '<C-w>', { desc = 'Window commands' })

-- Quick save
-- vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
-- vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Quit' })
-- vim.keymap.set('n', '<leader>Q', ':qa<CR>', { desc = 'Quit all' })

-- Move lines up and down
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Clear search highlighting
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { silent = true, desc = 'Clear search highlight' })

-- Quick list navigation
vim.keymap.set('n', '<leader>xl', ':lopen<CR>', { desc = 'Location List' })
vim.keymap.set('n', '<leader>xq', ':copen<CR>', { desc = 'Quickfix List' })
vim.keymap.set('n', '[q', ':cprev<CR>', { desc = 'Previous quickfix' })
vim.keymap.set('n', ']q', ':cnext<CR>', { desc = 'Next quickfix' })
vim.keymap.set('n', '[l', ':lprev<CR>', { desc = 'Previous location' })
vim.keymap.set('n', ']l', ':lnext<CR>', { desc = 'Next location' })

-- Better buffer navigation
vim.keymap.set('n', '[b', ':bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', ']b', ':bnext<CR>', { desc = 'Next buffer' })

-- Resize windows with arrow keys
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', { silent = true, desc = 'Increase window height' })
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', { silent = true, desc = 'Decrease window height' })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { silent = true, desc = 'Decrease window width' })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { silent = true, desc = 'Increase window width' })

-- Better terminal navigation
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<C-h>', '<Cmd>wincmd h<CR>', { desc = 'Terminal navigate left' })
vim.keymap.set('t', '<C-j>', '<Cmd>wincmd j<CR>', { desc = 'Terminal navigate down' })
vim.keymap.set('t', '<C-k>', '<Cmd>wincmd k<CR>', { desc = 'Terminal navigate up' })
vim.keymap.set('t', '<C-l>', '<Cmd>wincmd l<CR>', { desc = 'Terminal navigate right' })

-- Toggle options
vim.keymap.set('n', '<leader>uw', function()
    vim.wo.wrap = not vim.wo.wrap
    print('Wrap: ' .. tostring(vim.wo.wrap))
end, { desc = 'Toggle word wrap' })

-- Enhanced diagnostic floating window
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
        [vim.diagnostic.severity.INFO] = ' ',
      }
      local icon = signs_map[diagnostic.severity] or ' '
      local prefix_text = string.format("%d/%d ", i, total)
      return prefix_text .. icon, 'DiagnosticSign' .. vim.diagnostic.severity[diagnostic.severity]
    end,
  })
end, { desc = 'Line Diagnostics (Floating)' })

-- Toggle virtual text (inline diagnostics)
vim.keymap.set('n', '<leader>dv', function()
  local config = vim.diagnostic.config()
  if config.virtual_text then
    vim.diagnostic.config({ virtual_text = false })
    print("Virtual text disabled")
  else
    vim.diagnostic.config({
      virtual_text = {
        severity = { min = vim.diagnostic.severity.WARN },
        source = "if_many",
        prefix = '●',
        spacing = 4,
      }
    })
    print("Virtual text enabled")
  end
end, { desc = 'Toggle Diagnostic Virtual Text' })

-- Show all buffer diagnostics in location list
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Diagnostics to Location List' })

-- Show all workspace diagnostics in quickfix
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setqflist, { desc = 'Diagnostics to Quickfix' })

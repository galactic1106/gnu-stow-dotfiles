-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Close certain filetypes with just 'q'
vim.api.nvim_create_autocmd('FileType', {
    desc = 'Close certain filetypes with q',
    group = vim.api.nvim_create_augroup('close-with-q', { clear = true }),
    pattern = {
        'qf',
        'help',
        'man',
        'notify',
        'lspinfo',
        'spectre_panel',
        'startuptime',
        'tsplayground',
        'PlenaryTestPopup',
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
    end,
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd('BufWritePre', {
    desc = 'Remove trailing whitespace on save',
    group = vim.api.nvim_create_augroup('remove-trailing-whitespace', { clear = true }),
    pattern = '*',
    callback = function()
        local save_cursor = vim.fn.getpos('.')
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos('.', save_cursor)
    end,
})

-- Auto-create directories when saving a file
vim.api.nvim_create_autocmd('BufWritePre', {
    desc = 'Auto-create parent directories when saving',
    group = vim.api.nvim_create_augroup('auto-create-dir', { clear = true }),
    callback = function(event)
        if event.match:match('^%w%w+://') then
            return
        end
        local file = vim.loop.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
    end,
})

-- Restore cursor position when opening a file
vim.api.nvim_create_autocmd('BufReadPost', {
    desc = 'Restore cursor position',
    group = vim.api.nvim_create_augroup('restore-cursor', { clear = true }),
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd('VimResized', {
    desc = 'Auto-resize splits when window is resized',
    group = vim.api.nvim_create_augroup('auto-resize', { clear = true }),
    callback = function()
        vim.cmd('tabdo wincmd =')
    end,
})

-- Check if file changed outside of Neovim
vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
    desc = 'Check if file changed outside of Neovim',
    group = vim.api.nvim_create_augroup('checktime', { clear = true }),
    command = 'checktime',
})

-- Disable auto-commenting on new line
vim.api.nvim_create_autocmd('FileType', {
    desc = 'Disable auto-commenting on new line',
    group = vim.api.nvim_create_augroup('disable-auto-comment', { clear = true }),
    pattern = '*',
    callback = function()
        vim.opt_local.formatoptions:remove({ 'r', 'o' })
    end,
})

-- Set specific settings for certain filetypes
vim.api.nvim_create_autocmd('FileType', {
    desc = 'Set 2 spaces for specific filetypes',
    group = vim.api.nvim_create_augroup('filetype-indent', { clear = true }),
    pattern = { 'lua', 'javascript', 'typescript', 'vue', 'json', 'yaml', 'html', 'css', 'scss' },
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
    end,
})

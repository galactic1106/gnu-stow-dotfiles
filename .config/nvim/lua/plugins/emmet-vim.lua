vim.pack.add({ { src = 'https://github.com/mattn/emmet-vim', name = "emmet-vim" } })

-- Configure Emmet to support Vue components with PascalCase
vim.g.user_emmet_settings = {
    vue = {
        extends = 'html',
        default_attributes = {
            option = { value = nil },
            textarea = { id = nil, name = nil, cols = 10, rows = 10 },
        },
    },
}

-- Allow PascalCase in custom_tags for Vue components
vim.g.user_emmet_custom_snippets = {
    vue = {
        snippets = {}
    }
}

-- By default, the expansion key is <C-y>,
-- This sets the expansion key to <Tab> for relevant web development filetypes.
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "html", "vue", "css", "php", "blade" },
    callback = function()
        vim.keymap.set('i', '<Tab>', function()
            -- Get current line and cursor position
            local line = vim.api.nvim_get_current_line()
            local col = vim.api.nvim_win_get_cursor(0)[2]
            local before_cursor = line:sub(1, col)
            
            -- Check if we have a PascalCase word (Vue component pattern)
            local vue_component = before_cursor:match('(%u%w+)$')
            
            if vim.fn['emmet#isExpandable']() == 1 or vue_component then
                return '<C-y>,'
            else
                return '<Tab>'
            end
        end, { noremap = true, silent = true, buffer = true, expr = true })
    end,
})

vim.pack.add({ { src = 'https://github.com/mattn/emmet-vim', name = "emmet-vim" } })

-- By default, the expansion key is <C-y>,
-- This sets the expansion key to <Tab> for relevant web development filetypes.
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "html", "vue", "css", "php", "blade" },
    callback = function()
        vim.keymap.set('i', '<Tab>', '<C-y>,', { noremap = true, silent = true, buffer = true })
    end,
})

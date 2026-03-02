-- Enhanced Diagnostics Configuration

-- Define custom diagnostic signs with Nerd Font icons
local signs = {
    Error = "󰅚 ",
    Warn = "󰀪 ",
    Hint = "󰌶 ",
    Info = " "
}

-- Set the signs in the sign column
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Configure diagnostics appearance
vim.diagnostic.config({
    -- Virtual text configuration (inline diagnostics at end of line)
    -- Disabled because we're using tiny-inline-diagnostic plugin
    virtual_text = false,

    -- Show signs in the sign column (gutter)
    signs = {
        severity = { min = vim.diagnostic.severity.HINT }, -- Show all severities
    },

    -- Underline code with issues
    underline = {
        severity = { min = vim.diagnostic.severity.HINT },
    },

    -- Don't update diagnostics while typing
    update_in_insert = false,

    -- Sort by severity (errors first)
    severity_sort = true,

    -- Floating window configuration
    -- Disabled to prevent duplicates with tiny-inline-diagnostic
    float = false,
})

-- Auto-show diagnostics in floating window on cursor hold
-- DISABLED: Commented out to prevent duplicates with tiny-inline-diagnostic
-- local diagnostic_hover_augroup = vim.api.nvim_create_augroup("DiagnosticHover", { clear = true })
-- vim.api.nvim_create_autocmd("CursorHold", {
--   group = diagnostic_hover_augroup,
--   callback = function()
--     local opts = {
--       focusable = false,
--       close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
--       border = 'rounded',
--       source = 'always',
--       prefix = ' ',
--       scope = 'cursor',
--     }
--     vim.diagnostic.open_float(nil, opts)
--   end
-- })

-- Optional: Customize diagnostic highlight colors
-- Uncomment to use custom colors
-- vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = '#db4b4b', italic = true })
-- vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { fg = '#e0af68', italic = true })
-- vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = '#0db9d7', italic = true })
-- vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { fg = '#1abc9c', italic = true })

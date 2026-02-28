vim.pack.add({ { src = "https://github.com/windwp/nvim-autopairs", name = "nvim-autopairs" } })

require('nvim-autopairs').setup({
    check_ts = true,        -- Enable treesitter integration
    ts_config = {
        lua = { 'string' }, -- Don't add pairs in lua string treesitter nodes
        javascript = { 'template_string' },
        java = false,       -- Don't check treesitter on java
    },
    disable_filetype = { "TelescopePrompt", "vim" },
    enable_moveright = true,
    enable_afterquote = true,         -- Add bracket pairs after quote
    enable_check_bracket_line = true, -- Don't add pairs if it already has a close pair in same line
    enable_bracket_in_quote = true,
    enable_abbr = false,              -- Trigger abbreviation
    break_undo = true,                -- Switch for basic rule break undo sequence
    map_cr = true,
    map_bs = true,                    -- Map backspace key
    map_c_h = false,                  -- Map <C-h> to delete a pair
    map_c_w = false,                  -- Map <C-w> to delete a pair if possible
})

-- Integration with blink.cmp
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local blink_cmp = require('blink.cmp')

-- This will automatically insert `(` after selecting a function or method item
blink_cmp.setup({
    completion = {
        accept = {
            auto_brackets = {
                enabled = true,
            },
        },
    },
})

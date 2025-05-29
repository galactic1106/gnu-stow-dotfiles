return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master', 
    lazy = false, 
    build = ":TSUpdate",
    config= function ()
        local config = require('nvim-treesitter.configs')
        config.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            highlight = { enable = true },
            indent={enable=true},
            })
    end,
}

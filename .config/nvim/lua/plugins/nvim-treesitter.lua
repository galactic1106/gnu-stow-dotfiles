vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter", name = "nvim-treesitter", version = "main" } })

-- nvim-treesitter for Neovim 0.12+ (main branch) has been completely rewritten.
-- Syntax highlighting and indentation are now fully native to Neovim 0.12.
-- We no longer need to define `highlight = { enable = true }` or use the old configs module.

local ts = require('nvim-treesitter')

-- Initialize the plugin (optional, but good practice)
ts.setup()

-- List of parsers to ensure are installed
local parsers = {
    "scss", "css", "lua", "php", "blade", "typescript", "javascript",
    "c", "vue", "java", "cpp", "html", "rust", "markdown", "markdown_inline"
}

-- Asynchronously install the requested parsers (this is a no-op if they are already installed)
ts.install(parsers)

-- Handle automatic parser updates when the plugin itself is updated via pack-manager
vim.api.nvim_create_autocmd('PackChanged', {
    desc = 'Handle nvim-treesitter updates',
    group = vim.api.nvim_create_augroup('nvim-treesitter-pack-changed-update-handler', { clear = true }),
    callback = function(event)
        if event.data.kind == 'update' and event.data.spec.name == 'nvim-treesitter' then
            vim.notify('nvim-treesitter updated, running TSUpdate...', vim.log.levels.INFO)
            local ok = pcall(vim.cmd, 'TSUpdate')
            if ok then
                vim.notify('TSUpdate completed successfully!', vim.log.levels.INFO)
            else
                vim.notify('TSUpdate command failed or missing, skipping', vim.log.levels.WARN)
            end
        end
    end,
})

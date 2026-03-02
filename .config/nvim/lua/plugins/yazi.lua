vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim", name = "plenary" },
    { src = "https://github.com/mikavilpas/yazi.nvim",  name = "yazi" },
})

require("yazi").setup({
    -- Don't auto-open yazi for directories
    open_for_directories = false,

    -- Optional: Configure floating window
    floating_window_scaling_factor = 0.9,

    -- Optional: Yazi window border style
    yazi_floating_window_border = 'single', -- 'single' | 'double' | 'rounded' | 'none'

    -- Log level
    log_level = vim.log.levels.OFF,

    -- Integration with other tools
    integrations = {
        fd = true,
        grep = 'ripgrep',
    },
})

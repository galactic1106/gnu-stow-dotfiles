vim.pack.add({
    { src = "https://github.com/MunifTanjim/nui.nvim" },
    { src = "https://github.com/adibhanna/laravel.nvim" },
})

require("laravel").setup({
    notifications = true,   -- Enable/disable Laravel.nvim notifications (default: true)
    debug = false,          -- Enable/disable debug error notifications (default: false)
    keymaps = true,         -- Enable/disable Laravel.nvim keymaps (default: true)
    sail = {
        enabled = true,     -- Enable/disable Laravel Sail integration (default: true)
        auto_detect = true, -- Auto-detect Sail usage in project (default: true)
    },
})

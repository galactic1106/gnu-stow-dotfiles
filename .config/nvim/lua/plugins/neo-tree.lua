vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim",       name = "plenary" },
    { src = "https://github.com/MunifTanjim/nui.nvim",        name = "nui" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons", name = "nvim-web-devicons" },
    {
        src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
        version = vim.version.range('3'),
        name = "neo-tree"
    },
})

require("neo-tree").setup({
    filesystem = {
        hijack_netrw_behavior = "disabled",
        -- "open_default",
        -- "open_current",
    }
})

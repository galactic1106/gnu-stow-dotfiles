vim.pack.add({ { src = "https://github.com/folke/snacks.nvim", name = "snacks.nvim" } })

require("snacks").setup({
    -- You can enable and configure various snacks.nvim modules here.
    bigfile = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
})

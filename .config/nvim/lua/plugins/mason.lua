vim.pack.add({
    { src = "https://github.com/stevearc/dressing.nvim", name = "dressing" },
    { src = "https://github.com/mason-org/mason.nvim",   name = "mason" },
})


require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim",           name = "mason" },
    { src = "https://github.com/neovim/nvim-lspconfig",          name = "nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim", name = "mason-lspconfig" },
})

require("mason-lspconfig").setup({
    ensure_installed = {
    }
})

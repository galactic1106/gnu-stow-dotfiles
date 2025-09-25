vim.pack.add({ { src = "https://github.com/mikavilpas/yazi.nvim" },
    { src = "https://github.com/nvim-lua/plenary.nvim" }
})

vim.g.loaded_netrwPlugin = 1


require("yazi").setup({
    open_for_directories = true,
})

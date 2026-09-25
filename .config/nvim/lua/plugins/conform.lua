vim.pack.add({ { src = "https://github.com/stevearc/conform.nvim.git", name = "conform" } })

require("conform").setup({
  formatters_by_ft = {
    gdscript = { "gdformat" },
    javascript = { "prettier" },
    python = { "ruff_format", "ruff_organize_imports" },
  },
})

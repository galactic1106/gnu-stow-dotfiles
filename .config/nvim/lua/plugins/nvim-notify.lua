vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim", name = "plenary" },
  { src = "https://github.com/rcarriga/nvim-notify",  name = "nvim-notify" }
})
vim.notify = require("notify")
require("notify").setup({
  stages = "fade_in_slide_out",
  render = "default",
  timeout = 5000,
  minimum_width = 50,
  icons = {
    ERROR = vim.diagnostic.severity.ERROR,
    WARN = vim.diagnostic.severity.WARN,
    INFO = vim.diagnostic.severity.INFO,
    DEBUG = vim.diagnostic.severity.HINT,
    TRACE = "✎ ",
  },
})

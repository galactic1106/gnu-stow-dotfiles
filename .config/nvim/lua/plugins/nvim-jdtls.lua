vim.pack.add({ { src = "https://github.com/mfussenegger/nvim-jdtls", name = "nvim-jdtls" } })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    local config = {
      cmd = { "jdtls" },
      root_dir = vim.fs.dirname(vim.fs.find({ '.gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    }
    require('jdtls').start_or_attach(config)
  end,
})

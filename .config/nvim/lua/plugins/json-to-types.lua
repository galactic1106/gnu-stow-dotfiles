vim.pack.add({
  {
    src = 'https://github.com/Redoxahmii/json-to-types.nvim',
    name = 'json-to-types',
  }
})

local plugin_dir = vim.fn.stdpath("data") .. "/site/pack/core/opt/json-to-types.nvim"
local node_modules_dir = plugin_dir .. "/node_modules"

-- Check if the plugin is installed but missing its dependencies
if vim.fn.isdirectory(plugin_dir) == 1 and vim.fn.isdirectory(node_modules_dir) == 0 then
  vim.notify("Building json-to-types.nvim dependencies...", vim.log.levels.INFO)
  vim.fn.jobstart({ "sh", "install.sh", "npm" }, {
    cwd = plugin_dir,
    on_exit = function(_, code)
      if code == 0 then
        vim.notify("json-to-types.nvim build complete!", vim.log.levels.INFO)
      else
        vim.notify("json-to-types.nvim build failed.", vim.log.levels.ERROR)
      end
    end
  })
end

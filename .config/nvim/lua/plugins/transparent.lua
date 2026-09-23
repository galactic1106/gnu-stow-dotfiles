vim.pack.add({ { src = "https://github.com/tribela/transparent.nvim.git", name = "transparent.nvim" } })


require("transparent").setup({
  auto = true,       -- Automatically applies transparent
  extra_groups = {}, -- If you want to add some groups to be transparent. eg: { 'Pmenu', 'CocFloating' }
  excludes = {},     -- If you want to excludes from default transparent groups. eg: { 'LineNr' }
})

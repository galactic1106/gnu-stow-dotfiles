vim.pack.add({{src = "https://github.com/arborist-ts/arborist.nvim.git",
  name = "arborist.nvim"
}})

-- 2. Configure Arborist's parser management
require('arborist').setup({
  -- Pre-install the most common languages in the background on startup
  install_popular = true,

  -- Just-in-Time compilation: install missing parsers when opening a new filetype
  auto_install = true,

  -- Use WebAssembly for safer, cross-platform parser execution without a C compiler
  compiler = "wasm",

  -- Automatically fetch community-maintained .scm query files for highlighting
  sync_queries = true,
})

-- 3. Enable Neovim 0.12's native highlighting and folding
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('ArboristNativeHighlight', { clear = true }),
  callback = function()
    -- Safely start native Tree-sitter highlighting for the current buffer
    pcall(vim.treesitter.start)

    -- Enable native Tree-sitter indentation
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- Set native folding to use Tree-sitter
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldmethod = 'expr'
-- Start with folds open
vim.opt.foldenable = false


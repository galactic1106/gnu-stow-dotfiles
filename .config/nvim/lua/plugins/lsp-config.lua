return{
   {
      "mason-org/mason.nvim",
      opts = {
         ui = {
            icons = {
               package_installed = "✓",
               package_pending = "➜",
               package_uninstalled = "✗"
            }
         }
      },
      config=function()
         require("mason").setup({

         })

      end
   },
   {
      "mason-org/mason-lspconfig.nvim",
      opts = {
         ensure_installed = { 
            "lua_ls",
            "rust_analyzer" 
         },
      },
      dependencies = {
         { "mason-org/mason.nvim", opts = {} },
         "neovim/nvim-lspconfig",
      },
      config=function()
         require("mason-lspconfig").setup({

         })
      end
   },
   {
      "neovim/nvim-lspconfig",
      config=function()
         local lspconfig=require("lspconfig")
         lspconfig.lua_ls.setup({})


         vim.keymap.set({'n'},'<leader>ca',vim.lsp.buf.code_action,{})
      end,
   }
}

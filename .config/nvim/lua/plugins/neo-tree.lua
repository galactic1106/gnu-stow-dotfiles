return {
   "nvim-neo-tree/neo-tree.nvim",
   branch = "v3.x",
   dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", 
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
   },
   init=function()
      vim.g.neotree={
         auto_close = true,
         auto_open = false,
         auto_update = true,
         update_to_buf_dir = true,
      }
   end,
   lazy = false,
   opts = {},
   config=function()
      vim.keymap.set('n','<C-e>',':Neotree toggle filesystem position=left<cr>')
   end
}



vim.pack.add({
  { src = 'https://github.com/Saghen/blink.lib',                 name = 'blink.lib' },
  { src = "https://github.com/rafamadriz/friendly-snippets.git", name = 'friendly-snippets' },
  { src = 'https://github.com/onsails/lspkind.nvim.git',         name = 'lspkind' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons.git',  name = 'nvim-web-devicons' },
  { src = 'https://github.com/Saghen/blink.cmp',                 name = 'blink' }
})

local blink = require('blink.cmp')
blink.build():pwait()
blink.setup({
  keymap = {
    preset = 'default',
    ['<A-1>'] = { function(cmp) cmp.accept({ index = 1 }) end },
    ['<A-2>'] = { function(cmp) cmp.accept({ index = 2 }) end },
    ['<A-3>'] = { function(cmp) cmp.accept({ index = 3 }) end },
    ['<A-4>'] = { function(cmp) cmp.accept({ index = 4 }) end },
    ['<A-5>'] = { function(cmp) cmp.accept({ index = 5 }) end },
    ['<A-6>'] = { function(cmp) cmp.accept({ index = 6 }) end },
    ['<A-7>'] = { function(cmp) cmp.accept({ index = 7 }) end },
    ['<A-8>'] = { function(cmp) cmp.accept({ index = 8 }) end },
    ['<A-9>'] = { function(cmp) cmp.accept({ index = 9 }) end },
    ['<A-0>'] = { function(cmp) cmp.accept({ index = 10 }) end },
  },
  completion = {
    accept = {
      auto_brackets = {
        enabled = true,
      },
    },
    menu = {
      draw = {
        columns = { { 'item_idx' }, { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
        padding = 1,

        components = {
          kind_icon = {
            text = function(ctx)
              if ctx.source_name ~= "Path" then
                return (require("lspkind").symbol_map[ctx.kind] or "") .. ctx.icon_gap
              end

              local is_unknown_type = vim.tbl_contains({ "link", "socket", "fifo", "char", "block", "unknown" },
                ctx.item.data.type)
              local mini_icon, _ = require("mini.icons").get(
                is_unknown_type and "os" or ctx.item.data.type,
                is_unknown_type and "" or ctx.label
              )

              return (mini_icon or ctx.kind_icon) .. ctx.icon_gap
            end,

            highlight = function(ctx)
              if ctx.source_name ~= "Path" then return ctx.kind_hl end

              local is_unknown_type = vim.tbl_contains({ "link", "socket", "fifo", "char", "block", "unknown" },
                ctx.item.data.type)
              local mini_icon, mini_hl = require("mini.icons").get(
                is_unknown_type and "os" or ctx.item.data.type,
                is_unknown_type and "" or ctx.label
              )
              return mini_icon ~= nil and mini_hl or ctx.kind_hl
            end,
          },
          item_idx = {
            text = function(ctx) return ctx.idx == 10 and '0' or ctx.idx >= 10 and ' ' or tostring(ctx.idx) end,
            highlight = 'BlinkCmpItemIdx' -- optional, only if you want to change its color
          }
        }
      }
    }
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  signature = {
    enabled = true,
    trigger = {
      -- Show the signature help automatically
      enabled = true,
      -- Show the signature help window after typing any of alphanumerics, `-` or `_`
      show_on_keyword = false,
      blocked_trigger_characters = {},
      blocked_retrigger_characters = {},
      -- Show the signature help window after typing a trigger character
      show_on_trigger_character = true,
      -- Show the signature help window when entering insert mode
      show_on_insert = false,
      -- Show the signature help window when the cursor comes after a trigger character when entering insert mode
      show_on_insert_on_trigger_character = true,
    },
    window = {
      min_width = 1,
      max_width = 100,
      max_height = 10,
      border = nil, -- Defaults to `vim.o.winborder` on nvim 0.11+ or 'padded' when not defined/<=0.10
      winblend = 0,
      winhighlight = 'Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder',
      scrollbar = false, -- Note that the gutter will be disabled when border ~= 'none'
      -- Which directions to show the window,
      -- falling back to the next direction when there's not enough space,
      -- or another window is in the way
      direction_priority = { 'n', 's' },
      -- Can accept a function if you need more control
      -- direction_priority = function()
      --   if condition then return { 'n', 's' } end
      --   return { 's', 'n' }
      -- end,

      -- Disable if you run into performance issues
      treesitter_highlighting = true,
      show_documentation = true,
    },
  }


})

vim.g.blink_cmp_auto_show = true




--[[ cmp.setup({
  keymap = {
    preset = 'default',
    ['<CR>'] = { 'accept', 'fallback' },
    ['<C-Space>'] = { "show" },
    ['<A-1>'] = { function(cmp) cmp.accept({ index = 1 }) end },
    ['<A-2>'] = { function(cmp) cmp.accept({ index = 2 }) end },
    ['<A-3>'] = { function(cmp) cmp.accept({ index = 3 }) end },
    ['<A-4>'] = { function(cmp) cmp.accept({ index = 4 }) end },
    ['<A-5>'] = { function(cmp) cmp.accept({ index = 5 }) end },
    ['<A-6>'] = { function(cmp) cmp.accept({ index = 6 }) end },
    ['<A-7>'] = { function(cmp) cmp.accept({ index = 7 }) end },
    ['<A-8>'] = { function(cmp) cmp.accept({ index = 8 }) end },
    ['<A-9>'] = { function(cmp) cmp.accept({ index = 9 }) end },
    ['<A-0>'] = { function(cmp) cmp.accept({ index = 10 }) end },
  },
  completion = {
    accept = {
      auto_brackets = {
        enabled = true,
      },
    },
    menu = {
      auto_show = function() return vim.g.blink_cmp_auto_show end,
      auto_show_delay_ms = 0,
      draw = {
        columns = { { 'item_idx' }, { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
        components = {
          item_idx = {
            text = function(ctx) return ctx.idx == 10 and '0' or ctx.idx >= 10 and ' ' or tostring(ctx.idx) end,
            highlight = 'BlinkCmpItemIdx'             -- optional, only if you want to change its color
          }
        }
      }
    },
    ghost_text = {
      enabled = true,
      show_with_menu = false,
    },
    documentation = {
      auto_show = false
    }
  },
  fuzzy = {
    implementation = "prefer_rust",
  },
  -- Experimental signature help support
}) ]]

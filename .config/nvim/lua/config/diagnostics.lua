-- Enhanced Diagnostics Configuration

-- Define custom diagnostic signs with Nerd Font icons
local signs = {
  Error = "󰅚 ",
  Warn = "󰀪 ",
  Hint = "󰌶 ",
  Info = " "
}

-- Set the signs in the sign column
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Configure diagnostics appearance
vim.diagnostic.config({
  -- Virtual text configuration (inline diagnostics at end of line)
  virtual_text = {
    severity = { min = vim.diagnostic.severity.WARN }, -- Only show warnings and errors
    source = "if_many", -- Show source if multiple sources
    prefix = '●', -- Bullet point prefix
    spacing = 4,
    format = function(diagnostic)
      -- Truncate long messages
      local max_width = 60
      if #diagnostic.message > max_width then
        return diagnostic.message:sub(1, max_width) .. "..."
      end
      return diagnostic.message
    end,
  },
  
  -- Show signs in the sign column (gutter)
  signs = {
    severity = { min = vim.diagnostic.severity.HINT }, -- Show all severities
  },
  
  -- Underline code with issues
  underline = {
    severity = { min = vim.diagnostic.severity.HINT },
  },
  
  -- Don't update diagnostics while typing
  update_in_insert = false,
  
  -- Sort by severity (errors first)
  severity_sort = true,
  
  -- Floating window configuration
  float = {
    border = 'rounded',
    source = 'always',  -- Always show the source
    header = '',
    prefix = function(diagnostic, i, total)
      local icon = signs[vim.diagnostic.severity[diagnostic.severity]]
      local prefix_text = string.format("%d. ", i)
      return prefix_text .. icon, "DiagnosticSign" .. vim.diagnostic.severity[diagnostic.severity]
    end,
    suffix = '',
    format = function(diagnostic)
      return diagnostic.message
    end,
    max_width = 80,
    max_height = 20,
    focusable = true,
    focus = false,
    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
  },
})

-- Auto-show diagnostics in floating window on cursor hold
local diagnostic_hover_augroup = vim.api.nvim_create_augroup("DiagnosticHover", { clear = true })
vim.api.nvim_create_autocmd("CursorHold", {
  group = diagnostic_hover_augroup,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})

-- Optional: Customize diagnostic highlight colors
-- Uncomment to use custom colors
-- vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = '#db4b4b', italic = true })
-- vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { fg = '#e0af68', italic = true })
-- vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = '#0db9d7', italic = true })
-- vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { fg = '#1abc9c', italic = true })

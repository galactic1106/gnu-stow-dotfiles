vim.g.mapleader = ' '
vim.g.localleader = ' '
vim.g.have_nerd_font = true

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true
vim.opt.cursorline = true

-- Disable swap files
vim.o.swapfile = false

-- Always show sign column to prevent text shifting
vim.opt.signcolumn = 'yes'

-- Enable mouse support in all modes
vim.opt.mouse = 'a'

-- Display settings
vim.o.wrap = false
vim.opt.linebreak = true  -- Wrap on word boundaries if wrap is enabled
vim.opt.scrolloff = 8     -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor

-- Show whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Tabstops
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true -- Smart auto-indenting

-- Window splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Save undo history
vim.opt.undofile = true

-- Set the default border for all floating windows
vim.opt.winborder = 'rounded'

-- Better completion experience
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Faster update time (default is 4000ms)
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Better search highlighting
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Enable break indent
vim.opt.breakindent = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live
vim.opt.inccommand = 'split'

-- Enable termguicolors for better colors
vim.opt.termguicolors = true

-- Clipboard integration with system clipboard
vim.opt.clipboard = 'unnamedplus'

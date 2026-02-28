vim.pack.add({ { src = "https://github.com/folke/which-key.nvim", name = "which-key" } })

require("which-key").setup({
    preset = "modern",
    delay = 300,
    plugins = {
        marks = true,
        registers = true,
        spelling = {
            enabled = true,
            suggestions = 20,
        },
        presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
        },
    },
    win = {
        border = "rounded",
        padding = { 1, 2 },
    },
    layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "left",
    },
    show_help = true,
    show_keys = true,
})

-- Register key groups and descriptions
require("which-key").add({
    -- Leader key groups
    { "<leader>f",  group = "Find (Telescope)" },
    { "<leader>l",  group = "LSP / Laravel" },
    { "<leader>t",  group = "Tree (NeoTree)" },
    { "<leader>c",  group = "Code" },
    { "<leader>b",  group = "Buffer" },
    { "<leader>u",  group = "UI/Toggle" },
    { "<leader>x",  group = "Lists" },
    { "<leader>w",  group = "Window/Save" },

    -- Find/Telescope mappings
    { "<leader>ff", desc = "Find Files" },
    { "<leader>fg", desc = "Live Grep" },
    { "<leader>fb", desc = "Find Buffers" },
    { "<leader>fh", desc = "Help Tags" },
    { "<leader>fc", desc = "Commands" },
    { "<leader>fk", desc = "Keymaps" },
    { "<leader>fo", desc = "Recent Files" },
    { "<leader>fw", desc = "Find Word Under Cursor" },
    { "<leader>fr", desc = "Resume Last Search" },
    { "<leader>fs", desc = "Document Symbols" },
    { "<leader>fH", desc = "Find Files (Hidden+Ignored)" },
    { "<leader>fG", desc = "Live Grep (Hidden+Ignored)" },

    -- LSP mappings
    { "<leader>lf", desc = "Format Buffer" },
    { "<leader>D",  desc = "Show Line Diagnostics" },

    -- Laravel mappings
    { "<leader>la", desc = "Laravel Artisan" },
    { "<leader>lc", desc = "Composer" },
    { "<leader>lr", desc = "Laravel Routes" },
    { "<leader>lm", desc = "Laravel Make" },

    -- NeoTree mappings
    { "<leader>tf", desc = "Toggle Filesystem" },
    { "<leader>tg", desc = "Toggle Git Status" },
    { "<leader>tb", desc = "Toggle Buffers" },
    { "<leader>tt", desc = "Toggle NeoTree" },

    -- Code actions
    { "<leader>ca", desc = "Code Actions" },

    -- File explorer
    { "<leader>e",  desc = "File Explorer (Yazi)" },

    -- LSP 'g' prefix mappings
    { "gd",         desc = "Go to Definition" },
    { "gD",         desc = "Go to Declaration" },
    { "gr",         desc = "Find References" },
    { "gi",         desc = "Go to Implementation" },
    { "gt",         desc = "Go to Type Definition" },
    { "grn",        desc = "Rename Symbol" },
    { "gra",        desc = "Code Actions (default)" },
    { "grr",        desc = "Find References (default)" },
    { "gri",        desc = "Go to Implementation (default)" },
    { "gO",         desc = "Document Symbols (default)" },

    -- Comment mappings
    { "gc",         group = "Comment" },
    { "gb",         group = "Block Comment" },
    { "gcc",        desc = "Toggle Line Comment" },
    { "gbc",        desc = "Toggle Block Comment" },
    { "gcO",        desc = "Comment Line Above" },
    { "gco",        desc = "Comment Line Below" },
    { "gcA",        desc = "Comment End of Line" },

    -- Diagnostics
    { "[d",         desc = "Previous Diagnostic" },
    { "]d",         desc = "Next Diagnostic" },

    -- Other mappings
    { "K",          desc = "Hover Documentation" },
    { "<C-k>",      desc = "Signature Help",                mode = { "n", "i" } },

    -- Escape
    { "jj",         desc = "Escape to Normal Mode",         mode = "i" },

    -- Window splits
    { "<C-w>v",     desc = "Split Right" },
    { "<C-w>h",     desc = "Split Below" },

    -- TMUX Navigation
    { "<C-h>",      desc = "Navigate Left" },
    { "<C-j>",      desc = "Navigate Down" },
    { "<C-l>",      desc = "Navigate Right" },
    { "<C-\\>",     desc = "Last Active Pane" },

    -- Buffer mappings
    { "[b",         desc = "Previous Buffer" },
    { "]b",         desc = "Next Buffer" },
    { "<leader>bd", desc = "Delete Buffer" },
    { "<leader>bD", desc = "Force Delete Buffer" },

    -- Quickfix/Location list navigation
    { "[q",         desc = "Previous Quickfix" },
    { "]q",         desc = "Next Quickfix" },
    { "[l",         desc = "Previous Location" },
    { "]l",         desc = "Next Location" },
    { "<leader>xl", desc = "Location List" },
    { "<leader>xq", desc = "Quickfix List" },

    -- UI/Toggle mappings
    { "<leader>uw", desc = "Toggle Word Wrap" },
    { "<leader>us", desc = "Toggle Spell Check" },
    { "<leader>un", desc = "Toggle Line Numbers" },

    -- Window/File operations
    { "<leader>w",  desc = "Save File" },
    { "<leader>q",  desc = "Quit" },
    { "<leader>Q",  desc = "Quit All" },

    -- Visual mode mappings
    { "<",          desc = "Indent Left",                   mode = "v" },
    { ">",          desc = "Indent Right",                  mode = "v" },
    { "<A-j>",      desc = "Move Selection Down",           mode = "v" },
    { "<A-k>",      desc = "Move Selection Up",             mode = "v" },
    { "<leader>p",  desc = "Paste Without Yanking",         mode = "x" },

    -- Move lines
    { "<A-j>",      desc = "Move Line Down",                mode = "n" },
    { "<A-k>",      desc = "Move Line Up",                  mode = "n" },

    -- Clear search
    { "<Esc>",      desc = "Clear Search Highlight",        mode = "n" },

    -- Window resize
    { "<C-Up>",     desc = "Increase Window Height" },
    { "<C-Down>",   desc = "Decrease Window Height" },
    { "<C-Left>",   desc = "Decrease Window Width" },
    { "<C-Right>",  desc = "Increase Window Width" },

    -- Terminal mode
    { "<Esc><Esc>", desc = "Exit Terminal Mode",            mode = "t" },
    { "<C-h>",      desc = "Terminal Navigate Left",        mode = "t" },
    { "<C-j>",      desc = "Terminal Navigate Down",        mode = "t" },
    { "<C-k>",      desc = "Terminal Navigate Up",          mode = "t" },
    { "<C-l>",      desc = "Terminal Navigate Right",       mode = "t" },
})

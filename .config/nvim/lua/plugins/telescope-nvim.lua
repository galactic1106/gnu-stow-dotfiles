vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim",                    name = "plenary" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons",              name = "nvim-web-devicons" },
    { src = "https://github.com/nvim-telescope/telescope.nvim",            name = "telescope" },
    { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", name = "telescope-fzf-native" }
})

local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        -- Use fd for file finding
        file_ignore_patterns = {
            "node_modules",
            ".git/",
            "%.lock",
            "__pycache__",
            "%.sqlite3",
            "%.ipynb",
            "vendor/*",
            "%.jpg",
            "%.jpeg",
            "%.png",
            "%.svg",
            "%.otf",
            "%.ttf",
            "%.webp",
            "dist/*",
            "build/*",
            "%.min.js",
        },
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            '--glob=!.git/',
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "bottom",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ['COLORTERM'] = 'truecolor' },
        mappings = {
            i = {
                ["<C-j>"] = actions.cycle_history_next,
                ["<C-k>"] = actions.cycle_history_prev,
                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,
                ["<C-c>"] = actions.close,
                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,
                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-l>"] = actions.complete_tag,
                ["<C-h>"] = actions.which_key,
            },
            n = {
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,
                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,
                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,
                ["?"] = actions.which_key,
            },
        },
    },
    pickers = {
        find_files = {
            find_command = { 'fd', '--type', 'f', '--hidden', '--strip-cwd-prefix', '--exclude', '.git' },
            prompt_title = "Find Files",
        },
        live_grep = {
            additional_args = function()
                return { "--hidden", "--glob", "!.git/" }
            end,
            prompt_title = "Live Grep",
        },
        grep_string = {
            additional_args = function()
                return { "--hidden", "--glob", "!.git/" }
            end,
        },
        help_tags = {
            prompt_title = "Help Tags",
        },
        commands = {
            prompt_title = "Commands",
        },
        keymaps = {
            prompt_title = "Keymaps",
        },
        buffers = {
            prompt_title = "Buffers",
            sort_lastused = true,
            sort_mru = true,
            mappings = {
                i = {
                    ["<c-d>"] = actions.delete_buffer,
                },
                n = {
                    ["dd"] = actions.delete_buffer,
                }
            }
        },
        oldfiles = {
            prompt_title = "Recent Files",
        },
        colorscheme = {
            enable_preview = true,
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        }
    }
}

-- Load fzf extension
pcall(require('telescope').load_extension, 'fzf')

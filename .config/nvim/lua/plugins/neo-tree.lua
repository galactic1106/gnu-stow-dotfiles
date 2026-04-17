vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim",       name = "plenary" },
    { src = "https://github.com/MunifTanjim/nui.nvim",        name = "nui" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons", name = "nvim-web-devicons" },
    {
        src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
        version = vim.version.range('3'),
        name = "neo-tree"
    },
})

require("neo-tree").setup({
    sources = {
        "filesystem",
        "buffers",
        "git_status",
        "document_symbols",
    },
    window = {
        mappings = {
            ["<cr>"] = "open_with_window_picker",
            ["s"] = "split_with_window_picker",
            ["v"] = "vsplit_with_window_picker",
        },
    },
    filesystem = {
        hijack_netrw_behavior = "disabled",
        -- "open_default",
        -- "open_current",
        window = {
            mappings = {
                ["tf"] = "telescope_find",
                ["tg"] = "telescope_grep",
                ["d"] = "trash",
            }
        },
        commands = {
            telescope_find = function(state)
                local node = state.tree:get_node()
                local path = node.type == "file" and node:get_parent_id() or node:get_id()
                require('telescope.builtin').find_files({ cwd = path })
            end,
            telescope_grep = function(state)
                local node = state.tree:get_node()
                local path = node.type == "file" and node:get_parent_id() or node:get_id()
                require('telescope.builtin').live_grep({ cwd = path })
            end,
        },
    }
})

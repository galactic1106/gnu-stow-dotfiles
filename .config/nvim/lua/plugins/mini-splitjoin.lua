vim.pack.add({ { src = "https://github.com/echasnovski/mini.splitjoin", name = "mini.splitjoin" } })

local status_ok, mini_splitjoin = pcall(require, "mini.splitjoin")
if not status_ok then
    return
end

mini_splitjoin.setup({
    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
        toggle = 'gS',
        split = '',
        join = '',
    },

    -- Custom options can be added here
    detect = {
        -- Brackets to be used for searching arguments
        brackets = { '%[', '%]', '{', '}', '%(', '%)', '<', '>' },
    },
})

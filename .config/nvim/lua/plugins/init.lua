-- Find all .lua files in the plugins directory
local files = vim.api.nvim_get_runtime_file("lua/plugins/*.lua", true)

for _, file in ipairs(files) do
    -- Extract the filename
    local name = vim.fn.fnamemodify(file, ":t")

    if name ~= "init.lua" and string.sub(name, 1, 1) ~= "_" then
        local mod_name = name:gsub("%.lua$", "")
        pcall(require, "plugins." .. mod_name)
    end
end

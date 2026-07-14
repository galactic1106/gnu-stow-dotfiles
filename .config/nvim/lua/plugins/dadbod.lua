vim.pack.add({
    { src = "https://github.com/tpope/vim-dadbod",                     name = "vim-dadbod" },
    { src = "https://github.com/kristijanhusak/vim-dadbod-ui",         name = "vim-dadbod-ui" },
    { src = "https://github.com/kristijanhusak/vim-dadbod-completion", name = "vim-dadbod-completion" },
})

local dbs = {}

if vim.env.MYSQL_URL and vim.env.MYSQL_URL ~= "" then
    table.insert(dbs, { name = "mysql", url = vim.env.MYSQL_URL })
end

if vim.env.MARIADB_URL and vim.env.MARIADB_URL ~= "" then
    table.insert(dbs, { name = "mariadb", url = vim.env.MARIADB_URL })
end

if vim.env.SQLITE_URL and vim.env.SQLITE_URL ~= "" then
    table.insert(dbs, { name = "sqlite", url = vim.env.SQLITE_URL })
end

if vim.env.POSTGRES_URL and vim.env.POSTGRES_URL ~= "" then
    table.insert(dbs, { name = "postgres", url = vim.env.POSTGRES_URL })
end

vim.g.dbs = dbs

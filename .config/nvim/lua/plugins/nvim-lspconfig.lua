vim.pack.add({ { src = "https://github.com/neovim/nvim-lspconfig", name = "nvim-lspconfig" } })

-- Get Neovim's default LSP capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Define server configurations in a table
local servers = {
    rust_analyzer = {
        settings = {
            ["rust-analyzer"] = {
                cargo = { allFeatures = false },
                checkOnSave = {
                    command = "clippy",
                    extraArgs = { "--no-deps" },
                },
            }
        }
    },
    laravel_ls = {},
    vue_ls = {},
    tailwindcss = {},
    ts_ls = { filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "vue" }, },
    eslint = { filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "vue" }, settings = { workingDirectories = { mode = "auto" }, }, },
    lua_ls = { settings = { Lua = { diagnostics = { globals = { 'vim' }, }, }, }, },
    jsonls = {},
    yamlls = {},
    taplo = {},
    nushell = {},
    svelte = {},
    clangd = {
        cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
        },
        init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
        },
    },
    gopls = {},
    hyprls = {},
    gdscript = {},
    -- jdtls={}
}

-- Loop through the servers and set them up
for server_name, config in pairs(servers) do
    -- Merge capabilities into each server's config
    config.capabilities = capabilities

    -- Configure and enable the server
    vim.lsp.config(server_name, config)
    vim.lsp.enable(server_name)
end

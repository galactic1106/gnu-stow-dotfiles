vim.pack.add({ { src = "https://github.com/mfussenegger/nvim-jdtls", name = "nvim-jdtls" } })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = function()
        local has_jdtls, jdtls = pcall(require, 'jdtls')
        if not has_jdtls then return end

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local has_blink, blink = pcall(require, "blink.cmp")
        if has_blink then
            capabilities = blink.get_lsp_capabilities(capabilities)
        end

        local config = {
            cmd = { "jdtls" },
            root_dir = vim.fs.dirname(vim.fs.find({ '.gradlew', '.git', 'mvnw' }, { upward = true })[1]) or
            vim.fn.getcwd(),
            capabilities = capabilities,
        }
        jdtls.start_or_attach(config)

        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = true, desc = "Java Code Actions" })
    end,
})

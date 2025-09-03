local util = require("lspconfig.util")

return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				volar = {
					filetypes = {
						"typescript",
						"vue",
					},
					root_dir = util.root_pattern("src/App.vue"),
				},
				phpactor = {},
				intelephense = {},
				eslint = {},
			},

			setup = {
				eslint = function()
					require("lazyvim.util").lsp.on_attach(function(client)
						if client.name == "eslint" then
							client.server_capabilities.documentFormattingProvider = true
						elseif client.name == "tsserver" then
							client.server_capabilities.documentFormattingProvider = false
						end
					end)
				end,
			},
		},
	},
}

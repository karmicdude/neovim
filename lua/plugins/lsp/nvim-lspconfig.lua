local config = function()
	local lspconfig = require("lspconfig")
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	-- local root_pattern = require("lspconfig.util").root_pattern

	local signs = { Error = "", Warn = "", Hint = "", Info = "" }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local caps = cmp_nvim_lsp.default_capabilities()

	vim.lsp.handlers["textDocument/publishDiagnostics"] =
		vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })

	local on_attach = function(client, bufnr)
		if client.server_capabilities.documentSymbolProvider then
			require("nvim-navic").attach(client, bufnr)
		end
		-- -- For disable treesitter highlighting
		-- if client.name == "lua_ls" then
		--   client.server_capabilities.semanticTokensProvider = nil
		-- end
	end

	-- Lua
	lspconfig.lua_ls.setup({
		capabilities = caps,
		on_attach = on_attach,
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
				diagnostics = { globals = { "vim" } },
			},
		},
	})

	-- TypeScript
	lspconfig.ts_ls.setup({
		capabilities = caps,
		on_attach = on_attach,
	})

	-- Ansilbe
	lspconfig.ansiblels.setup({
		capabilities = caps,
		on_attach = on_attach,
		filetypes = {
			"yaml.ansible",
			"ansible",
		},
		root_dir = function(fname)
			return lspconfig.util.root_pattern({
				".ansible-lint",
				".ansible-lint.yaml",
				".ansible-lint.yml",
				".yamllint.yaml",
				".yamllint.yml",
				"requirements.yaml",
				"inventory.ini",
			})(fname)
		end,
		single_file_support = true,
		settings = {
			ansible = {
				ansible = {
					useFullyQualifiedCollectionNames = true,
				},
				python = {
					interpreterPath = "~/.pyenv/shims/ansible",
				},
				validation = {
					enabled = true,
					lint = {
						enabled = true,
						path = "~/.pyenv/shims/ansible-lint",
					},
				},
			},
		},
	})

	-- Docker
	lspconfig.dockerls.setup({ on_attach = on_attach })
	lspconfig.docker_compose_language_service.setup({ on_attach = on_attach })

	-- Markdown
	lspconfig.marksman.setup({ on_attach = on_attach })
end

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	version = false,
	dependencies = {
		"SmiteshP/nvim-navic",
		"folke/neodev.nvim",
		"hrsh7th/nvim-cmp",
		"lukas-reineke/lsp-format.nvim",
		"williamboman/mason.nvim",
		"windwp/nvim-autopairs",
	},
	init = config,
}

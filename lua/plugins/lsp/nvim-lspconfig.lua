local config = function()
	local lspconfig = require("lspconfig")
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	-- local root_pattern = require("lspconfig.util").root_pattern

	local signs = { Error = "", Warn = "", Hint = "", Info = "󰙎" }
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
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
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

	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	local hadolint = require("efmls-configs.linters.hadolint")
	local prettier = require("efmls-configs.formatters.prettier")
	local actionlint = require("efmls-configs.linters.actionlint")
	local yamllint = require("efmls-configs.linters.yamllint")
	local markdownlint = require("plugins.lsp.efmls-configs.markdownlint")

	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"markdown",
			"docker",
			"yaml.actions",
			"yaml",
			-- "json",
			-- "jsonc",
			-- "sh",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				yaml = { yamllint },
				["yaml.actions"] = { actionlint },
				markdown = { markdownlint },
				docker = { prettier, hadolint },
			},
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	init = config,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"SmiteshP/nvim-navic",
		"creativenull/efmls-configs-nvim",
		"folke/neodev.nvim",
		"hrsh7th/nvim-cmp",
		"williamboman/mason.nvim",
		"windwp/nvim-autopairs",
	},
}

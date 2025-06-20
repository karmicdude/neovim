local config = function()
	local lspconfig = require("lspconfig")
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	-- local root_pattern = require("lspconfig.util").root_pattern

	vim.diagnostic.config({
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "󱈸",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.INFO] = "",
				[vim.diagnostic.severity.HINT] = "",
			},
			texthl = {
				[vim.diagnostic.severity.ERROR] = "Error",
				[vim.diagnostic.severity.WARN] = "Error",
				[vim.diagnostic.severity.HINT] = "Hint",
				[vim.diagnostic.severity.INFO] = "Info",
			},
			numhl = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.HINT] = "",
				[vim.diagnostic.severity.INFO] = "",
			},
		},
	})

	local caps = cmp_nvim_lsp.default_capabilities()

	local on_attach = function(client, bufnr)
		if client.server_capabilities.documentSymbolProvider then
			require("nvim-navic").attach(client, bufnr)
		end

		if client:supports_method("textDocument/publishDiagnostic") then
			local is_pull = false
			local ns = vim.lsp.diagnostic.get_namespace(client.id, is_pull)

			vim.diagnostic.config({
				virtual_text = false,
			}, ns)
		end
		-- -- For disable treesitter highlighting
		-- if client.name == "lua_ls" then
		--   client.server_capabilities.semanticTokensProvider = nil
		-- end
	end

	-- Terraform
	lspconfig.terraformls.setup({
		capabilities = caps,
		on_attach = on_attach,
		filetypes = {
			"tf",
			"terraform",
		},
	})

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

	-- Python
	require("lspconfig").pylsp.setup({
		capabilities = caps,
		on_attach = on_attach,
		settings = {
			pylsp = {
				plugins = {
					pycodestyle = {
						ignore = { "W391" },
						maxLineLength = 100,
					},
					jedi_completion = {
						fuzzy = true,
						eager = true,
					},
					pydocstyle = {
						enabled = true,
						convention = "pep257",
					},
					pyflakes = {
						enabled = true,
					},
					rope_autoimport = {
						enabled = true,
					},
					rope_completion = {
						enabled = true,
					},
				},
			},
		},
	})

	-- TypeScript / JavaScript
	lspconfig.ts_ls.setup({
		capabilities = caps,
		on_attach = on_attach,
		init_options = {
			preferences = {
				disableSuggestions = true,
			},
		},
	})

	lspconfig.eslint.setup({
		capabilities = caps,
		on_attach = on_attach,
		root_dir = function(fname)
			return lspconfig.util.root_pattern({
				".vimroot",
			})(fname)
		end,
		settings = {
			codeAction = {
				disableRuleComment = {
					enable = true,
					location = "separateLine",
				},
				showDocumentation = {
					enable = true,
				},
			},
			codeActionOnSave = {
				enable = false,
				mode = "all",
			},
			experimental = {
				useFlatConfig = false,
			},
			format = true,
			nodePath = "",
			onIgnoredFiles = "off",
			problems = {
				shortenToSingleLine = false,
			},
			quiet = false,
			rulesCustomizations = {},
			run = "onType",
			useESLintClass = false,
			validate = "on",
			workingDirectory = {
				mode = "location",
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
				".ansible-lint.yaml",
				".ansible-lint",
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
				-- ansibleLint = {
				-- 	enabled = true,
				-- 	path = "~/.pyenv/shims/ansible-lint",
				-- },
				ansible = {
					useFullyQualifiedCollectionNames = true,
				},
				-- python = {
				-- 	interpreterPath = "~/.pyenv/shims/ansible",
				-- },
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

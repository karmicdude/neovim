local config = function()
	local cmp_nvim_lsp = require("cmp_nvim_lsp")

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

	vim.lsp.config("*", {
		capabilities = cmp_nvim_lsp.default_capabilities(),
	})

	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			local bufnr = args.buf

			if client.server_capabilities.documentSymbolProvider then
				require("nvim-navic").attach(client, bufnr)
			end

			if client:supports_method("textDocument/publishDiagnostic") then
				local is_pull = false
				local ns = vim.lsp.diagnostic.get_namespace(client.id, is_pull)
				vim.diagnostic.config({ virtual_text = false }, ns)
			end
		end,
	})

	-- Terraform
	vim.lsp.config("terraformls", {
		filetypes = { "terraform", "tf" },
	})
	vim.lsp.enable("terraformls")

	-- Lua
	vim.lsp.config("lua_ls", {
		settings = {
			Lua = {
				completion = { callSnippet = "Replace" },
				diagnostics = { globals = { "vim" } },
			},
		},
	})
	vim.lsp.enable("lua_ls")

	-- Python
	vim.lsp.config("pylsp", {
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
					pyflakes = { enabled = true },
					rope_autoimport = { enabled = true },
					rope_completion = { enabled = true },
				},
			},
		},
	})
	vim.lsp.enable("pylsp")

	-- TypeScript / JavaScript
	vim.lsp.config("ts_ls", {
		init_options = {
			preferences = { disableSuggestions = true },
		},
	})
	vim.lsp.enable("ts_ls")

	-- ESLint
	vim.lsp.config("eslint", {
		root_dir = function(bufnr)
			return vim.fs.root(bufnr, { ".vimroot" })
		end,
		settings = {
			codeAction = {
				disableRuleComment = {
					enable = true,
					location = "separateLine",
				},
				showDocumentation = { enable = true },
			},
			codeActionOnSave = {
				enable = false,
				mode = "all",
			},
			experimental = { useFlatConfig = false },
			format = true,
			nodePath = "",
			onIgnoredFiles = "off",
			problems = { shortenToSingleLine = false },
			quiet = false,
			rulesCustomizations = {},
			run = "onType",
			useESLintClass = false,
			validate = "on",
			workingDirectory = { mode = "location" },
		},
	})
	vim.lsp.enable("eslint")

	-- Ansible
	vim.lsp.config("ansiblels", {
		filetypes = { "yaml.ansible", "ansible" },
		root_dir = function(bufnr)
			return vim.fs.root(bufnr, {
				"ansible.cfg",
				".ansible-lint.yaml",
				".ansible-lint",
				".ansible-lint.yml",
				".yamllint.yaml",
				".yamllint.yml",
				"requirements.yaml",
				"inventory.ini",
			})
		end,
		single_file_support = true,
		settings = {
			ansible = {
				ansible = { useFullyQualifiedCollectionNames = true },
				python = { interpreterPath = "~/.pyenv/shims/ansible" },
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
	vim.lsp.enable("ansiblels")

	-- Docker
	vim.lsp.config("dockerls", {})
	vim.lsp.enable("dockerls")
	vim.lsp.config("docker_compose_language_service", {})
	vim.lsp.enable("docker_compose_language_service")

	-- Markdown
	vim.lsp.config("marksman", {})
	vim.lsp.enable("marksman")
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
	config = config,
}

local mason_config = {
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
}

local lsp_config = {
	automatic_installation = true,
	ensure_installed = {
		"ansiblels",
		"bashls",
		"docker_compose_language_service",
		"dockerls",
		"gopls",
		"helm_ls",
		"jqls",
		"jsonls",
		"jsonnet_ls",
		"lua_ls",
		"pyright",
		"sqlls",
		"taplo",
		"terraformls",
		"tflint",
		"ts_ls",
		"vimls",
		"yamlls",
	},
}

return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	event = "BufReadPre",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	init = function()
		local mason = require("mason")
		mason.setup(mason_config)

		local mason_lspconfig = require("mason-lspconfig")
		mason_lspconfig.setup(lsp_config)
	end,
}

local tools = {}

local formatters = {
	"goimports",
	"jsonnetfmt",
	"prettier",
	"shfmt",
	"stylua",
}

local linters = {
	"actionlint",
	"black",
	"codespell",
	"commitlint",
	"editorconfig-checker",
	"gitlint",
	"isort",
	"jsonlint",
	"luacheck",
	"markdownlint",
	"rstcheck",
	"shellcheck",
	"tflint",
	"yamllint",
}

vim.list_extend(tools, formatters)
vim.list_extend(tools, linters)

return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	event = "VeryLazy",
	opts = {
		ensure_installed = tools,
		auto_update = true,
		run_on_start = true,
		start_delay = 3000,
		debounce_hours = 3,
	},
}

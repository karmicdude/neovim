local tools = {}

local formatters = {
	"jsonnetfmt",
	"prettier",
	"shfmt",
	"stylua",
	"goimports",
}

local linters = {
	"actionlint",
	"ansible-lint",
	"black",
	"codespell",
	"editorconfig-checker",
	"gitlint",
	"isort",
	"jsonlint",
	"luacheck",
	"markdownlint",
	"rstcheck",
	"shellcheck",
	"shellharden",
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

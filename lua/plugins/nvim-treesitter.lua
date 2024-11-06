local opts = {
	sync_install = true,
	ensure_installed = {
		"bash",
		"comment",
		"css",
		"diff",
		"dockerfile",
		"fish",
		"git_config",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"go",
		"godot_resource",
		"gomod",
		"gosum",
		"gowork",
		"hcl",
		"html",
		"ini",
		"javascript",
		"jq",
		"json",
		"jsonc",
		"jsonnet",
		"lua",
		"luadoc",
		"make",
		"markdown",
		"markdown_inline",
		"vrl",
		"mermaid",
		"passwd",
		"promql",
		"proto",
		"python",
		"regex",
		"requirements",
		"rst",
		"scheme",
		"sql",
		"ssh_config",
		"strace",
		"terraform",
		"toml",
		"tsv",
		"typescript",
		"udev",
		"yaml",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_decremental = "<BS>",
			node_incremental = "grn",
			scope_incremental = "grc",
		},
	},
	indent = {
		enable = true,
	},
}

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	init = function()
		require("nvim-treesitter.configs").setup(opts)
	end,
	dependencies = {
		{ "m-demare/hlargs.nvim", event = "BufReadPost", opts = { color = "#fcbe7b" } },
	},
}

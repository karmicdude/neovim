return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
	init = function()
		vim.cmd.colorscheme("catppuccin")
		vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#505173" })
		vim.api.nvim_set_hl(0, "VirtColumnColor", { fg = "#26253b" })
	end,
	opts = {
		flavour = "mocha",
		integrations = {
			cmp = true,
			treesitter = true,
			flash = true,
			gitsigns = true,
			indent_blankline = {
				enabled = true,
				scope_color = "text",
				colored_indent_levels = false,
				lightspeed = true,
				markdown = true,
				mason = true,
				mini = {
					enabled = false,
					indentscope_color = "lavender",
				},
				noice = true,
				neotree = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
				window_picker = true,
				telescope = {
					enabled = true,
					style = "nvchad",
				},
				vimwiki = true,
				which_key = true,
			},
		},
	},
}


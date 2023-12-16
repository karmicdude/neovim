return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
	init = function()
		vim.cmd.colorscheme("catppuccin")
		vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#505173" })
		vim.api.nvim_set_hl(0, "VirtColumnColor", { fg = "#26253b" })
		vim.api.nvim_set_hl(0, "UserOnYankHighlight", { fg = "#f9e2af", })
    vim.api.nvim_set_hl(0, "ModesCopy", { bg = "#f9e2af" })
    vim.api.nvim_set_hl(0, "ModesDelete", { bg = "#f38ba8" })
    vim.api.nvim_set_hl(0, "ModesInsert", { bg = "#334d54" })
    vim.api.nvim_set_hl(0, "ModesVisual", { bg = "#b4befe" })
	end,
	opts = {
		flavour = "mocha",
		show_end_of_buffer = true,
		integrations = {
			cmp = true,
			treesitter = true,
			treesitter_context = true,
			gitsigns = true,
			alpha = true,
			barbecue = {
			    dim_dirname = true,
			    bold_basename = true,
			    dim_context = false,
			    alt_background = false,
			},
			indent_blankline = {
				enabled = true,
				scope_color = "text",
				colored_indent_levels = false,
			},
			lightspeed = true,
			markdown = true,
			mason = true,
			neogit = true,
			noice = true,
			neotree = true,
			navic = {
			    enabled = true,
			    custom_bg = "NONE",
			},
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
				-- style = "nvchad",
			},
			which_key = true,
		},
	},
}

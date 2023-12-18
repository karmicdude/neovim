return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	lazy = false,
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.api.nvim_create_autocmd({
			"WinResized",
			"BufWinEnter",
			"CursorHold",
			"InsertLeave",
			"BufModifiedSet",
		}, {
			group = vim.api.nvim_create_augroup("barbecue.updater", {}),
			callback = function()
				require("barbecue.ui").update()
			end,
		})
	end,
	opts = {
		theme = "catppuccin-macchiato",
		create_autocmd = false,
		attach_navic = false,
		exclude_filetypes = {
			"neo-tree",
			"neo-tree-popup",
			"notify",
		},
	},
}

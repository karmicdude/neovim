return {
	"kylechui/nvim-surround",
	version = false,
	event = "VeryLazy",
	config = function()
		vim.g.nvim_surround_no_visual_mappings = true
		require("nvim-surround").setup()
		vim.keymap.set("x", ",s", "<Plug>(nvim-surround-visual)", {
			desc = "Add a surrounding pair around a visual selection",
		})
		vim.keymap.set("x", ",S", "<Plug>(nvim-surround-visual-line)", {
			desc = "Add a surrounding pair around a visual selection, on new lines",
		})
	end,
}

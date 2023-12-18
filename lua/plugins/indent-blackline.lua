return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = "BufReadPost",
	opts = {
		debounce = 200,
		indent = {
			char = "┇",
			tab_char = "╏",
		},
		scope = {
			enabled = false,
		},
	},
}

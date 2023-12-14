return {
	"echasnovski/mini.indentscope",
	event = "VeryLazy",
	version = false,
	init = function()
		require("mini.indentscope").setup({
			symbol = "╏",
			draw = {
				delay = 200,
				animation = require("mini.indentscope").gen_animation.none(),
			},
		})
	end,
}

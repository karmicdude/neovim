return {
	"L3MON4D3/LuaSnip",
	event = "BufReadPre",
	dependencies = {
		"saadparwaiz1/cmp_luasnip",
	},
	init = function()
		require("plugins.cmp.snippets.common")
	end,
}

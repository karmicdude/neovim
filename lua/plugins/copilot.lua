return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "VeryLazy",
	build = ":Copilot auth",
	init = function()
		vim.g.copilot_proxy = "http://127.0.0.1:12334"
	end,
	opts = {
		suggestion = { enabled = false },
		panel = { enabled = false },
	},
}

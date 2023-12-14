return {
	"ahmedkhalf/project.nvim",
	event = "VeryLazy",
	config = function()
		require("project_nvim").setup({
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
			patterns = {
				".vimroot",
				".git",
				".neoconf.json",
			},
			open_file_finder = false,
			detection_methods = { "pattern" },
		})
	end,
}

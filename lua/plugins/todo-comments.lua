return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "BufReadPost",
	opts = {
		keywords = {
			NOTE = { icon = " ", color = "note", alt = { "INFO" } },
			TODO = { icon = " ", color = "todo" },
			WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
			FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
		},
		gui_style = {
			fg = "italic",
			bg = "italic",
		},
		merge_keywords = false,
		highlight = {
			multiline_context = 15,
			before = "fg",
			keyword = "wide_bg",
			after = "fg",
			exclude = {},
		},
		colors = {
			note = { "#8783F1" },
			error = { "#DC2626" },
			todo = { "#A7E64C" },
			warning = { "#FF7800" },
		},
	},
}

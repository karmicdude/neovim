local utils = require("core.utils")

-- Highlight Yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Hightlight selection on yank",
  group = utils.autocmd_group("highlight_yank"),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "UserOnYankHighlight", timeout = 230 })
	end,
})

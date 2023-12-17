local utils = require("core.utils")

-- Trim trailing spaces and empty lines
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	desc = "Trims trailing spaces and empty lines on buffer save",
	group = utils.autocmd_group("buf_on_save"),
	callback = function()
		local minitrail = require("mini.trailspace")
		minitrail.trim()
		minitrail.trim_last_lines()
	end,
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Format buffer on save",
	group = utils.autocmd_group("lsp_formatting"),
	callback = function()
		local efm = vim.lsp.get_active_clients({ name = "efm" })
		if vim.tbl_isempty(efm) then
			return
		end
		vim.lsp.buf.format({ name = "efm", async = true })
	end,
})

-- Highlight Yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Hightlight selection on yank",
	group = utils.autocmd_group("highlight_yank"),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "UserOnYankHighlight", timeout = 230 })
	end,
})

-- Open help in right side
vim.api.nvim_create_autocmd({ "FileType" }, {
	desc = "Open 'help' in right vertical split",
	pattern = { "help" },
	callback = function()
		vim.api.nvim_command("wincmd L")
	end,
})

-- Save and restore view state
vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, {
	desc = "Save current buffer view",
	pattern = "?*",
	callback = function()
		vim.api.nvim_command("silent! mkview 1")
	end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	desc = "Load saved buffer view",
	pattern = "?*",
	callback = function()
		vim.api.nvim_command("silent! loadview 1")
	end,
})

-- Fix comments
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	desc = "Disable adding comment after current comment line",
	group = utils.autocmd_group("comment_newline"),
	pattern = { "*" },
	callback = function()
		vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
	end,
})

-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	desc = "Close special buffers with <q>",
	group = utils.autocmd_group("close_with_q"),
	pattern = {
		"help",
		"lspinfo",
		"man",
		"notify",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

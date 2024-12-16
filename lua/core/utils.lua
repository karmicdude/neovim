local M = {}

---@param name string Autocmd group name
---@param clear boolean | nil
M.autocmd_group = function(name, clear)
	clear = clear or true
	return vim.api.nvim_create_augroup("user_" .. name, { clear = clear })
end

-- pick window for focus
M.pick_window = function()
	local window_picker = require("window-picker")
	local picked_window_id = window_picker.pick_window({
		include_current_win = true,
	}) or vim.api.nvim_get_current_win()
	vim.api.nvim_set_current_win(picked_window_id)
end

--@param cwd string CWD path to open
--@param win_type string Type of window
M.ext_terminal = function(cwd, win_type)
	local kitten = "/Applications/kitty.app/Contents/MacOS/kitten"
	local socket = "unix:/tmp/kitty"
	cwd = cwd or vim.fn.getcwd()
	if cwd == "buffer" then
		cwd = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":h")
	end
	win_type = win_type or "tab"
	local cmd = string.format(
		"%s @ --to %s launch --type=%s --cwd='%s' --tab-title='nvim-cmd' --title='nvim-cmd'",
		kitten,
		socket,
		win_type,
		cwd
	)
	vim.fn.jobstart(cmd)
end

-- rename tab
M.rename_tab = function()
	vim.ui.input({ prompt = "Enter a new tab name: " }, function(name)
		if name == "" then
			vim.notify("Tab name is required", vim.log.levels.ERROR)
			return
		end
		vim.cmd("TabRename " .. name)
	end)
end

-- get LSP project root
M.get_lsp_project_root = function()
	local lsp_util = require("lspconfig.util")
	local bufname = vim.api.nvim_buf_get_name(0)
	local root = lsp_util.root_pattern("ansible.cfg")(bufname)
	print(root)
	return root
end

-- Create new buffer with content in new tab
--@param name string Name for new buffer
--@param buftype string Buffer type. See :h buftype
--@param content string Text content for new buffer
--@param filetype string Filetype for syntax highlight and other stuff
M.create_buffer_in_new_tab = function(name, buftype, content, filetype)
	vim.cmd("tabnew")
	vim.cmd("enew")
	vim.cmd("noautocmd")
	local buf = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_set_name(buf, name)
	vim.api.nvim_buf_set_option(buf, "buftype", buftype)
	vim.api.nvim_buf_set_lines(buf, 0, 1, true, content)
	vim.api.nvim_buf_set_option(buf, "filetype", filetype)
end

return M

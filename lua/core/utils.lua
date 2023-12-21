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

return M

local global = {
	mapleader = " ",
	maplocalleader = " ",
	loaded_netrw = 1,
	loaded_netrwPlugin = 1,
	editorconfig = true,
	syntax = false,
}

local options = {
	-- Tab
	tabstop = 2,
	shiftwidth = 2,
	softtabstop = 2,
	expandtab = true,
	smartindent = true,
	wrap = false,
	-- Search
	incsearch = true,
	ignorecase = true,
	smartcase = true,
	hlsearch = false,
	-- Splits
	splitright = true,
	splitbelow = true,
	-- Appearance
	number = true,
	relativenumber = true,
	termguicolors = true,
	colorcolumn = "100",
	signcolumn = "yes",
	cmdheight = 1,
	scrolloff = 10,
	completeopt = "menuone,noinsert,noselect",
	cursorline = true,
	listchars = { eol = "↴", trail = "~", nbsp = "␣", precedes = "❮", extends = "❯", tab = "  " },
	list = true,
	showtabline = 2,
	hidden = true,
	errorbells = false,
	visualbell = false,
	swapfile = false,
	backup = false,
	undodir = vim.fn.expand("~/.cache/nvim/undodir"),
	undofile = true,
	backspace = "indent,eol,start",
	-- autochdir = false,
	modifiable = true,
	guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,"
		.. "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,"
		.. "sm:block-blinkwait175-blinkoff150-blinkon175",
	encoding = "UTF-8",
	showmode = false,
	history = 2000,
	autoread = true,
	gdefault = true,
	updatetime = 200,
	exrc = true,
	timeoutlen = 500,
}

for k, v in pairs(global) do
	vim.g[k] = v
end

for k, v in pairs(options) do
	vim.opt[k] = v
end

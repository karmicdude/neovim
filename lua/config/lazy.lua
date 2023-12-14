local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
	defaults = {
		lazy = true,
	},
	checker = { enable = true, },
	install = {
		colorscheme = { "habamax", },
		missing = true,
	},
	change_detection = {
	    enabled = true,
	    notify = true,
	},
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrw",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
}

local plugins = {
	{ import = "plugins.colorschemas", enabled = true },
}

require("lazy").setup(plugins, opts)

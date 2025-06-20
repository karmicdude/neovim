-- Markdown
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt.shiftwidth = 2
		vim.opt.tabstop = 2
		vim.opt.softtabstop = 2
		vim.opt.spell = true
		vim.opt.textwidth = 100
	end,
})

-- fish
vim.api.nvim_create_autocmd("FileType", {
	pattern = "fish",
	callback = function()
		vim.opt.shiftwidth = 4
		vim.opt.tabstop = 4
		vim.opt.softtabstop = 4
	end,
})

-- Packer
vim.api.nvim_create_autocmd("FileType", {
	pattern = "hcl",
	callback = function(event)
		vim.b[event.buf].format_timeout = 1200
	end,
})

-- Actions lint
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = {
		"*/.github/workflows/*.yaml",
		"*/.github/workflows/*.yml",
	},
	callback = function()
		vim.bo.filetype = "yaml.actions"
	end,
})

-- Ansible: yaml.jinja
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*/templates/*.j2" },
	callback = function()
		vim.bo.filetype = "yaml.jinja"
	end,
})

-- Ansible: yaml.ansible
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = {
		"*/tasks/*.yaml",
		"*/defaults/*.yaml",
		"*/handlers/*.yaml",
		"*/playbooks/*.yaml",
		"*/vars/*.yaml",
		"*/meta/*.yaml",
	},
	callback = function()
		vim.bo.filetype = "yaml.ansible"
	end,
})

-- VRL
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = {
		"*.vrl",
	},
	callback = function()
		vim.bo.filetype = "vrl"
	end,
})

-- Markdown
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt.shiftwidth = 2
		vim.opt.tabstop = 2
		vim.opt.softtabstop = 2
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
		vim.bo.filetype = "yaml-jinja"
	end,
})

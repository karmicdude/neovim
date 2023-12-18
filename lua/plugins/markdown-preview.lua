return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && yarn install",
	ft = { "markdown" },
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
		vim.g.mkdp_auto_close = 0
		vim.g.mkdp_theme = "dark"
		vim.g.mkdp_combine_preview = 1
		vim.g.mkdp_combine_preview_auto_refresh = 1
	end,
}

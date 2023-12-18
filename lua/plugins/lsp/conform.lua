return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			["css"] = { { "prettierd", "prettier" } },
			["graphql"] = { { "prettierd", "prettier" } },
			["handlebars"] = { { "prettierd", "prettier" } },
			["javascript"] = { { "prettierd", "prettier" } },
			["javascriptreact"] = { { "prettierd", "prettier" } },
			["json"] = { { "prettierd", "prettier" } },
			["jsonc"] = { { "prettierd", "prettier" } },
			["jsonnet"] = { "jsonnetfmt" },
			["less"] = { { "prettierd", "prettier" } },
			["lua"] = { "stylua", "codespell" },
			["markdown"] = { { "prettierd", "prettier" } },
			["scss"] = { { "prettierd", "prettier" } },
			["sh"] = { "shfmt", "codespell" },
			["bash"] = { "shfmt", "codespell" },
			["fish"] = { "fish_indent" },
			["toml"] = { "taplo" },
			["typescript"] = { { "prettierd", "prettier" } },
			["typescriptreact"] = { { "prettierd", "prettier" } },
			["vue"] = { { "prettierd", "prettier" } },
			["yaml"] = { { "prettierd", "prettier", "codespell" } },
			["yaml.actions"] = { { "prettierd", "prettier", "codespell" } },
			["terraform"] = { "terraform_fmt", "codespell" },
			["python"] = { "isort", "black", "codespell" },
			["go"] = { "goimports", "gofmt", "codespell" },
			["hcl"] = { "packer_fmt", "codespell" },
		},
		format_on_save = function(bufnr)
			local timeout = vim.b[bufnr].format_timeout or 400
			return {
				timeout_ms = timeout,
				lsp_fallback = true,
			}
		end,
	},
}

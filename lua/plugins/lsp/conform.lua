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
			["lua"] = { "stylua" },
			["markdown"] = { { "prettierd", "prettier" } },
			["scss"] = { { "prettierd", "prettier" } },
			["sh"] = { "shellcheck", "shfmt", "shellharden" },
			["bash"] = { "shellcheck", "shfmt", "shellharden" },
			["toml"] = { "taplo" },
			["typescript"] = { { "prettierd", "prettier" } },
			["typescriptreact"] = { { "prettierd", "prettier" } },
			["vue"] = { { "prettierd", "prettier" } },
			["yaml"] = { { "prettierd", "prettier" } },
			["yaml.actions"] = { { "prettierd", "prettier" } },
			["terraform"] = { "terraform_fmt" },
			["python"] = { "isort", "black" },
			["go"] = { "goimports", "gofmt" },
			["hcl"] = { "packer_fmt" },
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

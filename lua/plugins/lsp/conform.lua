return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			["html"] = { "prettierd", "prettier", stop_after_first = true },
			["css"] = { "prettierd", "prettier", stop_after_first = true },
			["graphql"] = { "prettierd", "prettier", stop_after_first = true },
			["handlebars"] = { "prettierd", "prettier", stop_after_first = true },
			["javascript"] = { "prettierd", "prettier", stop_after_first = true },
			["javascriptreact"] = { "prettierd", "prettier", stop_after_first = true },
			["json"] = { "prettierd", "prettier", stop_after_first = true },
			["jsonc"] = { "prettierd", "prettier", stop_after_first = true },
			["jsonnet"] = { "jsonnetfmt" },
			["less"] = { "prettierd", "prettier", stop_after_first = true },
			["lua"] = { "stylua" },
			["markdown"] = { "prettierd", stop_after_first = true },
			["scss"] = { "prettierd", "prettier", stop_after_first = true },
			["sh"] = { "shfmt" },
			["bash"] = { "shfmt" },
			["fish"] = { "fish_indent" },
			["toml"] = { "taplo" },
			["typescript"] = { "prettierd", "prettier", stop_after_first = true },
			["typescriptreact"] = { "prettierd", "prettier", stop_after_first = true },
			["vue"] = { "prettierd", "prettier", stop_after_first = true },
			["yaml"] = { "prettierd", "prettier", stop_after_first = true },
			["yaml.actions"] = { "prettierd", "prettier", stop_after_first = true },
			["terraform"] = { "terraform_fmt", stop_after_first = true },
			["python"] = { "isort", "black" },
			["go"] = { "goimports", "gofmt", stop_after_first = true },
			["hcl"] = { "packer_fmt" },
		},
		format_on_save = function(bufnr)
			-- Exclude ansible-vault encrypted files
			local ft = vim.bo[bufnr].filetype
			if ft == "yaml" then
				local first_line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ""
				if first_line:match("^%$ANSIBLE_VAULT") then
					return nil
				end
			end
			local timeout = vim.b[bufnr].format_timeout or 800
			return {
				timeout_ms = timeout,
				lsp_fallback = true,
			}
		end,
	},
}

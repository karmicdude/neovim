return {
	"mfussenegger/nvim-lint",
	event = { "BufWritePost", "BufEnter", "BufNewFile" },
	init = function()
		vim.diagnostic.config({ virtual_text = false })
		vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "TextChanged" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
	config = function()
		require("lint").linters_by_ft = {
			["lua"] = { "luacheck" },
			["yaml"] = { "yamllint" },
			["yaml.ansible"] = { "ansible_lint" },
			["yaml.actions"] = { "actionlint" },
			["gitcommit"] = { "commitlint" },
			["sh"] = { "shellcheck" },
			["bash"] = { "shellcheck" },
			["fish"] = { "fish" },
			["rst"] = { "rstcheck" },
			["markdown"] = { "markdownlint" },
			["json"] = { "jsonlint" },
			["jsonc"] = { "jsonlint" },
			["javascript"] = { "eslint" },
			["typescript"] = { "eslint" },
		}
		local actionlint_config = vim.fn.getcwd() .. "/.github/actionlint.yaml"
		local f = io.open(actionlint_config, "r")
		if f then
			f.close(f)
			local actionlint = require("lint").linters.actionlint
			actionlint.args = { "-config-file=" .. actionlint_config, vim.api.nvim_buf_get_name(0) }
			actionlint.stdin = true
		end
	end,
}

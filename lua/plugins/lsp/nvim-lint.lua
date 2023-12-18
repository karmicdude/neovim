return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	init = function()
		vim.api.nvim_create_autocmd({ "TextChanged" }, {
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
		}
	end,
}

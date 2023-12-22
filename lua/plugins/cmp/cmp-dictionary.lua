vim.opt_global.dictionary = {
	vim.fn.stdpath("config") .. "/spell/user.utf-8.add",
	vim.env.WORDLIST,
}

return {
	"uga-rosa/cmp-dictionary",
	event = "InsertEnter",
	init = function()
		require("cmp_dictionary").update()
	end,
	opts = {
		first_case_insensitive = true,
	},
}

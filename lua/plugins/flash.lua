return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		modes = {
			search = {
				enabled = false,
			},
			char = {
				enabled = true,
				multi_line = true,
				autohide = false,
				highlight = { backdrop = true },
				keys = { "t", "T", "f", "F", [";"] = "L", [","] = "H" },
				char_actions = function(motion)
					return {
						[motion:upper()] = "left",
						[motion:lower()] = "right",
						[","] = "left",
						[";"] = "right",
					}
				end,
			},
		},
		search = {
			mode = "fuzzy",
			exclude = {
				"notify",
				"cmp_menu",
				"noice",
				"flash_prompt",
				"NeogitStatus",
			},
		},
		label = {
			min_pattern_length = 2,
			rainbow = {
				enabled = true,
				shade = 5,
			},
		},
		highlight = {
			backdrop = true,
		},
	},
  -- stylua: ignore
	keys = {
		{"s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash",},
		{"S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter",},
		{"r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash",},
		{"R", mode = { "o", "x" }, function() require("flash").treesitter_search( ) end, desc = "Treesitter Search",},
		{"<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search",},
	},
}

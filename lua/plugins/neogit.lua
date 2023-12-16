return {
	"NeogitOrg/neogit",
	event = "VeryLazy",
	config = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		remember_settings = true,
		auto_refresh = true,
		use_per_project_settings = true,
		disable_hint = true,
		use_default_keymaps = false,
		disable_context_highlighting = true,
		signs = {
			hunk = { "", "" },
			item = { "", "" },
			section = { "", "" },
		},
		integrations = {
			telescope = true,
			diffview = false,
		},
		mappings = {
			finder = {
				["<cr>"] = "Select",
				["<esc>"] = "Close",
				["<tab>"] = "MultiselectToggleNext",
				["<s-tab>"] = "MultiselectTogglePrevious",
				["<c-j>"] = "NOP",
			},
			status = {
				["q"] = "Close",
				["I"] = "InitRepo",
				["1"] = "Depth1",
				["2"] = "Depth2",
				["3"] = "Depth3",
				["4"] = "Depth4",
				["<tab>"] = "Toggle",
				["x"] = "Discard",
				["ss"] = "Stage",
				["su"] = "StageUnstaged",
				["sa"] = "StageAll",
				["u"] = "Unstage",
				["U"] = "UnstageStaged",
				["Y"] = "YankSelected",
				["R"] = "RefreshBuffer",
				["gf"] = "GoToFile",
				["<c-v>"] = "VSplitOpen",
				["<c-x>"] = "SplitOpen",
				["<c-t>"] = "TabOpen",
				["{"] = "GoToPreviousHunkHeader",
				["}"] = "GoToNextHunkHeader",
				["d"] = false,
				["$"] = false,
			},
			popup = {
				["g?"] = "HelpPopup",
				["A"] = false,
				["D"] = false,
				["M"] = "RemotePopup",
				["P"] = "PushPopup",
				["X"] = "ResetPopup",
				["Z"] = "StashPopup",
				["b"] = "BranchPopup",
				["c"] = "CommitPopup",
				["f"] = "FetchPopup",
				["l"] = "LogPopup",
				["m"] = "MergePopup",
				["p"] = "PullPopup",
				["r"] = false,
				["v"] = false,
			},
		},
	},
}

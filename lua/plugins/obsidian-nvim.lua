return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	event = {
		"BufReadPre " .. vim.fn.expand("~") .. "/Obsidian/DoomsdayVault/*.md",
		"BufNewFile " .. vim.fn.expand("~") .. "/Obsidian/DoomsdayVault/*.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	opts = {
		preferred_link_style = "markdown",
		sort_by = "modified",
		sort_reversed = true,
		search_max_lines = 1000,

		workspaces = {
			{
				name = "personal",
				path = "~/Obsidian/DoomsdayVault",
			},
		},

		disable_frontmatter = true,

		templates = {
			folder = "Templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
		},

		completion = {
			nvim_cmp = true,
			min_chars = 1,
		},

		picker = {
			name = "telescope.nvim",
		},

		ui = {
			enable = true,
			update_debounce = 200,
			max_file_length = 5000,
			checkboxes = {
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				["x"] = { char = "✔", hl_group = "ObsidianDone" },
				-- ["/"] = { char = "", hl_group = "ObsidianRightArrow" },
				["/"] = { char = "", hl_group = "ObsidianRightArrow" },
				[">"] = { char = "󰄰", hl_group = "ObsidianRightArrow" },
				["~"] = { char = "", hl_group = "ObsidianTilde" },
				["!"] = { char = "󱋭", hl_group = "ObsidianImportant" },
			},
			bullets = { char = "󰖰", hl_group = "ObsidianBullet" },
			external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
			reference_text = { hl_group = "ObsidianRefText" },
			highlight_text = { hl_group = "ObsidianHighlightText" },
			tags = { hl_group = "ObsidianTag" },
			block_ids = { hl_group = "ObsidianBlockID" },
			hl_groups = {
				-- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
				ObsidianTodo = { bold = true, fg = "#f78c6c" },
				ObsidianDone = { bold = true, fg = "#89ddff" },
				ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
				ObsidianTilde = { bold = true, fg = "#ff5370" },
				ObsidianImportant = { bold = true, fg = "#d73128" },
				ObsidianBullet = { bold = true, fg = "#89ddff" },
				ObsidianRefText = { underline = true, fg = "#c792ea" },
				ObsidianExtLinkIcon = { fg = "#c792ea" },
				ObsidianTag = { italic = true, fg = "#89ddff" },
				ObsidianBlockID = { italic = true, fg = "#89ddff" },
				ObsidianHighlightText = { bg = "#75662e" },
			},
		},

		mappings = {
			["gf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			["<leader>ch"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
			-- Smart action depending on context, either follow link or toggle checkbox.
			["<cr>"] = {
				action = function()
					return require("obsidian").util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			},
		},

		-- see below for full list of options 👇
	},
}

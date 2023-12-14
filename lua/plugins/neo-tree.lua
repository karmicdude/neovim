return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	event = "VeryLazy",
	dependencies = {
		"3rd/image.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"s1n7ax/nvim-window-picker",
	},
	init = function()
		vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#9ca0b0" })
		vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#ef9f76" })
		vim.api.nvim_set_hl(0, "NeoTreeGitUnstaged", { fg = "#85c1dc" })
		vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "#9399b2" })
		vim.api.nvim_set_hl(0, "NeoTreeTabInactive", { fg = "#8180cb", bg = "#333351" })
		vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorInactive", { fg = "#1e1e2f", bg = "#1e1e2f" })
		vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorActive", { fg = "#1e1e2f", bg = "#1e1e2f" })
	end,
	opts = {
		sources = {
			"filesystem",
			"buffers",
			"git_status",
		},
		source_selector = {
			winbar = true,
			statusline = true,
			content_layout = "center",
			tabs_layout = "equal",
			separator = { left = "", right = "" },
			separator_active = "|",
			show_separator_on_edge = true,
			sources = {
				{ source = "filesystem", display_name = "󰬍 Files" },
				{ source = "buffers", display_name = "󰈙 Buff" },
				{ source = "git_status", display_name = " GIT" },
			},
			highlight_tab = "NeoTreeTabInactive",
			highlight_tab_active = "NeoTreeTabActive",
			highlight_background = "NeoTreeTabInactive",
			highlight_separator = "NeoTreeTabSeparatorInactive",
			highlight_separator_active = "NeoTreeTabSeparatorActive",
		},
		async_directory_scan = "always",
		event_handlers = {
			{
				event = "neo_tree_buffer_enter",
				handler = function()
					if vim.bo.filetype == "neo-tree" then
						vim.cmd("setlocal nonumber")
					end
				end,
			},
		},
		popup_border_style = "rounded",
		enable_git_status = true,
		enable_diagnostics = true,
		enable_normal_mode_for_inputs = false,
		-- when opening files, do not use windows containing these filetypes or buftypes
		open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
		sort_case_insensitive = false, -- used when sorting files and directories in the tree
		-- sort_function = nil, -- use a custom function for sorting files and directories in the tree
		default_component_configs = {
			container = {
				enable_character_fade = true,
			},
			indent = {
				indent_size = 2,
				padding = 1, -- extra padding on left hand side
				-- indent guides
				with_markers = true,
				indent_marker = "│",
				last_indent_marker = "└",
				highlight = "NeoTreeIndentMarker",
				-- expander config, needed for nesting files
				with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "",
				folder_empty_open = "",
				default = " ",
				highlight = "NeoTreeFileIcon",
			},
			modified = {
				symbol = "",
				highlight = "NeoTreeModified",
			},
			name = {
				trailing_slash = false,
				use_git_status_colors = true,
				highlight = "NeoTreeFileName",
			},
			git_status_async = true,
			git_status = {
				symbols = {
					-- Change type
					added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
					modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
					deleted = "✖", -- this can only be used in the git_status source
					renamed = "󰁕", -- this can only be used in the git_status source
					-- Status type
					untracked = "",
					ignored = "",
					unstaged = "",
					staged = "",
					conflict = "",
				},
			},
			-- If you don't want to use these columns, you can set `enabled = false` for each of them individually
			file_size = {
				enabled = true,
				required_width = 64, -- min width of window required to show this column
			},
			type = {
				enabled = true,
				required_width = 122, -- min width of window required to show this column
			},
			last_modified = {
				enabled = true,
				required_width = 88, -- min width of window required to show this column
			},
			created = {
				enabled = true,
				required_width = 110, -- min width of window required to show this column
			},
			symlink_target = {
				enabled = false,
			},
		},
		-- A list of functions, each representing a global custom command
		-- that will be available in all sources (if not overridden in `opts[source_name].commands`)
		-- see `:h neo-tree-custom-commands-global`
		window = {
			position = "left",
			width = 40,
			mapping_options = {
				noremap = true,
				nowait = true,
			},
			mappings = {
				["/"] = "noop",
				["<space>"] = {
					"toggle_node",
					nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
				},
				["<2-LeftMouse>"] = "open",
				["<cr>"] = "open",
				["<esc>"] = "cancel", -- close preview or floating neo-tree window
				["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
				-- Read `# Preview Mode` for more information
				["l"] = "focus_preview",
				["S"] = "split_with_window_picker",
				["s"] = "vsplit_with_window_picker",
				["t"] = "open_tabnew",
				-- ["<cr>"] = "open_drop",
				-- ["t"] = "open_tab_drop",
				["w"] = "open_with_window_picker",
				["C"] = "close_node",
				-- ['C'] = 'close_all_subnodes',
				["z"] = "close_all_nodes",
				--["Z"] = "expand_all_nodes",
				["a"] = {
					"add",
					-- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
					-- some commands may take optional config options, see `:h neo-tree-mappings` for details
					config = {
						show_path = "none", -- "none", "relative", "absolute"
					},
				},
				["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
				["d"] = "delete",
				["r"] = "rename",
				["y"] = "copy_to_clipboard",
				["x"] = "cut_to_clipboard",
				["p"] = "paste_from_clipboard",
				["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
				-- ["c"] = {
				--  "copy",
				--  config = {
				--    show_path = "none" -- "none", "relative", "absolute"
				--  }
				--}
				["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
				["q"] = "close_window",
				["R"] = "refresh",
				["?"] = "show_help",
				["<"] = "prev_source",
				[">"] = "next_source",
				["i"] = "show_file_details",
			},
		},
		nesting_rules = {},
		filesystem = {
			filtered_items = {
				visible = false, -- when true, they will just be displayed differently than normal items
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_by_name = {
					".git",
					"node_modules",
					".vimroot",
				},
				hide_by_pattern = { -- uses glob style patterns
					--"*.meta",
					--"*/src/*/tsconfig.json",
				},
				always_show = { -- remains visible even if other settings would normally hide it
					--".gitignored",
				},
				never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
					".DS_Store",
					"thumbs.db",
				},
				never_show_by_pattern = { -- uses glob style patterns
					--".null-ls_*",
				},
			},
			follow_current_file = {
				enabled = true, -- This will find and focus the file in the active buffer every time
				--               -- the current file is changed while the tree is open.
				leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
			},
			group_empty_dirs = true,
			hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
			-- in whatever position is specified in window.position
			-- "open_current",  -- netrw disabled, opening a directory opens within the
			-- window like netrw would, regardless of window.position
			-- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
			use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
			-- instead of relying on nvim autocmd events.
			-- window = {
			--   mappings = {
			--     ["<bs>"] = "navigate_up",
			--     ["."] = "set_root",
			--     ["H"] = "toggle_hidden",
			--     ["/"] = "fuzzy_finder",
			--     ["D"] = "fuzzy_finder_directory",
			--     ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
			--     -- ["D"] = "fuzzy_sorter_directory",
			--     ["f"] = "filter_on_submit",
			--     ["<c-x>"] = "clear_filter",
			--     ["[g"] = "prev_git_modified",
			--     ["]g"] = "next_git_modified",
			--     ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
			--     ["oc"] = { "order_by_created", nowait = false },
			--     ["od"] = { "order_by_diagnostics", nowait = false },
			--     ["og"] = { "order_by_git_status", nowait = false },
			--     ["om"] = { "order_by_modified", nowait = false },
			--     ["on"] = { "order_by_name", nowait = false },
			--     ["os"] = { "order_by_size", nowait = false },
			--     ["ot"] = { "order_by_type", nowait = false },
			--   },
			fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
				["<down>"] = "move_cursor_down",
				["<C-n>"] = "move_cursor_down",
				["<up>"] = "move_cursor_up",
				["<C-p>"] = "move_cursor_up",
			},
		},

		commands = {}, -- Add a custom command or override a global one using the same function name
	},
	buffers = {
		follow_current_file = {
			enabled = true, -- This will find and focus the file in the active buffer every time
			--              -- the current file is changed while the tree is open.
			leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
		},
		group_empty_dirs = true, -- when true, empty folders will be grouped together
		show_unloaded = true,
		window = {
			mappings = {
				["bd"] = "buffer_delete",
				["<bs>"] = "navigate_up",
				["."] = "set_root",
				["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
				["oc"] = { "order_by_created", nowait = false },
				["od"] = { "order_by_diagnostics", nowait = false },
				["om"] = { "order_by_modified", nowait = false },
				["on"] = { "order_by_name", nowait = false },
				["os"] = { "order_by_size", nowait = false },
				["ot"] = { "order_by_type", nowait = false },
			},
		},
	},

	git_status = {
		window = {
			position = "float",
			mappings = {
				["A"] = "git_add_all",
				["gu"] = "git_unstage_file",
				["ga"] = "git_add_file",
				["gr"] = "git_revert_file",
				["gc"] = "git_commit",
				["gp"] = "git_push",
				["gg"] = "git_commit_and_push",
				["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
				["oc"] = { "order_by_created", nowait = false },
				["od"] = { "order_by_diagnostics", nowait = false },
				["om"] = { "order_by_modified", nowait = false },
				["on"] = { "order_by_name", nowait = false },
				["os"] = { "order_by_size", nowait = false },
				["ot"] = { "order_by_type", nowait = false },
			},
		},
	},
}

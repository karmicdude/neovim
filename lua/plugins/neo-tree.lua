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
		enable_diagnostics = true,
		open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "edgy", "lazy" },
		use_default_mappings = false,
		source_selector = {
			winbar = true,
			sources = {
				{ source = "filesystem" },
				{ source = "buffers" },
				{ source = "git_status", display_name = " Git" },
			},
			content_layout = "center",
			separator = { left = "", right = "" },
		},
		default_component_configs = {
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "󰉖",
				folder_empty_open = "",
				default = " ",
				highlight = "NeoTreeFileIcon",
			},
			modified = {
				symbol = "",
			},
			git_status = {
				symbols = {
					added = "",
					deleted = "✖",
					modified = "",
					renamed = "󰁕",
					untracked = "",
					ignored = "",
					unstaged = "",
					staged = "",
					conflict = "",
				},
				align = "right",
			},
			created = {
				enabled = false,
				required_width = 120,
			},
			symlink_target = {
				enabled = true,
			},
		},
		window = {
			width = 45,
			mappings = {
				["<tab>"] = { "toggle_node", nowait = false },
				["<cr>"] = { "open", config = { expand_nested_files = true } },
				["<esc>"] = "cancel",
				["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
				["l"] = "focus_preview",
				["S"] = "open_split",
				["s"] = "open_vsplit",
				["t"] = "open_tabnew",
				["w"] = "open_with_window_picker",
				["C"] = { "close_node", nowait = true },
				["Z"] = "close_all_nodes",
				["e"] = "expand_all_nodes",
				["E"] = "toggle_auto_expand_width",
				["R"] = "refresh",
				["a"] = { "add", config = { show_path = "relative" } },
				["d"] = "delete",
				["r"] = "rename",
				["y"] = "copy_to_clipboard",
				["x"] = "cut_to_clipboard",
				["p"] = "paste_from_clipboard",
				["c"] = "copy",
				["m"] = "move",
				["q"] = "close_window",
				["?"] = "show_help",
				["<"] = "prev_source",
				[">"] = "next_source",
				["Y"] = { "copy_path", desc = "Copy path" },
				["B"] = { "go_to_parent", desc = "Jump to parent node" },
			},
		},
		filesystem = {
			window = {
				mappings = {
					["H"] = "toggle_hidden",
					["/"] = "noop",
					["ff"] = "fuzzy_finder",
					["fd"] = "fuzzy_finder_directory",
					["fs"] = "filter_on_submit",
					["f/"] = "filter_as_you_type",
					["#"] = "fuzzy_sorter",
					["<C-x>"] = "clear_filter",
					["<bs>"] = "navigate_up",
					["."] = "set_root",
					["[g"] = "prev_git_modified",
					["]g"] = "next_git_modified",
					["i"] = "show_file_details",
					["o"] = "system_open",
					["?"] = { "show_help" },
					["oc"] = { "order_by_created", nowait = false },
					["od"] = { "order_by_diagnostics", nowait = false },
					["og"] = { "order_by_git_status", nowait = false },
					["om"] = { "order_by_modified", nowait = false },
					["on"] = { "order_by_name", nowait = false },
					["os"] = { "order_by_size", nowait = false },
					["ot"] = { "order_by_type", nowait = false },
				},
				fuzzy_finder_mappings = {
					["<down>"] = "move_cursor_down",
					["<C-n>"] = "move_cursor_down",
					["<up>"] = "move_cursor_up",
					["<C-p>"] = "move_cursor_up",
				},
			},
			scan_mode = "deep", -- "shallow"
			filtered_items = {
				visible = false,
				force_visible_in_empty_folder = false,
				show_hidden_count = true,
				hide_dotfiles = false,
				hide_gitignored = true,
				hide_hidden = true,
				hide_by_name = {
					".husky",
					".collections",
					".facts_cache",
					".retry",
				},
				hide_by_pattern = {
					--"*.meta",
					--"*/src/*/tsconfig.json"
				},
				always_show = {
					".gitignored",
					".github",
					".envrc",
					".env",
					".vault",
					".tool-versions",
				},
				never_show = {
					".DS_Store",
					"thumbs.db",
					".git",
					"node_modules",
					"__pycache__",
				},
				never_show_by_pattern = {
					--".null-ls_*",
				},
			},
			find_args = {
				fd = {
					"--exclude",
					".git",
					"--exclude",
					"node_modules",
				},
			},
			group_empty_dirs = true,
			follow_current_file = {
				enabled = true,
				leave_dirs_open = true,
			},
			use_libuv_file_watcher = true,
		},
		buffers = {
			window = {
				mappings = {
					["<bs>"] = "navigate_up",
					["."] = "set_root",
					["bd"] = "buffer_delete",
					["i"] = "show_file_details",
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
				mappings = {
					["A"] = "git_add_all",
					["gu"] = "git_unstage_file",
					["ga"] = "git_add_file",
					["gr"] = "git_revert_file",
					["gc"] = "git_commit",
					["gp"] = "git_push",
					["gg"] = "git_commit_and_push",
					["i"] = "show_file_details",
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
		commands = {
			system_open = function(state)
				local node = state.tree:get_node()
				local path = node:get_id()
				vim.fn.jobstart({ "open", path }, { detach = true })
			end,
			go_to_parent = function(state)
				local node = state.tree:get_node()
				require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
			end,
			copy_path = function(state)
				local node = state.tree:get_node()
				local filepath = node:get_id()
				local filename = node.name
				local modify = vim.fn.fnamemodify

				local results = {
					filepath,
					modify(filepath, ":."),
					modify(filepath, ":~"),
					filename,
					modify(filename, ":r"),
					modify(filename, ":e"),
				}

				-- absolute path to clipboard
				local i = vim.fn.inputlist({
					"Choose to copy to clipboard:",
					"1. Absolute path: " .. results[1],
					"2. Path relative to CWD: " .. results[2],
					"3. Path relative to HOME: " .. results[3],
					"4. Filename: " .. results[4],
					"5. Filename without extension: " .. results[5],
					"6. Extension of the filename: " .. results[6],
				})

				if i > 0 then
					local result = results[i]
					if not result then
						return print("Invalid choice: " .. i)
					end
					vim.fn.setreg("*", result)
					vim.notify("Copied: " .. result)
				end
			end,
		},
	},
}

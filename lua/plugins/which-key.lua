local utils = require("core.utils")

local opts_default = {
	mode = "n",
	noremap = true,
	nowait = true,
	silent = true,
}
-- Common mappings --------------------
local mappings_normal = {
	-- splits
	["<C-\\>"] = { "<CMD>vsplit<CR>", "󰖯 Split: Vertically" },
	["<C-->"] = { "<CMD>split<CR>", "󰖯 Split: Horisontally" },
	-- tabs
	["<C-CR>"] = { "<CMD>tabnew<CR>", "󰖯 Tab: New" },
	["<C-S-BS>"] = { "<CMD>tabclose<CR>", "󰖯 Tab: Close" },
	["<C-h>"] = { "<CMD>tabprevious<CR>", "󰖯 Tab: Previous" },
	["<C-l>"] = { "<CMD>tabnext<CR>", "󰖯 Tab: Next" },
	["<C-S-r>"] = { utils.rename_tab, "󰖯 Tab: Rename" },
	-- wins
	["<C-j>"] = { "<CMD>wincmd h<CR>", "󰖯 Window: Go to the left window" },
	["<C-k>"] = { "<CMD>wincmd l<CR>", "󰖯 Window: Go to the right window" },
	["<C-TAB>"] = { utils.pick_window, "󰖯 Window: Pick window for focus" },
	--
	["<C-S-w>"] = { "<CMD>noautocmd w<CR>", " Save without autocmd" },
	["<C-S-p>"] = { "<CMD>Telescope projects<CR>", " Projects" },
	["<C-S-i>"] = { "<CMD>lua require('conform').format()<CR>", "󰅪 Format document" },
	["<C-/>"] = { "<Plug>(comment_toggle_linewise_current)", " Comment line" },
	["gS"] = { "<CMD>lua MiniSplitjoin.toggle()<CR>", " Split or join arguments" },
	["z?"] = { "<CMD>Telescope spell_suggest<CR>", "󰏪 Spell suggestions" },
}

local mappings_visual = {
	["<C-/>"] = { "<Plug>(comment_toggle_linewise_visual)", " Comment selection" },
}
local opts_visual = vim.tbl_deep_extend("force", opts_default, { mode = "v" })

-- Insert mappings --------------------
local mappings_insert = {
	["<C-S-i>"] = { "<CMD>lua require('conform').format()<CR>", "󰅪 LSP: Format document" },
}

local opts_insert = vim.tbl_deep_extend("force", opts_default, { mode = "i" })

-- LEADER -----------------------------
local leader_mappings_normal = {
	f = {
		["b"] = { "<CMD>Telescope buffers<CR>", " Find opened [b]uffers" },
		["f"] = { "<CMD>Telescope find_files<CR>", " Find [f]iles in CWD" },
		["g"] = { "<CMD>Telescope grep_string<CR>", " [g]rep string" },
		["l"] = { "<CMD>Telescope live_grep<CR>", " [l]ive grep" },
		["t"] = { "<CMD>TodoTelescope<CR>", " Find TODO" },
		["/"] = { "<CMD>Telescope current_buffer_fuzzy_find<CR>", " Search text in current buffer" },
		["?"] = { "<CMD>Telescope oldfiles<CR>", " Recent files" },
		["]"] = { "<CMD>bnext<CR>", " Next buffer" },
		["["] = { "<CMD>bprevious<CR>", " Previous buffer" },
	},
	h = {
		name = "  Helpers",
		["a"] = { "<CMD>Telescope autocommands<CR>", " List autocommands" },
		["b"] = { "<CMD>Telescope builtin<CR>", " Builtins" },
		["c"] = { "<CMD>Telescope colorscheme<CR>", " Colorschemas" },
		["h"] = { "<CMD>Telescope help_tags<CR>", " List available help tags" },
		["s"] = { "<CMD>Telescope symbols<CR>", " Symbols" },
		["k"] = { "<CMD>Telescope keymaps<CR>", " List mappings" },
		["l"] = { "<CMD>Telescope highlights<CR>", " Highlights" },
		["m"] = { "<CMD>Telescope man_pages<CR>", " List man pages" },
		["o"] = { "<CMD>Telescope vim_options<CR>", " List nvim options" },
		["p"] = { "<CMD>Telescope reloader<CR>", " Reload plugins" },
		["t"] = { "<CMD>Telescope filetypes<CR>", " Filetypes" },
	},
}

local leader_opts_normal = vim.tbl_deep_extend("force", opts_default, { prefix = "<leader>" })

local leader_mappings_visual = {
	g = {
		["Y"] = { "<CMD>GitLink!<CR>", " Git: Open permalink in browser" },
		["y"] = { "<CMD>GitLink<CR>", " Git: Copy permalink to keyboard" },
	},
}

local leader_opts_visual = vim.tbl_deep_extend("force", opts_default, { prefix = "<leader>", mode = "v" })

-- COMMA -----------------------------
local comma_mappings_normal = {
	d = {
		name = "󰅪 LSP / Diagnostic",
		["a"] = { "<CMD>lua vim.lsp.buf.code_action()<CR>", "󰅪 Code actions" },
		["d"] = { "<CMD>Telescope lsp_definitions<CR>", "󰅪 Go To Definition" },
		["f"] = { "<CMD>lua require('conform').format()<CR>", "󰅪 Format document" },
		["i"] = { "<CMD>Telescope lsp_implementations<CR>", "󰅪 Go To Implementation" },
		["I"] = { "<CMD>Telescope lsp_incoming_calls<CR>", "󰅪 Incoming calls" },
		["j"] = { "<CMD>lua vim.diagnostic.goto_next()<CR>", "󰅪 Go to next diagnostic" },
		["k"] = { "<CMD>lua vim.diagnostic.goto_prev()<CR>", "󰅪 Go to previous diagnostic" },
		["l"] = { "<CMD>Telescope diagnostics<CR>", "󰅪 List of diagnostics" },
		["O"] = { "<CMD>Telescope lsp_outgoing_calls<CR>", "󰅪 Outgoing calls" },
		["r"] = { "<CMD>Telescope lsp_references<CR>", "󰅪 Go to references" },
		["R"] = { "󰅪 Rename" }, -- see config.keymaps for `,dR` mapping
		["s"] = { "<CMD>Telescope lsp_document_symbols<CR>", "󰅪 Document symbols" },
		["S"] = { "<CMD>Telescope treesitter<CR>", "󰅪 Treesitter symbols" },
		["t"] = { "<CMD>Telescope lsp_type_definitions<CR>", "󰅪 Type Definition" },
		["W"] = { "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>", "󰅪 Dynamic Workspace symbols" },
		["w"] = { "<CMD>Telescope lsp_workspace_symbols<CR>", "󰅪 Workspace symbols" },
		["?"] = { "<CMD>lua vim.diagnostic.open_float()<CR>", "󰅪 Show float diagnostic message" },
	},
	g = {
		name = " GIT",
		["a"] = { "<CMD>Gitsigns stage_buffer<CR>", " Git: Stage buffer" },
		["b"] = { "<CMD>Telescope git_branches<CR>", " Git: [b]ranches" },
		["C"] = { "<CMD>Telescope git_bcommits<CR>", " Git: Buffer's [c]commits" },
		["c"] = { "<CMD>Telescope git_commits<CR>", " Git: [c]commits" },
		["d"] = { "<CMD>DiffviewOpen<CR>", " Git: Diffview" },
		["D"] = { "<CMD>Gitsigns diffthis<CR>", " Git: Show diff this" },
		["f"] = { "<CMD>Telescope git_files<CR>", " Git: find [f]iles" },
		["g"] = { "<CMD>Neogit<CR>", " NeoGit" },
		["h"] = { "<CMD>Gitsigns toggle_deleted<CR>", " Git: Toggle deleted lines" },
		["H"] = { "<CMD>Gitsigns toggle_linehl<CR>", " Git: Toggle line highliting" },
		["l"] = { "<CMD>DiffviewFileHistory<CR>", " Git: Show Diffview File History" },
		["R"] = { "<CMD>Gitsigns reset_buffer<CR>", " Git: Reset buffer status" },
		["r"] = { "<CMD>Gitsigns reset_hunk<CR>", " Git: Reset hunk" },
		["S"] = { "<CMD>Telescope git_stash<CR>", " Git: Show [S]tash" },
		["s"] = { "<CMD>Telescope git_status<CR>", " Git: Show [s]tatus" },
		["w"] = { "<CMD>Gitsigns toggle_current_line_blame<CR>", " Git: toggle current line blame" },
		["Y"] = { "<CMD>GitLink!<CR>", " Git: Open permalink in browser" },
		["y"] = { "<CMD>GitLink<CR>", " Git: Copy permalink to keyboard" },
		["?"] = { "<CMD>Gitsigns preview_hunk_inline<CR>", " Git: Show preview for hunk" },
		["]"] = { "<CMD>Gitsigns next_hunk<CR>", " Git: Next hunk" },
		["["] = { "<CMD>Gitsigns prev_hunk<CR>", " Git: Previous hunk" },
	},
	n = { "<CMD>nohlsearch<CR>", " nohlsearch" },
	m = {
		name = " Marks",
		["l"] = { "<CMD>Telescope marks<CR>", " List marks" },
	},
	e = { "<CMD>Neotree focus<CR>", " NeoTree focus" },
	t = {
		name = "  NeoTree: Left Sidebar",
		t = { "<CMD>Neotree toggle left<CR>", " Toggle" },
		f = { "<CMD>Neotree focus left<CR>", " Focus" },
		r = { "<CMD>Neotree reveal left<CR>", " Reveal" },
		g = { "<CMD>Neotree git_status left<CR>", " Git status" },
		b = { "<CMD>Neotree buffers left<CR>", " Buffers" },
	},
	T = {
		name = "  NeoTree: Float Window",
		t = { "<CMD>Neotree toggle float<CR>", " Toggle float" },
		f = { "<CMD>Neotree focus float<CR>", " Focus float" },
		r = { "<CMD>Neotree reveal float<CR>", " Reveal float" },
		g = { "<CMD>Neotree git_status float<CR>", " Git status float" },
		b = { "<CMD>Neotree buffers float<CR>", " Buffers float" },
	},
	z = {
		name = " 󰰶 ZEN mode",
		["a"] = { "<CMD>TZAtaraxis<CR>", "󰰶 Zen: Ataraxis mode" },
		["d"] = { "<CMD>Twilight<CR>", "󰰶 Twilight: Dim code block" },
		["f"] = { "<CMD>TZFocus<CR>", "󰰶 Zen: Focus mode" },
	},
	["<tab>"] = { "<CMD>Neotree toggle<CR>", " NeoTree toggle" },
}
local comma_opts_normal = vim.tbl_deep_extend("force", opts_default, { prefix = "," })

local comma_mappings_visual = {
	z = {
		name = " 󰰶 ZEN mode",
		["n"] = { "<CMD>'<,'>TZNarrow<CR>", "󰰶 Zen: Narrow mode" },
	},
}

local comma_opts_visual = vim.tbl_deep_extend("force", opts_default, { prefix = ",", mode = "v" })

-- BACKSLASH --------------------------
local backslash_mappings_normal_visual = {
	["D"] = { "<CMD>bdelete<CR>", " Close buffer" },
	["q"] = { "<CMD>qa!<CR>", " Force Quit" },
	["t"] = {
		name = "  Terminal",
		t = { "<cmd>lua require('core.utils').ext_terminal()<CR>", " Open terminal tab in current root directory" },
		f = { "<cmd>lua require('core.utils').ext_terminal('buffer')<CR>", " Open terminal tab in buffer directory" },
		w = {
			"<cmd>lua require('core.utils').ext_terminal(nil, 'window')<CR>",
			" Open terminal split in root directory",
		},
		s = {
			"<cmd>lua require('core.utils').ext_terminal('buffer', 'window')<CR>",
			" Open terminal split in buffer directory",
		},
	},
}

local backslash_opts_normal_visual = vim.tbl_deep_extend("force", opts_default, {
	prefix = "\\",
	mode = { "v", "n" },
})

---------------------------------------

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 700

		local wk = require("which-key")
		wk.register(mappings_insert, opts_insert)
		wk.register(mappings_normal, opts_default)
		wk.register(mappings_visual, opts_visual)
		wk.register(leader_mappings_normal, leader_opts_normal)
		wk.register(leader_mappings_visual, leader_opts_visual)
		wk.register(comma_mappings_normal, comma_opts_normal)
		wk.register(comma_mappings_visual, comma_opts_visual)
		wk.register(backslash_mappings_normal_visual, backslash_opts_normal_visual)
	end,
	opts = {
		key_labels = {
			["<space>"] = "<SPC>",
			["<cr>"] = "<RETURN>",
			["<tab>"] = "<TAB>",
		},
		window = {
			border = "single",
		},
		triggers_blacklist = {
			i = { "j", "k" },
			v = { "j", "k" },
		},
	},
}

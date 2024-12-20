-- TODO:--
-- - move icons to `rules`. see https://github.com/folke/which-key.nvim/blob/main/lua/which-key/icons.lua
-- - rework keys with wk.add(), because current way can't doen't allow to flexibly set the name of groups
local utils = require("core.utils")

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	dependencies = {
		"echasnovski/mini.icons",
	},
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 700
		local wk = require("which-key")
		-- Some custom actions
		wk.add({
			{ "<leader>a", group = "  Actions" },
			-- Ansible
			{
				"<leader>ad",
				"<CMD>!ansible-vault decrypt %<CR>",
				desc = "󰯭 Ansible Vault: Decrypt vault encrypted file",
				nowait = true,
				remap = false,
			},
			{
				"<leader>ae",
				"<CMD>!ansible-vault ecrypt %<CR>",
				desc = "󰯭 Ansible Vault: Encrypt file with vault",
				nowait = true,
				remap = false,
			},
			{
				"<leader>av",
				"<CMD>AnsibleVaultView<CR>",
				desc = "󰯭 Ansible Vault: View encrypted vault file",
				nowait = true,
				remap = false,
			},
		})
		-- Obsidian
		wk.add({
			{ "<leader>o", group = " 󰧑 Obsidian" },
			{
				"<leader>ob",
				"<CMD>ObsidianBacklinks<CR>",
				desc = "󰿨 Open backlinks to current buffer",
				nowait = true,
				remap = false,
			},
			{
				"<leader>of",
				"<CMD>ObsidianSearch<CR>",
				desc = " Search for (or create) notes",
				nowait = true,
				remap = false,
			},
			{
				"<leader>oi",
				"<CMD>ObsidianTOC<CR>",
				desc = " Show TOC of current buffer",
				nowait = true,
				remap = false,
			},
			{
				"<leader>ol",
				"<CMD>ObsidianLinkNew<CR>",
				desc = "󱄀 Create new link from selected text",
				nowait = true,
				remap = false,
				mode = "v",
			},
			{
				"<leader>oL",
				"<CMD>ObsidianLinks<CR>",
				desc = "󰿨 Show all links from current buffer",
				nowait = true,
				remap = false,
			},
			{
				"<leader>on",
				"<CMD>ObsidianNew<CR>",
				desc = " New document",
				nowait = true,
				remap = false,
			},
			{
				"<leader>oN",
				"<CMD>ObsidianNewFromTemplate<CR>",
				desc = " New document from template",
				nowait = true,
				remap = false,
			},
			{
				"<leader>oo",
				"<CMD>ObsidianOpen<CR>",
				desc = " Open current buffer in Obsidian",
				nowait = true,
				remap = false,
			},
			{
				"<leader>or",
				"<CMD>ObsidianRename<CR>",
				desc = "󰑕 Rename current file",
				nowait = true,
				remap = false,
			},
			{
				"<leader>os",
				"<CMD>ObsidianFollowLink vsplit<CR>",
				desc = " Open link in vertical split",
				nowait = true,
				remap = false,
			},
			{ "<leader>ot", "<CMD>ObsidianTags<CR>", desc = " List of Obsidian Tags", nowait = true, remap = false },
			{
				"<leader>oT",
				"<CMD>ObsidianTemplate<CR>",
				desc = " List of available templates",
				nowait = true,
				remap = false,
			},
			{
				"<leader>ox",
				"<CMD>ObsidianExtractNote<CR>",
				desc = "󰎜 Extract selected text to new note",
				nowait = true,
				remap = false,
				mode = "v",
			},
		})
	end,
	opts = {
		notify = false,
		replace = {
			key = {
				function(key)
					return require("which-key.view").format(key)
				end,
				{ "<Space>", "SPC" },
				{ "<CR>", "RETURN" },
				{ "<tab>", "TAB" },
			},
		},
		win = {
			border = "single",
		},
		icons = {
			mappings = false,
		},
	},
	show_help = true,
	show_keys = true,
	icons = {
		group = " ",
	},
	keys = {
		-- NORMAL
		----- tabs
		{
			"<C-\\>",
			"<CMD>vsplit<CR>",
			desc = "󰖯 Split: Vertically",
			nowait = true,
			remap = false,
		},
		{
			"<C-->",
			"<CMD>split<CR>",
			desc = "󰖯 Split: Horisontally",
			nowait = true,
			remap = false,
		},
		{
			"<C-l>",
			"<CMD>tabnext<CR>",
			desc = "󰖯 Tab: Next",
			nowait = true,
			remap = false,
		},
		{
			"<C-S-r>",
			utils.rename_tab,
			desc = "󰖯 Tab: Rename",
			nowait = true,
			remap = false,
		},
		{
			"<C-CR>",
			"<CMD>tabnew<CR>",
			desc = "󰖯 Tab: New",
			nowait = true,
			remap = false,
		},
		{
			"<C-S-BS>",
			"<CMD>tabclose<CR>",
			desc = "󰖯 Tab: Close",
			nowait = true,
			remap = false,
		},
		{
			"<C-h>",
			"<CMD>tabprevious<CR>",
			desc = "󰖯 Tab: Previous",
			nowait = true,
			remap = false,
		},
		{
			"<C-l>",
			"<CMD>tabnext<CR>",
			desc = "󰖯 Tab: Next",
			nowait = true,
			remap = false,
		},
		{
			"<C-S-r>",
			utils.rename_tab,
			desc = "󰖯 Tab: Rename",
			nowait = true,
			remap = false,
		},
		{
			"<C-/>",
			"<Plug>(comment_toggle_linewise_current)",
			desc = " Comment line",
			nowait = true,
			remap = false,
		},
		----- wins
		{
			"<C-j>",
			"<CMD>wincmd h<CR>",
			desc = "󰖯 Window: Go to the left window",
			nowait = true,
			remap = false,
		},
		{
			"<C-k>",
			"<CMD>wincmd l<CR>",
			desc = "󰖯 Window: Go to the right window",
			nowait = true,
			remap = false,
		},
		{
			"<C-TAB>",
			utils.pick_window,
			desc = "󰖯 Window: Pick window for focus",
			nowait = true,
			remap = false,
		},
		-----
		{
			"<C-S-i>",
			"<CMD>lua require('conform').format()<CR>",
			desc = "󰅪 Format document",
			nowait = true,
			remap = false,
		},
		{
			"<C-S-p>",
			"<CMD>Telescope projects<CR>",
			desc = " Projects",
			nowait = true,
			remap = false,
		},
		{
			"<C-S-w>",
			"<CMD>noautocmd w<CR>",
			desc = " Save without autocmd",
			nowait = true,
			remap = false,
		},
		{
			"gF",
			"<CMD>vertical wincmd f<CR>",
			desc = "󰖯 Follow link in vertical split",
			nowait = true,
			remap = false,
		},
		{
			"gS",
			"<CMD>lua MiniSplitjoin.toggle()<CR>",
			desc = " Split or join arguments",
			nowait = true,
			remap = false,
		},
		{
			"gX",
			"<CMD>URLOpenUnderCursor<CR>",
			desc = " Open URL under cursor",
			nowait = true,
			remap = false,
		},
		{
			"z?",
			"<CMD>Telescope spell_suggest<CR>",
			desc = "󰏪 Spell suggestions",
			nowait = true,
			remap = false,
		},
		-- VISUAL
		{
			"<C-/>",
			"<Plug>(comment_toggle_linewise_visual)",
			desc = " Comment selection",
			mode = "v",
			nowait = true,
			remap = false,
		},
		{
			"gS",
			":<C-U>lua MiniSplitjoin.toggle({ region = MiniSplitjoin.get_visual_region() })<CR>",
			desc = " Split or join arguments",
			nowait = true,
			remap = false,
			mode = { "x" },
		},
		{
			"gs",
			":'<,'>!sort<CR>",
			desc = "󰒺 Sort lines",
			nowait = true,
			remap = false,
			mode = "v",
		},
		-- INSERT
		{
			"<C-S-i>",
			"<CMD>lua require('conform').format()<CR>",
			desc = "󰅪 LSP: Format document",
			mode = "i",
			nowait = true,
			remap = false,
		},
		{
			"<C-/>",
			"<ESC><Plug>(comment_toggle_linewise_current)",
			desc = " Comment line",
			nowait = true,
			remap = false,
			mode = "i",
		},
		-- LEADER -----------------------------
		{
			"<leader>f/",
			"<CMD>Telescope current_buffer_fuzzy_find<CR>",
			desc = " Search text in current buffer",
			nowait = true,
			remap = false,
		},
		{
			"<leader>f?",
			"<CMD>Telescope oldfiles<CR>",
			desc = " Recent files",
			nowait = true,
			remap = false,
		},
		{
			"<leader>f[",
			"<CMD>bprevious<CR>",
			desc = " Previous buffer",
			nowait = true,
			remap = false,
		},
		{
			"<leader>f]",
			"<CMD>bnext<CR>",
			desc = " Next buffer",
			nowait = true,
			remap = false,
		},
		{
			"<leader>fb",
			"<CMD>Telescope buffers<CR>",
			desc = " Find opened [b]uffers",
			nowait = true,
			remap = false,
		},
		{
			"<leader>ff",
			"<CMD>Telescope find_files<CR>",
			desc = " Find [f]iles in CWD",
			nowait = true,
			remap = false,
		},
		{
			"<leader>fg",
			"<CMD>Telescope grep_string<CR>",
			desc = " [g]rep string",
			nowait = true,
			remap = false,
		},
		{
			"<leader>fl",
			"<CMD>Telescope live_grep<CR>",
			desc = " [l]ive grep",
			nowait = true,
			remap = false,
		},
		{
			"<leader>ft",
			"<CMD>TodoTelescope<CR>",
			desc = " Find TODO",
			nowait = true,
			remap = false,
		},
		-- Snippets
		{
			"<leader>s",
			group = " Snippets",
			nowait = true,
			remap = true,
			mode = "n",
		},
		{
			"<leader>scl",
			"<CMD>lua expand_snippet_by_name('clog', 'javascript')<CR>",
			desc = " Wrap yank with console.log()",
			nowait = true,
			remap = true,
		},
		-- Helpers
		{
			"<leader>h",
			group = "  Helpers",
			nowait = true,
			remap = false,
		},
		{
			"<leader>ha",
			"<CMD>Telescope autocommands<CR>",
			desc = " List autocommands",
			nowait = true,
			remap = false,
		},
		{
			"<leader>hb",
			"<CMD>Telescope builtin<CR>",
			desc = " Builtins",
			nowait = true,
			remap = false,
		},
		{
			"<leader>hc",
			"<CMD>Telescope colorscheme<CR>",
			desc = " Colorschemas",
			nowait = true,
			remap = false,
		},
		{
			"<leader>hh",
			"<CMD>Telescope help_tags<CR>",
			desc = " List available help tags",
			nowait = true,
			remap = false,
		},
		{
			"<leader>hk",
			"<CMD>Telescope keymaps<CR>",
			desc = " List mappings",
			nowait = true,
			remap = false,
		},
		{
			"<leader>hl",
			"<CMD>Telescope highlights<CR>",
			desc = " Highlights",
			nowait = true,
			remap = false,
		},
		{
			"<leader>hm",
			"<CMD>Telescope man_pages<CR>",
			desc = " List man pages",
			nowait = true,
			remap = false,
		},
		{
			"<leader>ho",
			"<CMD>Telescope vim_options<CR>",
			desc = " List nvim options",
			nowait = true,
			remap = false,
		},
		{
			"<leader>hp",
			"<CMD>Telescope reloader<CR>",
			desc = " Reload plugins",
			nowait = true,
			remap = false,
		},
		{
			"<leader>hs",
			"<CMD>Telescope symbols<CR>",
			desc = " Symbols",
			nowait = true,
			remap = false,
		},
		{
			"<leader>ht",
			"<CMD>Telescope filetypes<CR>",
			desc = " Filetypes",
			nowait = true,
			remap = false,
		},
		-- LEADER VISUAL
		{
			"<leader>gY",
			"<CMD>GitLink!<CR>",
			desc = " Git: Open permalink in browser",
			mode = "v",
			nowait = true,
			remap = false,
		},
		{
			"<leader>gy",
			"<CMD>GitLink<CR>",
			desc = " Git: Copy permalink to keyboard",
			mode = "v",
			nowait = true,
			remap = false,
		},
		-- COMMA
		{
			",<tab>",
			"<CMD>Neotree toggle<CR>",
			desc = " NeoTree toggle",
			nowait = true,
			remap = false,
		},
		{
			",T",
			group = "  NeoTree: Float Window",
			nowait = true,
			remap = false,
		},
		{
			",Tb",
			"<CMD>Neotree buffers float<CR>",
			desc = " Buffers float",
			nowait = true,
			remap = false,
		},
		{
			",Tf",
			"<CMD>Neotree focus float<CR>",
			desc = " Focus float",
			nowait = true,
			remap = false,
		},
		{
			",Tg",
			"<CMD>Neotree git_status float<CR>",
			desc = " Git status float",
			nowait = true,
			remap = false,
		},
		{
			",Tr",
			"<CMD>Neotree reveal float<CR>",
			desc = " Reveal float",
			nowait = true,
			remap = false,
		},
		{
			",Tt",
			"<CMD>Neotree toggle float<CR>",
			desc = " Toggle float",
			nowait = true,
			remap = false,
		},
		{
			",d",
			group = " 󰅪 LSP / Diagnostic",
			nowait = true,
			remap = false,
		},
		{
			",d?",
			"<CMD>lua vim.diagnostic.open_float()<CR>",
			desc = "󰅪 Show float diagnostic message",
			nowait = true,
			remap = false,
		},
		{
			",dI",
			"<CMD>Telescope lsp_incoming_calls<CR>",
			desc = "󰅪 Incoming calls",
			nowait = true,
			remap = false,
		},
		{
			",dO",
			"<CMD>Telescope lsp_outgoing_calls<CR>",
			desc = "󰅪 Outgoing calls",
			nowait = true,
			remap = false,
		},
		{
			",dR",
			desc = "󰅪 Rename",
			nowait = true,
			remap = false,
		},
		{
			",dS",
			"<CMD>Telescope treesitter<CR>",
			desc = "󰅪 Treesitter symbols",
			nowait = true,
			remap = false,
		},
		{
			",dW",
			"<CMD>Telescope lsp_dynamic_workspace_symbols<CR>",
			desc = "󰅪 Dynamic Workspace symbols",
			nowait = true,
			remap = false,
		},
		{
			",da",
			"<CMD>lua vim.lsp.buf.code_action()<CR>",
			desc = "󰅪 Code actions",
			nowait = true,
			remap = false,
		},
		{
			",dd",
			"<CMD>Telescope lsp_definitions<CR>",
			desc = "󰅪 Go To Definition",
			nowait = true,
			remap = false,
		},
		{
			",df",
			"<CMD>lua require('conform').format()<CR>",
			desc = "󰅪 Format document",
			nowait = true,
			remap = false,
		},
		{
			",di",
			"<CMD>Telescope lsp_implementations<CR>",
			desc = "󰅪 Go To Implementation",
			nowait = true,
			remap = false,
		},
		{
			",dj",
			"<CMD>lua vim.diagnostic.goto_next()<CR>",
			desc = "󰅪 Go to next diagnostic",
			nowait = true,
			remap = false,
		},
		{
			",dk",
			"<CMD>lua vim.diagnostic.goto_prev()<CR>",
			desc = "󰅪 Go to previous diagnostic",
			nowait = true,
			remap = false,
		},
		{
			",dl",
			"<CMD>Telescope diagnostics<CR>",
			desc = "󰅪 List of diagnostics",
			nowait = true,
			remap = false,
		},
		{
			",dr",
			"<CMD>Telescope lsp_references<CR>",
			desc = "󰅪 Go to references",
			nowait = true,
			remap = false,
		},
		{
			",ds",
			"<CMD>Telescope lsp_document_symbols<CR>",
			desc = "󰅪 Document symbols",
			nowait = true,
			remap = false,
		},
		{
			",dt",
			"<CMD>Telescope lsp_type_definitions<CR>",
			desc = "󰅪 Type Definition",
			nowait = true,
			remap = false,
		},
		{
			",dw",
			"<CMD>Telescope lsp_workspace_symbols<CR>",
			desc = "󰅪 Workspace symbols",
			nowait = true,
			remap = false,
		},
		{
			",e",
			"<CMD>Neotree focus<CR>",
			desc = " NeoTree focus",
			nowait = true,
			remap = false,
		},
		{
			",g",
			group = " GIT",
			nowait = true,
			remap = false,
		},
		{
			",g?",
			"<CMD>Gitsigns preview_hunk_inline<CR>",
			desc = " Git: Show preview for hunk",
			nowait = true,
			remap = false,
		},
		{
			",gC",
			"<CMD>Telescope git_bcommits<CR>",
			desc = " Git: Buffer's [c]commits",
			nowait = true,
			remap = false,
		},
		{
			",gD",
			"<CMD>Gitsigns diffthis<CR>",
			desc = " Git: Show diff this",
			nowait = true,
			remap = false,
		},
		{
			",gH",
			"<CMD>Gitsigns toggle_linehl<CR>",
			desc = " Git: Toggle line highliting",
			nowait = true,
			remap = false,
		},
		{
			",gR",
			"<CMD>Gitsigns reset_buffer<CR>",
			desc = " Git: Reset buffer status",
			nowait = true,
			remap = false,
		},
		{
			",gS",
			"<CMD>Telescope git_stash<CR>",
			desc = " Git: Show [S]tash",
			nowait = true,
			remap = false,
		},
		{
			",gY",
			"<CMD>GitLink!<CR>",
			desc = " Git: Open permalink in browser",
			nowait = true,
			remap = false,
		},
		{
			",g[",
			"<CMD>Gitsigns prev_hunk<CR>",
			desc = " Git: Previous hunk",
			nowait = true,
			remap = false,
		},
		{
			",g]",
			"<CMD>Gitsigns next_hunk<CR>",
			desc = " Git: Next hunk",
			nowait = true,
			remap = false,
		},
		{
			",gA",
			"<CMD>Gitsigns stage_hunk<CR>",
			desc = " Git: Stage hunk",
			nowait = true,
			remap = false,
		},
		{
			",ga",
			"<CMD>Gitsigns stage_buffer<CR>",
			desc = " Git: Stage buffer",
			nowait = true,
			remap = false,
		},
		{
			",gb",
			"<CMD>Telescope git_branches<CR>",
			desc = " Git: [b]ranches",
			nowait = true,
			remap = false,
		},
		{
			",gc",
			"<CMD>Telescope git_commits<CR>",
			desc = " Git: [c]commits",
			nowait = true,
			remap = false,
		},
		{
			",gd",
			"<CMD>DiffviewOpen<CR>",
			desc = " Git: Diffview",
			nowait = true,
			remap = false,
		},
		{
			",gf",
			"<CMD>Telescope git_files<CR>",
			desc = " Git: find [f]iles",
			nowait = true,
			remap = false,
		},
		{
			",gg",
			"<CMD>Neogit<CR>",
			desc = " NeoGit",
			nowait = true,
			remap = false,
		},
		{
			",gh",
			"<CMD>Gitsigns toggle_deleted<CR>",
			desc = " Git: Toggle deleted lines",
			nowait = true,
			remap = false,
		},
		{
			",gl",
			"<CMD>DiffviewFileHistory<CR>",
			desc = " Git: Show Diffview File History",
			nowait = true,
			remap = false,
		},
		{
			",gr",
			"<CMD>Gitsigns reset_hunk<CR>",
			desc = " Git: Reset hunk",
			nowait = true,
			remap = false,
		},
		{
			",gs",
			"<CMD>Telescope git_status<CR>",
			desc = " Git: Show [s]tatus",
			nowait = true,
			remap = false,
		},
		{
			",gw",
			"<CMD>Gitsigns toggle_current_line_blame<CR>",
			desc = " Git: toggle current line blame",
			nowait = true,
			remap = false,
		},
		{
			",gy",
			"<CMD>GitLink<CR>",
			desc = " Git: Copy permalink to keyboard",
			nowait = true,
			remap = false,
		},
		{
			",m",
			group = "  Marks",
			nowait = true,
			remap = false,
		},
		{
			",ml",
			"<CMD>Telescope marks<CR>",
			desc = " List marks",
			nowait = true,
			remap = false,
		},
		{
			",n",
			"<CMD>set hlsearch!<CR>",
			desc = " Toggle hlsearch",
			nowait = true,
			remap = false,
		},
		{
			",t",
			group = "  NeoTree: Left Sidebar",
			nowait = true,
			remap = false,
		},
		{
			",tb",
			"<CMD>Neotree buffers left<CR>",
			desc = " Buffers",
			nowait = true,
			remap = false,
		},
		{
			",tf",
			"<CMD>Neotree focus left<CR>",
			desc = " Focus",
			nowait = true,
			remap = false,
		},
		{
			",tg",
			"<CMD>Neotree git_status left<CR>",
			desc = " Git status",
			nowait = true,
			remap = false,
		},
		{
			",tr",
			"<CMD>Neotree reveal left<CR>",
			desc = " Reveal",
			nowait = true,
			remap = false,
		},
		{
			",tt",
			"<CMD>Neotree toggle left<CR>",
			desc = " Toggle",
			nowait = true,
			remap = false,
		},
		{
			",z",
			group = " 󰰶 ZEN mode",
			nowait = true,
			remap = false,
		},
		{
			",za",
			"<CMD>TZAtaraxis<CR>",
			desc = "󰰶 Zen: Ataraxis mode",
			nowait = true,
			remap = false,
		},
		{
			",zd",
			"<CMD>Twilight<CR>",
			desc = "󰰶 Twilight: Dim code block",
			nowait = true,
			remap = false,
		},
		{
			",zf",
			"<CMD>TZFocus<CR>",
			desc = "󰰶 Zen: Focus mode",
			nowait = true,
			remap = false,
		},
		-- COMMA VISUAL
		{
			",z",
			group = " 󰰶 ZEN mode",
			mode = "v",
			nowait = true,
			remap = false,
		},
		{
			",zn",
			"<CMD>'<,'>TZNarrow<CR>",
			desc = "󰰶 Zen: Narrow mode",
			mode = "v",
			nowait = true,
			remap = false,
		},
		-- BACKSLASH
		{
			"\\D",
			"<CMD>bdelete<CR>",
			desc = " Close buffer",
			nowait = true,
			remap = false,
			mode = { "n", "v" },
		},
		{
			"\\q",
			"<CMD>qa!<CR>",
			desc = " Force Quit",
			nowait = true,
			remap = false,
			mode = { "n", "v" },
		},
		{
			"\\t",
			group = "Terminal",
			desc = "  Terminal",
			nowait = true,
			remap = false,
			mode = { "n", "v" },
		},
		{
			"\\tf",
			"<cmd>lua require('core.utils').ext_terminal('buffer')<CR>",
			desc = " Open terminal tab in buffer directory",
			nowait = true,
			remap = false,
			mode = { "n", "v" },
		},
		{
			"\\ts",
			"<cmd>lua require('core.utils').ext_terminal('buffer', 'window')<CR>",
			desc = " Open terminal split in buffer directory",
			nowait = true,
			remap = false,
			mode = { "n", "v" },
		},
		{
			"\\tt",
			"<cmd>lua require('core.utils').ext_terminal()<CR>",
			desc = " Open terminal tab in current root directory",
			nowait = true,
			remap = false,
			mode = { "n", "v" },
		},
		{
			"\\tw",
			"<cmd>lua require('core.utils').ext_terminal(nil, 'window')<CR>",
			desc = " Open terminal split in root directory",
			nowait = true,
			remap = false,
			mode = { "n", "v" },
		},
	},
}

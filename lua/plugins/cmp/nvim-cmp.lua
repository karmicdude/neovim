return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{ "L3MON4D3/LuaSnip" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-path" },
		{ "lukas-reineke/cmp-rg" },
		{ "mtoohey31/cmp-fish", ft = "fish" },
		{ "onsails/lspkind.nvim" },
		{ "saadparwaiz1/cmp_luasnip" },
		{
			"zbirenbaum/copilot-cmp",
			after = { "copilot.lua" },
			config = function()
				require("copilot_cmp").setup()
			end,
		},
	},
	init = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		local menu_items = {
			copilot = "[COP]",
			nvim_lsp = "[LSP]",
			luasnip = "[Snip]",
			buffer = "[Buff]",
			path = "[Path]",
			dictionary = "[Dict]",
			spell = "[Spell]",
			rg = "[RG]",
		}
		cmp.setup({
			formatting = {
				expandable_indicator = true,
				fields = { "kind", "abbr", "menu" },
				format = lspkind.cmp_format({
					mode = "symbol",
					maxwidth = 60,
					symbol_map = { Copilot = "" },
					ellipsis_char = "...",
					preset = "codicons",
					before = function(entry, vim_item)
						vim_item.menu = menu_items[entry.source.name]
						vim_item.dup = 0
						return vim_item
					end,
				}),
			},
			completion = {
				completeopt = "menu,menuone,preview,noselect",
				keyword_length = 2,
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["C-tab>"] = cmp.mapping.select_prev_item(),
				["<tab>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(-4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "copilot", keyword_length = 2, group_index = 2 },
				{ name = "dictionary", keyword_length = 2 },
				{ name = "nvim_lsp", keyword_length = 2 },
				{ name = "luasnip", keyword_length = 2 },
				{ name = "buffer", keyword_length = 3 },
				{ name = "rg", keyword_length = 3, dup = 0 },
				{ name = "path" },
				{ name = "fish" },
			}),
		})
	end,
}

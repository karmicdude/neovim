local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
-- local extras = require("luasnip.extras")
-- local rep = extras.rep
-- local t = ls.text_node
-- local c = ls.choice_node
-- local f = ls.function_node
-- local d = ls.dynamic_node
-- local sn = ls.snippet_node

ls.add_snippets("all", {
	s(
		"!prettier-ignore-block",
		fmt(
			[[
      <!-- prettier-ignore-start -->
      {}
      <!-- prettier-ignore-end -->
      ]],
			{
				i(1),
			}
		)
	),
})

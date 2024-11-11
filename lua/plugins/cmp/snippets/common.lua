local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

function _G.expand_snippet_by_name(trigger, filetype)
	local snippets = require("luasnip").get_snippets(filetype)
	for _, snip in ipairs(snippets) do
		if snip.trigger == trigger then
			require("luasnip").snip_expand(snip)
			return
		end
	end
end

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

ls.add_snippets("javascript", {
	s("clog", {
		t("console.log("),
		f(function()
			local yank = vim.fn.getreg('"')
			if yank == nil then
				return ""
			end
			yank = yank:gsub("^%s*(.-)%s*$", "%1") -- trim newline char
			return yank
		end),
		t(");"),
	}),
})

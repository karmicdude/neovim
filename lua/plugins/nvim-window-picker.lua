return {
  "s1n7ax/nvim-window-picker",
  name = "window-picker",
  event = "VeryLazy",
  version = "2.*",
  opts = {
    hint = "floating-big-letter",
    show_prompt = false,
    filter_rules = {
      include_current_win = false,
      autoselect_one = true,
    },
    bo = {
      -- ignore by filetype and buftype
      filetype = { "neo-tree", "neo-tree-popup", "notify" },
      buftype = { "terminal", "quickfix" },
    },
    highlights = {
      statusline = {
        unfocused = {
          fg = "#12006b",
          bg = "#4dff00",
          bold = true,
        },
      },
    },
  },
}

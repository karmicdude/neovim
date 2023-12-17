return {
  "mvllow/modes.nvim",
  version = false,
  event = "BufReadPost",
  opts = {
    line_opacity = 0.25,
    set_cursor = true,
    set_cursorline = true,
    set_number = false,
    ignore_filetypes = { "neo-tree", "TelescopePrompt" },
  },
}

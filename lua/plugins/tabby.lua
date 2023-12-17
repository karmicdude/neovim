return {
  "nanozuki/tabby.nvim",
  lazy = false,
  init = function()
    local theme = {
      fill = { fg = "#f2e9de", style = "italic" },
      head = "TabLine",
      current_tab = { fg = "#F8FBF6", bg = "#333351", style = "italic" },
      tab = "TabLine",
      win = "TabLine",
      tail = "TabLine",
    }

    require("tabby.tabline").set(function(line)
      return {
        {
          { "  ", hl = theme.head },
          line.sep("", theme.head, theme.fill),
        },
        line.tabs().foreach(function(tab)
          local hl = tab.is_current() and theme.current_tab or theme.tab
          return {
            line.sep("", hl, theme.fill),
            tab.is_current() and "" or "",
            tab.name(),
            tab.close_btn(""),
            line.sep("", hl, theme.fill),
            hl = hl,
            margin = " ",
          }
        end),
        line.spacer(),
        line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
          if string.find(win.buf_name(), "neo-tree", 1, true) then
            return ""
          end
          if win.buf().type == "nofile" then
            return ""
          end
          return {
            line.sep("", theme.win, theme.fill),
            win.is_current() and "" or "",
            win.file_icon(),
            win.buf_name(),
            line.sep("", theme.win, theme.fill),
            hl = theme.win,
            margin = " ",
          }
        end),
        {
          line.sep("", theme.tail, theme.fill),
          { "  ", hl = theme.tail },
        },
        hl = theme.fill,
      }
    end)
  end,
}

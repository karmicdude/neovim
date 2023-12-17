return {
  "echasnovski/mini.indentscope",
  event = "VeryLazy",
  version = false,
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      desc = "Disable indentscope for certain filetypes",
      pattern = {
        "lazy",
        "neo-tree",
        "neo-tree-popup",
        "notify",
      },
      callback = function(event)
        vim.b[event.buf].miniindentscope_disable = true
      end,
    })

    require("mini.indentscope").setup({
      symbol = "╏",
      draw = {
        delay = 200,
        animation = require("mini.indentscope").gen_animation.none(),
      },
    })
  end,
}

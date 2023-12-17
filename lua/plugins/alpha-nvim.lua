return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  init = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
      [[                                                     ]],
      [[  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
      [[  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
      [[  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
      [[  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
      [[  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
      [[  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
      [[                                                     ]],
    }
    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", " New File", "<cmd>ene<CR>"),
      dashboard.button("r", " Recent", ":Telescope oldfiles<CR>"),
      dashboard.button("f", "󰱼 Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("l", "󰒲 Lazy", "<cmd>Lazy<CR>"),
      dashboard.button("q", " Quit NVIM", "<cmd>qa<CR>"),
    }

    alpha.setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = { "AlphaReady" },
      callback = function(event)
        vim.opt_local.listchars = {}
        vim.opt_local.colorcolumn = {}
        vim.opt_local.number = false
        vim.opt_local.showtabline = 0
        vim.b[event.buf].miniindentscope_disable = true
      end,
    })

    vim.api.nvim_create_autocmd("BufUnload", {
      pattern = { "<buffer>" },
      callback = function()
        vim.opt_local.showtabline = 2
      end,
    })
  end,
}

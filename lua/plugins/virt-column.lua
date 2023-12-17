return {
  "lukas-reineke/virt-column.nvim",
  event = "BufReadPost",
  opts = {
    char = "▎",
    highlight = { "VirtColumnColor" },
    exclude = {
      filetypes = {
        "neo-tree",
        "help",
        "text",
        "mason",
        "lazy",
      },
    },
  },
}

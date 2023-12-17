local tools = {}

local formatters = {
  "jsonnetfmt",
  "prettier",
  "shfmt",
  "stylua",
}

local linters = {
  "actionlint",
  "ansible-lint",
  "editorconfig-checker",
  "gitlint",
  "jsonlint",
  "luacheck",
  "markdownlint",
  "rstcheck",
  "shellcheck",
  "tflint",
  "yamllint",
}

vim.list_extend(tools, formatters)
vim.list_extend(tools, linters)

return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  event = "VeryLazy",
  opts = {
    ensure_installed = tools,
    auto_update = false,
    run_on_start = true,
    start_delay = 5000,
    debounce_hours = 3,
  },
}

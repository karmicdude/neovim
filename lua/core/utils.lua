local M = {}

---@param name string Autocmd group name
---@param clear boolean | nil
M.autocmd_group = function(name, clear)
  clear = clear or true
  return vim.api.nvim_create_augroup("user_" .. name, { clear = clear })
end

return M

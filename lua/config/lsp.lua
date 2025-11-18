local M = {}

M.servers = {
  'lua_ls',
  'clangd',
  'neocmake',
}

M.formatters = {
  lua = { 'stylua' },
}

return M

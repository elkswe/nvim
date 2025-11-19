local M = {}

M.servers = {
  'lua_ls',
  'clangd',
  'neocmake',
  'powershell_es',
  'bashls',
}

M.formatters = {
  lua = { 'stylua' },
}

return M

local M = {}

M.servers = {
  'lua_ls',
  'clangd',
  'neocmake',
  'powershell_es',
  'bashls',
  'basedpyright',
}

-- TODO: Create one table for formatters that describes both:
-- - mason install target(s)
-- - list of commands to execute by conform.nvim
-- NOTE: May be look for LazyVim good solutions

M.formatters_to_install = {
  'stylua',
  'ruff',
}

M.formatters_commands = {
  lua = { 'stylua' },
  python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
}

return M

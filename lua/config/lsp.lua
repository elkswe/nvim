local M = {}

M.servers = {
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        -- diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
  clangd = {},
  neocmake = {},
}

M.formatters = {
  lua = { 'stylua' },
}

return M

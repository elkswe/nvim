---@module "lazy"
---@type LazySpec
return {
  'mason-org/mason-lspconfig.nvim',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'neovim/nvim-lspconfig',

    -- Extensible UI for Neovim notifications and LSP progress messages
    { 'j-hui/fidget.nvim', opts = {} },

    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    {
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {
        library = {
          -- Load luvit types when the `vim.uv` word is found
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        },
      },
    },
  },
  config = function()
    local lsp_config = require 'config.lsp'

    local mason_servers = lsp_config.servers or {}
    local mason_formatters = lsp_config.formatters_to_install or {}
    local mason_linters = lsp_config.linters_to_install or {}

    local mason_tools_to_install = {}
    vim.list_extend(mason_tools_to_install, mason_formatters)
    vim.list_extend(mason_tools_to_install, mason_linters)

    require('mason-tool-installer').setup {
      ensure_installed = mason_tools_to_install,
    }

    local mason_lsp_to_install = {}
    vim.list_extend(mason_lsp_to_install, mason_servers)

    ---@module 'mason-lspconfig'
    ---@type MasonLspconfigSettings
    local opts = {
      ensure_installed = mason_lsp_to_install,
      automatic_enable = true,
    }

    require('mason-lspconfig').setup(opts)
  end,
}

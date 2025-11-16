---@module "lazy"
---@type LazySpec
return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    ---@module 'catppuccin'
    ---@type CatppuccinOptions
    local opts = {
      styles = {
        comments = {},
      },
      auto_integrations = true,
    }

    require('catppuccin').setup(opts)

    vim.cmd 'colorscheme catppuccin'
  end,
}

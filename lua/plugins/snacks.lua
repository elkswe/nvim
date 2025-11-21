---@module "lazy"
---@type LazySpec
return {
  'folke/snacks.nvim',
  ---@module 'snacks'
  ---@type snacks.Config
  opts = {
    ---@type snacks.indent.Config
    indent = {
      ---@type snacks.indent.animate
      animate = {
        enabled = false,
      },
    },
  },
}

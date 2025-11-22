---@module "lazy"
---@type LazySpec
return {
  'nvzone/showkeys',
  cmd = 'ShowkeysToggle',
  opts = {
    timeout = 1,
    maxkeys = 5,
    show_count = true,
    excluded_modes = { 'i' },
    position = 'top-right',
  },
}

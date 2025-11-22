---@module "lazy"
---@type LazySpec
return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons', -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    keys = {
      { '\\', ':Neotree reveal<CR>', desc = 'Explorer Open', silent = true },
      { '|', ':Neotree action=show toggle<CR>', desc = 'Explorer Toggle', silent = true },
    },
    ---@module 'neo-tree'
    ---@type neotree.Config.Base
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      sources = {
        'filesystem',
        'buffers',
        'git_status',
        'document_symbols',
      },
      default_source = 'last', -- you can choose a specific source `last` here which indicates the last used source

      popup_border_style = 'rounded',

      source_selector = {
        winbar = true,
        truncation_character = '…',
        sources = {
          { source = 'filesystem' },
          { source = 'buffers' },
          { source = 'git_status' },
          { source = 'document_symbols' },
        },
      },

      commands = {
        move_focus_to_prev = function()
          local keys = vim.api.nvim_replace_termcodes('<C-w>p', false, false, true)
          vim.api.nvim_feedkeys(keys, 't', false)
        end,
      },

      window = {
        position = 'left', -- default
        width = 50,
        mappings = {
          ['Z'] = 'expand_all_subnodes',
          ['a'] = {
            'add',
            config = {
              show_path = 'relative',
            },
          },
          ['c'] = {
            'copy',
            config = {
              show_path = 'relative',
            },
          },
          ['\\'] = 'move_focus_to_prev',
        },
      },

      filesystem = {
        window = {
          mappings = {
            ['/'] = 'filter_as_you_type', -- this was the default until v1.28
          },
        },
        follow_current_file = {
          enabled = true,
        },
        use_libuv_file_watcher = true,
      },

      buffers = {
        follow_current_file = {
          enabled = true,
        },
      },

      document_symbols = {
        window = {
          mappings = {
            -- NOTE: Disable keymaps due to warnings
            ['a'] = 'noop',
            ['c'] = 'noop',
            ['<C-r>'] = {},
          },
        },
      },
    },
  },
  {
    'antosha417/nvim-lsp-file-operations',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-neo-tree/neo-tree.nvim', -- makes sure that this loads after Neo-tree.
    },
    config = function()
      require('lsp-file-operations').setup()
    end,
  },
}

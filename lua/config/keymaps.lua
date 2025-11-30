-- [[ From Kickstart ]]

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Telescope ]]
-- See `:help telescope.builtin`

local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', function()
  builtin.builtin { include_extensions = true }
end, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>s/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })

local telescope_lazy = require('telescope').extensions.lazy
vim.keymap.set('n', '<leader>l', telescope_lazy.lazy, { desc = '[L]azy Plugins Browser' })

-- [[ Neo-Tree ]]
vim.keymap.set('n', '<leader>ef', '<cmd>Neotree filesystem<CR>', { desc = 'Open [F]ilesystem' })
vim.keymap.set('n', '<leader>eb', '<cmd>Neotree buffers<CR>', { desc = 'Open [B]uffers' })
vim.keymap.set('n', '<leader>eg', '<cmd>Neotree git_status<CR>', { desc = 'Open [G]it Status' })
vim.keymap.set('n', '<leader>es', '<cmd>Neotree document_symbols<CR>', { desc = 'Open Document [S]ymbols' })

vim.keymap.set('n', '<leader>epl', '<cmd>Neotree position=left<CR>', { desc = '[L]eft' })
vim.keymap.set('n', '<leader>ept', '<cmd>Neotree position=top<CR>', { desc = '[T]op' })
vim.keymap.set('n', '<leader>epr', '<cmd>Neotree position=right<CR>', { desc = '[R]ight' })
vim.keymap.set('n', '<leader>epb', '<cmd>Neotree position=bottom<CR>', { desc = '[B]ottom' })
vim.keymap.set('n', '<leader>epf', '<cmd>Neotree position=float<CR>', { desc = '[F]loat' })
vim.keymap.set('n', '<leader>epc', '<cmd>Neotree position=current<CR>', { desc = '[C]urrent' })

-- [[ Which Key ]]
-- See `:help which-key.nvim-which-key-mappings`

local wk = require 'which-key'
wk.add {
  { '<leader>s', group = '[S]earch', icon = '' },
  { '<leader>t', group = '[T]oggle', icon = '' },
  { '<leader>e', group = '[E]xplorer', icon = '󰥨' },
  { '<leader>ep', group = '[P]osition', icon = '' },
  { '<leader>h', group = 'Git [H]unk', icon = '󰊢', mode = { 'n', 'v' } },
}

-- [[ GitSigns ]]
-- See `plugins.gitsigns.lua` for installed keymaps

-- [[ Autoformat ]]
vim.keymap.set('n', '<leader>f', function()
  require('conform').format { async = true }
end, { desc = '[F]ormat buffer' })

-- [[ Terminal ]]
local shell_cmd = vim.fn.has 'win32' == 1 and 'pwsh -NoLogo' or 'bash --login'

vim.keymap.set('n', '<leader>z', function()
  vim.cmd('horizontal botright terminal ' .. shell_cmd)
  vim.cmd('resize ' .. vim.o.lines / 3)
end, { desc = '[z] Open Terminal (Bottom)' })

vim.keymap.set('n', '<leader>Z', function()
  vim.cmd('vertical botright terminal ' .. shell_cmd)
  vim.cmd('vertical resize ' .. vim.o.columns / 3)
end, { desc = '[Z] Open Terminal (Right)' })

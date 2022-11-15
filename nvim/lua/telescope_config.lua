function TelescopeConfigs()
  require('telescope.builtin').find_files {
    prompt_title = 'Config files',
    results_title = 'Config Files Results',
    path_display = { 'smart', 'shorten' },
    search_dirs = {
      '~/.config/nvim',
      '~/.zshrc',
    }
  }
end

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
--keymap('n', '<Leader>pp', '<CMD>lua require('telescope.builtin').builtin()<CR>', opts)
keymap('n', '<leader>b', '<cmd>Telescope buffers<cr>', opts)
keymap('n', '<leader>cf', ':lua TelescopeConfigs()<cr>', opts)
keymap('n', '<leader>m', '<cmd>Telescope oldfiles<cr>', opts)
keymap('n', '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', opts)
keymap('n', '<leader>gf', '<cmd>Telescope git_files<cr>', opts)
keymap('n', '<leader>pf', '<cmd>Telescope find_files<cr>', opts)
keymap('n', '<leader>rg', '<cmd>Telescope live_grep<cr>', opts)
keymap('n', '<leader>vh', '<cmd>Telescope help_tags<cr>', opts)


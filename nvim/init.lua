local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
-- basic settings
vim.opt.syntax="on"
vim.opt.lazyredraw=true
vim.opt.swapfile=false
vim.opt.backup=false
vim.opt.ignorecase=true
vim.opt.smartcase=true
vim.opt.wildmenu=true
vim.opt.wildmode="list:longest,full"
vim.opt.synmaxcol= 128
vim.opt.number= true
vim.opt.relativenumber= true
vim.opt.incsearch= true
vim.opt.visualbell= true
vim.opt.expandtab= true
vim.opt.ruler= true
vim.opt.smartindent= true
vim.opt.wrap=false
vim.opt.scrolloff=8
vim.opt.hlsearch=false
vim.opt.virtualedit="all"
vim.opt.backspace=indent,eol,start
vim.opt.autoindent=true
vim.opt.mouse="a"
vim.opt.colorcolumn="80"
vim.opt.signcolumn="yes"

vim.g.mapleader = " "

keymap('i', 'jk', '<ESC>', opts)
keymap('n', '<leader>ve', '<cmd>e ~/.config/nvim/init.lua<Cr>', opts)

require('plugins')
require('nvim-lsp-installer').setup{}
require('telescope').setup({
    defaults = {
      layout_strategy = 'horizontal',
      layout_config = {
        height = 0.80,
        width = 0.95,
        prompt_position = 'top',
      },
      sorting_strategy = 'ascending',
      path_display = {"shorten"},
    }
  })
require('lsp')
require('telescope_config')
require('treesitter')
require('cmp_config')
require('diffviewtest')
require('nvim-tree').setup()

keymap('n', '<leader>dv', '<cmd>DiffviewOpen<Cr>', opts)
keymap('n', '<leader>vd', '<cmd>DiffviewClose<Cr>', opts)
--require("diffview").setup{}
vim.cmd('source ' .. '$HOME/.config/nvim/plug-config/signify.vim')

vim.g.gruvbox_baby_function_style = "NONE"

vim.g.gruvbox_baby_telescope_theme = 1
vim.g.gruvbox_baby_transparent_mode = 0

vim.cmd([[
colorscheme gruvbox-baby
hi Comment cterm=italic gui=italic
]])

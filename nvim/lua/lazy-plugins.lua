local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'sheerun/vim-polyglot',
  'nvim-tree/nvim-tree.lua',

  {'luisiacc/gruvbox-baby', branch = 'main'},

  'nvim-lua/plenary.nvim',
  'nvim-lua/popup.nvim',
  'nvim-telescope/telescope.nvim',

  'jiangmiao/auto-pairs',
  'tpope/vim-surround',

  {'numToStr/Comment.nvim'},

  'ThePrimeagen/harpoon',

  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'junegunn/gv.vim',
  { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },

  {'zbirenbaum/copilot.lua'},

  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-ui',

  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',

  -- 'williamboman/nvim-lsp-installer',

  'neovim/nvim-lspconfig',
  'saadparwaiz1/cmp_luasnip',
  'L3MON4D3/LuaSnip',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-path',
  'onsails/lspkind.nvim',
  'glepnir/lspsaga.nvim',


  'quangnguyen30192/cmp-nvim-tags',

  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
  {'nvim-treesitter/nvim-treesitter-textobjects'},

  'folke/zen-mode.nvim',

  'mfussenegger/nvim-jdtls',
})

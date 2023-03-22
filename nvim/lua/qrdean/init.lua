require("qrdean.set")
require("qrdean.remap")
require("lazy-plugins")
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
require("mason").setup()
require("mason-lspconfig").setup()

vim.g.gruvbox_baby_function_style = "NONE"

vim.g.gruvbox_baby_telescope_theme = 1
vim.g.gruvbox_baby_transparent_mode = 0

vim.cmd([[
colorscheme gruvbox-baby
hi Comment cterm=italic gui=italic
]])


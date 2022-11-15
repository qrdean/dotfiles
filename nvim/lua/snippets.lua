local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

ls.configure.set_config({
  enable_autosnippets = true
})

ls.add_snippets("groovy", {
    s("gtrigger", {
      t("groovy trigger")
    }),
  s("fn", {
      t("def "),
      i(1, "myFunc"),
      t("("),
      i(2),
      t(")"),
      t({" {", "\t" }),
      i(0),
      t({"", "}"}),
    }),
  s("cc", {
      i(1, "myObject"),
      t(".createCriteria()"),
      c(2, {
          t(".list()"),
          t(".get")
      }),
      t({" {", "\t"}),
      i(0),
      t({"", "}"}),
    }),
  s("fori", {
      t("for(def "),
      i(1, "i"),
      t("=0;"),
      i(2, "i < 10"),
      t(";"),
      i(3, "i"),
      t({"++) {", "\t"}),
      i(0),
      t({"", "}"}),
    })
  })

keymap('i', '<silent> <S-Tab>', '<cmd>lua require("luasnip").jump(-1)<Cr>', {})

keymap('s', '<silent> <Tab>', '<cmd>lua require("luasnip").jump(1)<Cr>', opts)
keymap('s', '<silent> <S-Tab>', '<cmd>lua require("luasnip").jump(-1)<Cr>', opts)

keymap('i', '<C-j>', "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'", { silent = true, expr = true })
keymap('s', '<C-j>', "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'", { silent = true, expr = true })
keymap('i', '<C-k>', "luasnip#choice_active() ? '<Plug>luasnip-prev-choice' : '<C-E>'", { silent = true, expr = true })
keymap('s', '<C-k>', "luasnip#choice_active() ? '<Plug>luasnip-prev-choice' : '<C-E>'", { silent = true, expr = true })

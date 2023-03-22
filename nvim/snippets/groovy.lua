local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

ls.config.setup({
  enable_autosnippets = true
})

-- Groovy Snippets
ls.add_snippets("groovy", {
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
    }),
    s("redirect", {
      t("redirect(action: "),
      i(1, "actionName"),
      t(")")
    }),

    -- GORM
    s("resultTransformer", {
      t("resultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP)"),
    }),
    s("projections", {
      t({"projections {", "\t"}),
      i(0),
      t({"", "}"})
    }),

    s("new class", {
        t("class "),
        i(1, "controllerName"),
        c(2, {
            t({ "Controller {", "\t" }),
            t({ "Service {", "\t" }),
            t({ "Domain {", "\t" }),
        }),
        t({ "def index = {", "\t" }),
        i(0),
        t({ "}", "\t" }),
        t({ "", "}" })
    })
  })

ls.add_snippets("gsp", {
    s("link", {
        t("<g:link action=\""),
        i(1, "actionName"),
        t("\""),
        t(" controller=\""),
        i(2, "controllerName"),
        t("\""),
        t(" id=\""),
        i(3, "id"),
        t("\""),
        t(">"),
        t(" </g:link>"),
    }),

    s("checkBox", {
        t("<g:checkBox name=\""),
        i(1, "name"),
        t("\""),
        t(" value=\""),
        i(2, "true"),
        t("\""),
        t("/>"),
    }),

    s("gset", {
        t("<g:set var=\""),
        i(1, "varName"),
        t("\""),
        t(" value=\"${"),
        i(2, "valueName"),
        t("}\""),
        t("/>"),
    }),


})

keymap('i', '<silent> <S-Tab>', '<cmd>lua require("luasnip").jump(-1)<Cr>', {})

keymap('s', '<silent> <Tab>', '<cmd>lua require("luasnip").jump(1)<Cr>', opts)
keymap('s', '<silent> <S-Tab>', '<cmd>lua require("luasnip").jump(-1)<Cr>', opts)

keymap('i', '<C-j>', "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'", { silent = true, expr = true })
keymap('s', '<C-j>', "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'", { silent = true, expr = true })
keymap('i', '<C-k>', "luasnip#choice_active() ? '<Plug>luasnip-prev-choice' : '<C-E>'", { silent = true, expr = true })
keymap('s', '<C-k>', "luasnip#choice_active() ? '<Plug>luasnip-prev-choice' : '<C-E>'", { silent = true, expr = true })

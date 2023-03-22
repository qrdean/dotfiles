local parser_config=require"nvim-treesitter.parsers".get_parser_configs()
parser_config.groovy = {
  install_info = {
    url = "~/Projects/tree-sitter-groovy",
    files = {"src/parser.c"},
    branch = "main",
    generate_requires_npm = false,
    requires_generate_from_grammar = false,
  },
  filetype = "groovy",
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"python", "bash", "javascript", "go", "java", "typescript", "lua", "rust", "groovy"},

  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    }
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@functional.outer",
        ["if"] = "@functional.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["as"] = "@statement.outer",
        ["is"] = "@statement.inner",
      }
    }
  }
}


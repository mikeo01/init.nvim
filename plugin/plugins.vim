lua <<EOF
  require("early-retirement").setup({
    retirementAgeMins = 10,
    minimumBufferNum = 6 -- allow me to work on multiple files on split view
  })
  require('which-key').setup()
  require("marks").setup()
  require("gitsigns").setup()
  require('mini.indentscope').setup({
    draw = { delay = 200 },
    options = { try_as_border = true },
    symbol = '│'
  })
  require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
  }

  -- Treesitter
  require("nvim-treesitter.configs").setup({
    -- Ensure these are installed at all times
    ensure_installed = { "typescript", "vue", "php", "clojure" },

    -- Automatically install parsers
    auto_install = true,
  })

  require('lualine').setup {
    options = {
      theme = 'codedark',
      component_separators = '',
      section_separators = { left = '', right = '' },
    },
  }
EOF

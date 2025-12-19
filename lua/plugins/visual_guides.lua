-- Visual guides and enhanced indentation
return {
  -- Animated indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = "BufRead",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
        highlight = "IblIndent",
      },
      whitespace = {
        highlight = "IblWhitespace",
        remove_blankline_trail = true,
      },
      scope = {
        enabled = true,
        char = "▎",
        show_start = true,
        show_end = true,
        highlight = "IblScope",
      },
      exclude = {
        filetypes = {
          "lspinfo",
          "packer",
          "checkhealth",
          "help",
          "man",
          "gitcommit",
          "TelescopePrompt",
          "TelescopeResults",
          "neo-tree",
          "lazy",
        },
        buftypes = {
          "terminal",
          "nofile",
          "quickfix",
          "prompt",
        },
      },
    },
  },

  -- Visual column indicator (code quality guide at 120 chars)
  {
    "Bekaboo/deadcolumn.nvim",
    lazy = true,
    event = "BufRead",
    config = function()
      require("deadcolumn").setup({
        threshold = 1,
        blending = {
          colorcode = "#544a6b",
          ctermfg = 59,
          blend = 50,
        },
        warning = {
          colorcode = "#8b5a3c",
          ctermfg = 95,
          blend = 50,
        },
        range = { 80, 120 },
      })
    end,
  },
}

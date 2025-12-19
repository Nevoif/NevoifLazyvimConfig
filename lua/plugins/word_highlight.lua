-- Word highlighting and context awareness
return {
  -- Highlight word under cursor and auto-highlight matches
  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    config = function()
      require("illuminate").configure({
        providers = {
          "lsp",
          "treesitter",
          "regex",
        },
        delay = 100,
        filetypes_denylist = {
          "dirbuf",
          "dirvish",
          "fugitive",
          "neo-tree",
          "prompt",
          "TelescopePrompt",
        },
        max_file_lines = nil,
        min_count_to_highlight = 1,
      })
    end,
  },

  -- Sticky header showing current function/class context
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("treesitter-context").setup({
        enable = true,
        max_lines = 0,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 20,
        trim_scope = "outer",
        mode = "cursor",
        separator = nil,
        zindex = 20,
      })
    end,
  },
}

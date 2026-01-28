-- Word highlighting and context awareness
-- Snacks.nvim 'words' feature replaces vim-illuminate
return {
  -- Sticky header showing current function/class context
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = true,
    event = "BufRead",
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

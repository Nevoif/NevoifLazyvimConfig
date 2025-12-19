return {
  {
    "stevearc/aerial.nvim",
    lazy = true,
    cmd = { "AerialToggle", "AerialOpen" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    keys = {
      { "<leader>ce", "<cmd>AerialToggle<cr>", desc = "Code Structure" },
    },
    opts = {
      layout = {
        default_direction = "prefer_right",
        max_width = { 50, 0.2 },
        min_width = 30,
      },
      filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Method",
        "Struct",
        "Property",
      },
      highlight_mode = "last",
      close_on_select = true,

      guides = {
        mid_item = "├ ",
        last_item = "└ ",
        nested_top = "│ ",
        whitespace = "  ",
      },
    },
  },
}

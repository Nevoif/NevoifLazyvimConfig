return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Trouble: Toggle Diagnostics" },
      { "<leader>xw", "<cmd>Trouble workspace_diagnostics<CR>", desc = "Trouble: Workspace Diagnostics" },
      { "<leader>xl", "<cmd>Trouble loclist<CR>", desc = "Trouble: Location List" },
      { "<leader>xq", "<cmd>Trouble quickfix<CR>", desc = "Trouble: Quickfix List" },
    },
    config = function()
      require("trouble").setup({})
    end,
  },
}

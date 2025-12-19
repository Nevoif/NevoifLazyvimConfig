return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<leader>`", "<cmd>ToggleTerm<CR>", desc = "Terminal: Toggle" },
    },
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<leader>`]],
        direction = "horizontal",
        autochdir = true,
      })
    end,
  },
}

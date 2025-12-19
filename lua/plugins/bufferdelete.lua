return {
  "famiu/bufdelete.nvim",
  cmd = { "Bdelete", "Bwipeout" },
  keys = {
    {
      "<leader>x",
      "<cmd>Bdelete<cr>",
      desc = "Delete buffer (keep layout)",
    },
  },
}

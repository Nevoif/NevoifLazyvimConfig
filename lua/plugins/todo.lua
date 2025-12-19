return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>xt",
        "<cmd>TodoTrouble<CR>",
        desc = "Todo: Toggle Trouble",
      },
    },
    config = function()
      require("todo-comments").setup({
        keywords = {
          FIX = { icon = "🐛", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
          TODO = { icon = "✔️", color = "info" },
          HACK = { icon = "🔨", color = "warning" },
          WARN = { icon = "⚠️", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = "⚡", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = "📝", color = "hint", alt = { "INFO" } },
        },
      })
    end,
  },
}

return {
  {
    "kosayoda/nvim-lightbulb",
    lazy = true,
    event = "LspAttach",
    dependencies = { "antoinemadec/FixCursorHold.nvim" },
    config = function()
      require("nvim-lightbulb").setup({ autocmd = { enabled = true } })
    end,
  },
}

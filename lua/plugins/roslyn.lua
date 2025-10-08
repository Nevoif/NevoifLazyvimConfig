return {
  {
    "seblyng/roslyn.nvim",
    ft = { "cs" },
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("roslyn").setup({
        enable_import_completion = true,
        use_lsp = true,
      })
    end,
  },
}
-- there is a initiation delay so maybe omnisharp was a better option but incase i need to work on blazor or something i can use this
-- also omnisharp is kinda slow and laggy sometimes
-- also roslyn is more lightweight and faster (they say so)
-- also roslyn has better code completion and refactoring tools
-- also roslyn is more modern and actively maintained



return {
  {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function()
      require("noice").setup({
        lsp = {
          progress = {
            enabled = false,  -- disable LSP progress to stop token errors
          },
          -- optionally keep other LSP features
          hover = { enabled = true },
          signature = { enabled = true },
        },
      })
    end,
  },
}

-- i love this plugin so much it makes lazyvim visually appealing.
-- also it fixes the annoying lsp progress token errors.
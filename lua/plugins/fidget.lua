-- LSP progress indicator with subtle animations
return {
  {
    "j-hui/fidget.nvim",
    lazy = true,
    event = "LspAttach",
    opts = {
      progress = {
        poll_rate = 100,
        suppress_on_insert = true,
      },
      notification = {
        poll_rate = 100,
        window = {
          normal_hl = "Comment",
          winblend = 100,
          border = "rounded",
        },
      },
    },
  },
}

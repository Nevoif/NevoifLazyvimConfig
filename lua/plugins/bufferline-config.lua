return {
  {
    "akinsho/bufferline.nvim",
    lazy = true,
    keys = {
      { "[b", "<cmd>BufferLineCyclePrev<CR>", desc = "Buffer: Previous" },
      { "]b", "<cmd>BufferLineCycleNext<CR>", desc = "Buffer: Next" },
    },
  },
}

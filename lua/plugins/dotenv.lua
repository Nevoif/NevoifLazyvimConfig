return {
  {
    "tpope/vim-dotenv",
    lazy = true,
    event = "VeryLazy",
    config = function()
      -- Automatically load .env files from project root
      -- This allows dadbod and other tools to access environment variables
      vim.cmd("Dotenv")
    end,
  },
}

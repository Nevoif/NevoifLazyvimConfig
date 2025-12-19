return {
  {
    "GustavEikaas/easy-dotnet.nvim",
    lazy = true,
    ft = "cs",
    ft = { "cs", "csproj", "sln" },
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      require("easy-dotnet").setup({
        lsp = {
          enabled = false, -- Avoid conflicts with Roslyn LSP
        },
        test_runner = {
          viewmode = "float",
          enable_buffer_test_execution = true,
        },
      })
    end,
    keys = {
      {
        "<leader>B",
        function()
          require("easy-dotnet").build_quickfix()
        end,
        desc = "Dotnet: Build Project",
      },
      {
        "<leader>dr",
        function()
          require("easy-dotnet").run()
        end,
        desc = "Dotnet: Run Project",
      },
      {
        "<leader>ds",
        function()
          require("easy-dotnet").secrets()
        end,
        desc = "Dotnet: User Secrets",
      },
    },
  },
}

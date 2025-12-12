return {
  {
    "GustavEikaas/easy-dotnet.nvim",
    ft = { "cs", "csproj", "sln" },
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      require("easy-dotnet").setup({
        cmd = "dotnet-easydotnet",
        lsp = {
          enabled = false, -- Conflict prevention
        },
        test_runner = {
          viewmode = "float",
          enable_buffer_test_execution = true,
        },
      })
    end,
    keys = {
      { "<leader>B",  function() require("easy-dotnet").build_quickfix() end, desc = "Dotnet Build (Quickfix)" },
      { "<leader>dr", function() require("easy-dotnet").run() end,            desc = "Dotnet Run" },
      { "<leader>ds", function() require("easy-dotnet").secrets() end,        desc = "Dotnet Secrets" },
    },
  },
}

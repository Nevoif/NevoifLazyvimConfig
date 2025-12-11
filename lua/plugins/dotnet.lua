return {
  {
    "GustavEikaas/easy-dotnet.nvim",
    ft = { "cs" },
    cmd = { "DotnetBuild", "DotnetRun" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("easy-dotnet").setup({
        cmd = "dotnet-easydotnet",  -- fix for Arch Linux btw. (omg i spent 2 hours trying to figure this out)
        lsp = { enabled = false, }, -- incase this is causing the notification problem.
      })
    end,
  },
}


--makes life easier tbh
--especially for building and running .NET projects
--also it has a lot of useful commands like:
--:DotnetBuild
--:DotnetRun
--:DotnetTest
--:DotnetAddPackage
--:DotnetRemovePackage
-- bla bla bla you get it

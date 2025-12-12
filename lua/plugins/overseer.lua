return {
  {
    "stevearc/overseer.nvim",
    config = function()
      require("overseer").setup({})
    end,
  },
}

-- this plugin is for task running and build systems
-- i will use it for building and running .NET projects
-- also it has a lot of integrations with other plugins like telescope, neotest, etc
-- the thing is i use dotnet.lua plugin more than this one for building and running .NET projects currently but I will master this too hopefully.

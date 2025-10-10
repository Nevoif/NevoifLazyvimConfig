-- ~/.config/nvim/lua/plugins/dap-csharp.lua
return {
  {
    "mfussenegger/nvim-dap",
    lazy = false, -- always load
    config = function()
      local dap = require("dap")

      dap.adapters.coreclr = {
        type = "executable",
        command = "/usr/bin/netcoredbg", -- check with: which netcoredbg
        args = { "--interpreter=vscode" },
      }

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "launch - netcoredbg",
          request = "launch",
          program = function()
            return vim.fn.input("Path to dll: ",
              vim.fn.getcwd() .. "/bin/Debug/net9.0/",
              "file")
          end,
        },
      }
    end,
  },
}

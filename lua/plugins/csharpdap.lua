return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    ft = "cs",
    optional = true,
    keys = {
      -- Breakpoints and Flow Control
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "DAP: Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "DAP: Continue" },
      { "<leader>do", function() require("dap").step_over() end, desc = "DAP: Step Over" },
      { "<leader>di", function() require("dap").step_into() end, desc = "DAP: Step Into" },
      { "<leader>du", function() require("dap").step_out() end, desc = "DAP: Step Out" },
      -- UI and Interaction
      { "<leader>dy", function() require("dapui").toggle() end, desc = "DAP: Toggle UI" },
      { "<leader>dm", function() require("dap").repl.toggle() end, desc = "DAP: Toggle REPL" },
      { "<leader>dh", function() require("dap.ui.widgets").hover() end, desc = "DAP: Hover Variables" },
      { "<leader>df", function() require("dap.ui.widgets").centered_float() end, desc = "DAP: Floating Inspector" },
      { "<leader>de", function() require("dapui").eval() end, mode = { "n", "v" }, desc = "DAP: Evaluate Expression" },
      -- Debug State
      { "<leader>dp", function() require("dap").pause() end, desc = "DAP: Pause" },
      { "<leader>dq", function() require("dap").disconnect() end, desc = "DAP: Disconnect" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "DAP: Run Last" },
      { "<leader>dx", function() require("dap").set_exception_breakpoints({ "all" }) end, desc = "DAP: Exception Breakpoints" },
    },
    opts = function()
      local dap = require("dap")
      if not dap.adapters["netcoredbg"] then
        require("dap").adapters["netcoredbg"] = {
          type = "executable",
          command = vim.fn.exepath("netcoredbg"),
          args = { "--interpreter=vscode" },
        }
      end

      for _, lang in ipairs({ "cs", "fsharp", "vb" }) do
        if not dap.configurations[lang] then
          dap.configurations[lang] = {
            {
              type = "netcoredbg",
              name = "Launch file",
              request = "launch",
              program = function()
                return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
              end,
              cwd = "${workspaceFolder}",
            },
          }
        end
      end
    end,
  },
}

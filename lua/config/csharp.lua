local lspconfig = require("lspconfig")
local dap = require("dap")

-- Setup omnisharp language server
lspconfig.omnisharp.setup({
  cmd = { "/usr/bin/omnisharp" },
  on_attach = function(client, bufnr)
    -- You can add keymaps here if you want
  end,
  flags = {
    debounce_text_changes = 150,
  },
})

-- Setup debugger adapter for C#
dap.adapters.coreclr = {
  type = "executable",
  command = "/usr/bin/netcoredbg",
  args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/net9.0/", "file")
    end,
  },
}

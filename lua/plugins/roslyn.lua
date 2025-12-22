return {
  {
    "seblyng/roslyn.nvim",
    ft = { "cs", "razor" },
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      -- Enable progress notifications to see if it's actually working
      progress = true,
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, blink = pcall(require, "blink.cmp")
      if ok then
        capabilities = blink.get_lsp_capabilities()
      end

      require("roslyn").setup({

        config = {
          flags = {
            debounce_text_changes = 150,
          },
          settings = {
            ["csharp|inlay_hints"] = {
              csharp_enable_inlay_hints_for_implicit_object_creation = true,
              csharp_enable_inlay_hints_for_implicit_variable_types = true,
              csharp_enable_inlay_hints_for_lambda_parameter_types = true,
              dotnet_enable_inlay_hints_for_parameter_names = true,
            },
            ["csharp|code_lens"] = {
              dotnet_enable_references_code_lens = true,
            },
          },
        },
        filewatching = "roslyn",
        capabilities = capabilities,
      })

      vim.filetype.add({
        extension = {
          razor = "razor",
          cshtml = "razor",
        },
      })
    end,
  },
}

-- there is a initiation delay so maybe omnisharp was a better option but incase i need to work on blazor or something i can use this
-- also omnisharp is kinda slow and laggy sometimes
-- also roslyn is more lightweight and faster (they say so)
-- also roslyn has better code completion and refactoring tools
-- also roslyn is more modern and actively maintained

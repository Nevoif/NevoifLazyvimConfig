return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup {
        -- custom registries
        registries = {
          "github:Crashdummyy/mason-registry",
          "github:mason-org/mason-registry",
        },
        -- Mason to install these binaries automatically
        ensure_installed = {
          -- Core .NET / C#
          "roslyn",
          "netcoredbg",
          "csharpier",
          "lemminx", -- XML/csproj support
          "powershell-editor-services",

          -- Web / Front-end
          "html-lsp",
          "css-lsp",
          "json-lsp",
          "typescript-language-server",
          "prettier",

          -- DevOps / Config
          "docker-compose-language-service",
          "dockerfile-language-server",
          "yaml-language-server",
          "bash-language-server",
          "black",           -- future plans!
          "tree-sitter-cli", -- utility
          "sqlfluff",        -- SQL formatter (recommended for lang.sql extra)

          -- Config Maintenance / Utility
          "marksman",
          "lua-language-server",
        },
      }
    end,
  },
}

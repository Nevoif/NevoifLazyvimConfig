return {
  "mason-org/mason.nvim",
  lazy = true,
  cmd = { "Mason", "MasonInstall", "MasonUninstall" },
  opts = {
    registries = {
      "github:Crashdummyy/mason-registry",
      "github:mason-org/mason-registry",
    },
    ensure_installed = {
      -- ========================================
      -- C# / .NET Development
      -- ========================================
      "roslyn",                          -- C# LSP (modern, lightweight)
      "netcoredbg",                      -- C# Debugger
      "csharpier",                       -- C# Formatter

      -- ========================================
      -- Web Development
      -- ========================================
      "vtsls",                           -- TypeScript LSP (modern, recommended)
      "angular-language-server",         -- Angular support
      "html-lsp",                        -- HTML language server
      "css-lsp",                         -- CSS language server
      "tailwindcss-language-server",     -- Tailwind CSS support
      "emmet-language-server",           -- Emmet for templates
      "eslint-lsp",                      -- ESLint integration
      "prettier",                        -- Web formatter (JS/TS/HTML/CSS/JSON)

      -- ========================================
      -- SQL / Database
      -- ========================================
      -- MSSQL via dadbod (no LSP needed, handled by vim-dadbod)

      -- ========================================
      -- Infrastructure & Config
      -- ========================================
      "docker-compose-language-service", -- Docker Compose support
      "dockerfile-language-server",      -- Dockerfile support
      "yaml-language-server",            -- YAML (Kubernetes, configs)
      "bash-language-server",            -- Bash scripting

      -- ========================================
      -- Scripting & Other Languages
      -- ========================================
      "lua-language-server",             -- Lua (Neovim config)
      "stylua",                          -- Lua formatter
      "python-lsp-server",               -- Python (basic)
      "black",                           -- Python formatter
      "marksman",                        -- Markdown LSP
      "markdownlint-cli2",               -- Markdown linter

      -- ========================================
      -- Build & Development Tools
      -- ========================================
      "tree-sitter-cli",                 -- Tree-sitter parser generator
      "shfmt",                           -- Shell formatter
      "hadolint",                        -- Docker linter
      "htmlhint",                        -- HTML linter

      -- ========================================
      -- PowerShell (useful for .NET work)
      -- ========================================
      "powershell-editor-services",      -- PowerShell LSP
    },
  },
}

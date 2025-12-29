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
            "roslyn", -- C# LSP
            "netcoredbg", -- C# Debugger
            "csharpier", -- C# Formatter

            -- ========================================
            -- University Essentials (C++ & Java)
            -- ========================================
            "clangd", -- C/C++ LSP
            "codelldb", -- C/C++ Debugger
            "clang-format", -- C/C++ Formatter
            "jdtls", -- Java LSP
            "java-debug-adapter", -- Java Debugger (Required for nvim-java)
            "java-test", -- Java Test Runner (Required for nvim-java)

            -- ========================================
            -- Web Development
            -- ========================================
            "vtsls", -- TypeScript LSP
            "angular-language-server",
            "html-lsp",
            "css-lsp",
            "tailwindcss-language-server",
            "emmet-language-server",
            "eslint-lsp",
            "prettier",

            -- ========================================
            -- Infrastructure & Config
            -- ========================================
            "docker-compose-language-service",
            "dockerfile-language-server",
            "yaml-language-server",
            "bash-language-server",

            -- ========================================
            -- Scripting & Other Languages
            -- ========================================
            "lua-language-server",
            "stylua",
            "python-lsp-server",
            "black",
            "marksman",
            "markdownlint-cli2",

            -- ========================================
            -- Build & Development Tools
            -- ========================================
            "tree-sitter-cli",
            "shfmt",
            "hadolint",
            "htmlhint",
            "powershell-editor-services",
        },
    },
}

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
            -- Minimal .NET Backend Setup
            -- ========================================
            "roslyn", -- C# LSP
            "netcoredbg", -- C# Debugger
            "csharpier", -- C# Formatter

            -- ========================================
            -- Infrastructure & DevOps
            -- ========================================
            "docker-compose-language-service",
            "dockerfile-language-server",
            "yaml-language-server",
            "bash-language-server",

            -- ========================================
            -- Base System & Scripting
            -- ========================================
            "lua-language-server",
            "stylua",
            "sqlls", -- Core SQL support
        },
    },
}

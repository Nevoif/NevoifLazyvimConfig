return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                -- ================================
                -- Clangd: C/C++ Language Server
                -- ================================
                clangd = {
                    cmd = {
                        "clangd",
                        "--offset-encoding=utf-16",
                        "--background-index",
                        "--clang-tidy",
                        "--clang-tidy-checks=*",
                        "--completion-style=detailed",
                        "--function-arg-placeholders",
                        "--header-insertion=iwyu",
                        "--inlay-hints=true",
                        "--inlay-hints-hidden=false",
                    },
                    init_options = {
                        compilationDatabasePath = "build",
                        index = {
                            background = true,
                        },
                        clangdFileStatus = true,
                    },
                    root_dir = require("lspconfig.util").root_pattern(
                        "CMakeLists.txt",
                        "compile_commands.json",
                        ".clangd",
                        ".git"
                    ),
                },
                -- ================================
                -- CMake Language Server
                -- ================================
                cmake = {
                    priority = 100,
                },
            },
        },
    },
}

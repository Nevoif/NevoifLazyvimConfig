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
                            csharp_enable_inlay_hints_for_implicit_object_creation = false,
                            csharp_enable_inlay_hints_for_implicit_variable_types = false,
                            csharp_enable_inlay_hints_for_lambda_parameter_types = false,
                            csharp_enable_inlay_hints_for_types = false,
                            dotnet_enable_inlay_hints_for_indexer_parameters = false,
                            dotnet_enable_inlay_hints_for_literal_parameters = false,
                            dotnet_enable_inlay_hints_for_object_creation_parameters = false,
                            dotnet_enable_inlay_hints_for_other_parameters = false,
                            dotnet_enable_inlay_hints_for_parameters = false,
                            dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
                            dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
                            dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
                        },
                        ["csharp|background_analysis"] = {
                            dotnet_analyzer_diagnostics_scope = "fullSolution",
                            dotnet_compiler_diagnostics_scope = "fullSolution",
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
-- bootstrap lazy.nvim, LazyVim and your plugin
require("config.lazy")
-- force disable inlay hints globally
vim.lsp.inlay_hint.enable(false)
--require("config.csharp") not anymore i changed it lol
--
-- this is already default in nvim 0.10+, but forcing it ensures consistency
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        -- enable semantic highlighting if the server supports it
        if client.server_capabilities.semanticTokensProvider then
            client.server_capabilities.semanticTokensProvider = {
                full = true,
                legend = {
                    tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes,
                    tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers,
                },
                range = true,
            }
        end
    end,
})

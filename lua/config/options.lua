-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Global IDE Settings (Default: 2 spaces for Web/Lua/JSON)
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

-- UI Enhancements
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.signcolumn = "yes"
vim.o.wrap = false

-- Performance Optimizations
vim.o.updatetime = 500
vim.o.timeoutlen = 300 -- Faster keymap timeout

-- LSP and Diagnostics
vim.diagnostic.config({
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    virtual_text = {
        prefix = "●",
        spacing = 4,
    },
    float = {
        source = true,
        border = "rounded",
        focusable = true,
    },
})

-- Fix for C# / Python / Java (Force 4 spaces)
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "cs", "python", "java", "rust" },
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
    end,
})

-- LSP timeout tweak (Roslyn needs more time)
vim.g.lsp_log_verbose = false

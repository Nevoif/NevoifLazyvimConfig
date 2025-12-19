-- ==============================
-- LazyVim Keymaps
-- ==============================
-- Non-conflicting shortcuts for .NET and Web Development
-- 
-- Note: Plugin-specific keybinds are now configured in their respective plugin files:
-- - DAP keybinds: lua/plugins/csharpdap.lua
-- - Telescope keybinds: lua/plugins/telescope-config.lua
-- - Trouble keybinds: lua/plugins/trouble.lua
-- - Gitsigns keybinds: lua/plugins/gitsigns-config.lua
-- - Todo keybinds: lua/plugins/todo.lua
-- - Buffer navigation: lua/plugins/bufferline-config.lua
-- - Harpoon keybinds: lua/plugins/harpoon.lua
-- - ToggleTerm keybinds: lua/plugins/toggleterm.lua

local map = vim.keymap.set

-- ==============================
-- Utility Keymaps
-- ==============================
map("n", "<C-a>", "gg<S-v>G", { desc = "Select All" })

-- ==============================
-- Mini Surround - Quote/Bracket Operations
-- ==============================
-- Note: keybindings configured in mini-surround.lua
-- <leader>msa = add surround
-- <leader>msd = delete surround
-- <leader>msr = replace surround
-- <leader>msf = find surround
-- <leader>msh = highlight surround

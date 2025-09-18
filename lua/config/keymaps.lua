local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>dy", "<cmd>lua require'dapui'.toggle()<CR>", opts)

-- Basic debugging controls
vim.api.nvim_set_keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts) -- toggle breakpoint
vim.api.nvim_set_keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", opts) -- start/continue debugging
vim.api.nvim_set_keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<CR>", opts) -- step over
vim.api.nvim_set_keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", opts) -- step into
vim.api.nvim_set_keymap("n", "<leader>du", "<cmd>lua require'dap'.step_out()<CR>", opts) -- step out
vim.api.nvim_set_keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<CR>", opts) -- toggle REPL
vim.api.nvim_set_keymap("n", "<leader>dq", "<cmd>lua require'dap'.disconnect()<CR>", opts) -- stop debugging

-- Advanced commands
vim.api.nvim_set_keymap("n", "<leader>dp", "<cmd>lua require'dap'.pause()<CR>", opts) -- pause execution
vim.api.nvim_set_keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<CR>", opts) -- run last debug session
vim.api.nvim_set_keymap("n", "<leader>dx", "<cmd>lua require'dap'.set_exception_breakpoints({'all'})<CR>", opts) -- break on exceptions
vim.api.nvim_set_keymap("n", "<leader>dh", "<cmd>lua require'dap.ui.widgets.hover()<CR>", opts) -- hover variables (requires dap-ui)
vim.api.nvim_set_keymap("n", "<leader>df", "<cmd>lua require'dap.ui.widgets.centered_float()<CR>", opts) -- show variable in float window

-- Evaluate expression under cursor in REPL
vim.api.nvim_set_keymap("n", "<leader>de", "<cmd>lua require'dapui'.eval()<CR>", opts)
vim.api.nvim_set_keymap("v", "<leader>de", "<cmd>lua require'dapui'.eval()<CR>", opts)

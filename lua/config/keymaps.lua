-- ==============================
-- Keymaps.lua for LazyVim
-- ==============================

local map = vim.keymap.set

-- ==============================
-- DAP (Debug Adapter Protocol)
-- ==============================
map("n", "<leader>dy", function()
  require("dapui").toggle()
end, { noremap = true, silent = true, desc = "DAP: Toggle UI" })
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { noremap = true, silent = true, desc = "DAP: Toggle Breakpoint" })
map("n", "<leader>dc", function()
  require("dap").continue()
end, { noremap = true, silent = true, desc = "DAP: Continue" })
map("n", "<leader>do", function()
  require("dap").step_over()
end, { noremap = true, silent = true, desc = "DAP: Step Over" })
map("n", "<leader>di", function()
  require("dap").step_into()
end, { noremap = true, silent = true, desc = "DAP: Step Into" })
map("n", "<leader>du", function()
  require("dap").step_out()
end, { noremap = true, silent = true, desc = "DAP: Step Out" })
map("n", "<leader>dm", function()
  require("dap").repl.toggle()
end, { noremap = true, silent = true, desc = "DAP: Toggle REPL" })
map("n", "<leader>dq", function()
  require("dap").disconnect()
end, { noremap = true, silent = true, desc = "DAP: Stop Debugging" })
map("n", "<leader>dp", function()
  require("dap").pause()
end, { noremap = true, silent = true, desc = "DAP: Pause Execution" })
map("n", "<leader>dl", function()
  require("dap").run_last()
end, { noremap = true, silent = true, desc = "DAP: Run Last Session" })
map("n", "<leader>dx", function()
  require("dap").set_exception_breakpoints({ "all" })
end, { noremap = true, silent = true, desc = "DAP: Exception Breakpoints" })
map("n", "<leader>dh", function()
  require("dap.ui.widgets").hover()
end, { noremap = true, silent = true, desc = "DAP: Hover Variables" })
map("n", "<leader>df", function()
  require("dap.ui.widgets").centered_float()
end, { noremap = true, silent = true, desc = "DAP: Floating Window" })
map({ "n", "v" }, "<leader>de", function()
  require("dapui").eval()
end, { noremap = true, silent = true, desc = "DAP: Evaluate Expression" })

-- ==============================
-- Telescope (Lazy-load safe)
-- ==============================
map("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end, { noremap = true, silent = true, desc = "Telescope: Find Files" })
map("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end, { noremap = true, silent = true, desc = "Telescope: Live Grep" })
map("n", "<leader>fb", function()
  require("telescope.builtin").buffers()
end, { noremap = true, silent = true, desc = "Telescope: List Buffers" })
map("n", "<leader>fh", function()
  require("telescope.builtin").help_tags()
end, { noremap = true, silent = true, desc = "Telescope: Help Tags" })
map("n", "<leader>gs", function()
  require("telescope.builtin").git_status()
end, { noremap = true, silent = true, desc = "Telescope: Git Status" })

-- ==============================
-- Trouble (Diagnostics)
-- ==============================
map("n", "<leader>xx", "<cmd>TroubleToggle<CR>", { noremap = true, silent = true, desc = "Trouble: Toggle" })
map(
  "n",
  "<leader>xw",
  "<cmd>Trouble workspace_diagnostics<CR>",
  { noremap = true, silent = true, desc = "Trouble: Workspace Diagnostics" }
)
map("n", "<leader>xl", "<cmd>Trouble loclist<CR>", { noremap = true, silent = true, desc = "Trouble: Location List" })
map("n", "<leader>xq", "<cmd>Trouble quickfix<CR>", { noremap = true, silent = true, desc = "Trouble: Quickfix List" })

-- ==============================
-- Gitsigns
-- ==============================
map("n", "]h", function()
  require("gitsigns.nav_hunk").next_hunk()
end, { noremap = true, silent = true, desc = "Git: Next Hunk" })
map("n", "[h", function()
  require("gitsigns.nav_hunk").prev_hunk()
end, { noremap = true, silent = true, desc = "Git: Prev Hunk" })
map("n", "<leader>hs", function()
  require("gitsigns").stage_hunk()
end, { noremap = true, silent = true, desc = "Git: Stage Hunk" })
map("n", "<leader>hu", function()
  require("gitsigns.nav_hunk").undo_stage_hunk()
end, { noremap = true, silent = true, desc = "Git: Undo Stage Hunk" })
map("n", "<leader>hp", function()
  require("gitsigns").preview_hunk()
end, { noremap = true, silent = true, desc = "Git: Preview Hunk" })

-- ==============================
-- Todo Comments
-- ==============================
map("n", "<leader>xt", "<cmd>TodoTrouble<CR>", { noremap = true, silent = true, desc = "TodoComments: List TODOs" })

-- ==============================
-- Bufferline
-- ==============================
map("n", "[b", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true, desc = "Bufferline: Previous Buffer" })
map("n", "]b", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true, desc = "Bufferline: Next Buffer" })

-- ==============================
-- Future: .NET Unit Testing (Neotest)
-- ==============================
-- map('n', '<leader>tn', function() require('neotest').run.run() end, { desc = 'Neotest: Run nearest test' })
-- map('n', '<leader>ts', function() require('neotest').run.run({ strategy = 'dap' }) end, { desc = 'Neotest: Debug nearest test' })
-- map('n', '<leader>tf', function() require('neotest').run.run(vim.fn.expand("%")) end, { desc = 'Neotest: Run tests in file' })

-- currently didn't get into .NET Unit Testing yet so i will leave this for later

-- ==============================

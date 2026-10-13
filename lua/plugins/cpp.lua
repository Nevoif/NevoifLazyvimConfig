return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "c", "cpp" },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "clang-format" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.c = { "clang_format" }
      opts.formatters_by_ft.cpp = { "clang_format" }
    end,
  },
  {
    "Civitasv/cmake-tools.nvim",
    keys = {
      { "<leader>mb", "<cmd>CMakeBuild<cr>", desc = "CMake: Build" },
      { "<leader>mr", "<cmd>CMakeRun<cr>", desc = "CMake: Run" },
      { "<leader>md", "<cmd>CMakeDebug<cr>", desc = "CMake: Debug" },
    },
  },
}
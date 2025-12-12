return {
  {
    "GustavEnyberg/easy-dotnet.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      -------------------------------------------------------------------------
      -- ARCH LINUX FIX: Auto-detect SDK and set environment variables
      -- This fixes the "nil value" crash by ensuring the plugin can find the SDK.
      -------------------------------------------------------------------------
      local dotnet_root = "/usr/share/dotnet"

      if vim.fn.isdirectory(dotnet_root) == 1 then
        -- Find the installed SDK version (e.g., "8.0.x")
        local handle = io.popen("ls -1 " .. dotnet_root .. "/sdk | head -n 1")
        if handle then
          local sdk_version = handle:read("*a"):gsub("%s+", "")
          handle:close()

          if sdk_version ~= "" then
            -- Force the environment variables locally for Neovim
            vim.env.DOTNET_ROOT = dotnet_root
            vim.env.MSBuildSDKsPath = dotnet_root .. "/sdk/" .. sdk_version .. "/Sdks"
          end
        end
      end
      -------------------------------------------------------------------------

      local easy_dotnet = require("easy-dotnet")
      easy_dotnet.setup({
        -- We revert to the standard command because the fix above handles the paths
        cmd = "dotnet",

        -- Conflict prevention for Roslyn
        lsp = {
          auto_attach = true,
          capability = { hovering = false, definition = false }
        },
        test_runner = {
          viewmode = "float",
          enable_buffer_test_execution = true,
        },
      })
    end,
    keys = {
      { "<leader>B",  function() require("easy-dotnet").build_option() end,    desc = "Build Solution" },
      { "<leader>dr", function() require("easy-dotnet").run_project() end,     desc = "Run Project" },
      { "<leader>ds", function() require("easy-dotnet").secrets_manager() end, desc = "User Secrets" },
    },
  },
}


-- for some reason i cannot get this to work but we'll see

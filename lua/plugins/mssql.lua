return {
  {
    "Kurren123/mssql.nvim",
    lazy = true,
    cmd = "Mssql",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("mssql").setup({
        servers = {
          {
            name = "localdocker",
            user = os.getenv("MSSQL_USER"),
            password = os.getenv("MSSQL_PASSWORD"),
            server = "localhost",
            port = 1433,
            database = "mvcone_database",
          },
        },
      })
    end,
  },
}

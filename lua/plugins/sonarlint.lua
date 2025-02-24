return {
  -- not really usable but at least working
  {
    url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
    -- ft = { "python", "cpp", "java", "c" },
    lazy = true,
    ft = { "cpp", "c" },
    dependencies = {
      "williamboman/mason.nvim",
    },
    priority = 60,
    config = function()
      local sonar_language_server_path =
        require("mason-registry").get_package("sonarlint-language-server"):get_install_path()
      print(sonar_language_server_path)
      local analyzers_path = sonar_language_server_path .. "/extension/analyzers"
      -- print(require("cmake-tools").config:build_directory_path() .. "/compile_commands.json")
      local comm = (vim.uv.cwd() .. "/compile_commands.json")
      require("sonarlint").setup({
        server = {
          cmd = {
            sonar_language_server_path .. "/sonarlint-language-server",
            "-stdio",
            "-analyzers",
            vim.fn.expand(analyzers_path .. "/sonarcfamily.jar"),
          },
          settings = {
            sonarlint = {
              pathToCompileCommands = comm,
              -- rules = { ["cpp:S5025"] = { lebel = "on" } },
            },
          },
        },
        filetypes = {
          "cpp",
          "c",
        },
      })
    end,
  },
}

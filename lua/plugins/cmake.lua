return {
  -- {
  --   "Civitasv/cmake-tools.nvim",
  --   -- dependencies = {
  --   --   "akinsho/toggleterm.nvim",
  --   -- },
  --   -- opts = {
  --   --   ctest_command = "cd ./out/Debug ;ctest --output-on-failure",
  --   -- cmake_runner = {
  --   --   name = "toggleterm",
  --   --   opts = {
  --   --     direction = "horizontal",
  --   --   },
  --   -- },
  --   -- },
  --   enabled = false,
  -- },
  {
    -- "khris190/cmake-tools.nvim",
    "git@github.com:khris190/cmake-tools.nvim.git",
    -- dependencies = {
    --   "akinsho/toggleterm.nvim",
    -- },
    -- opts = {
    --   cmake_runner = {
    --     name = "toggleterm",
    --     opts = {
    --       direction = "horizontal",
    --     },
    --   },
    -- },
    branch = "runAllCTests",
    lazy = true,
    init = function()
      local loaded = false
      local function check()
        local cwd = vim.uv.cwd()
        if vim.fn.filereadable(cwd .. "/CMakeLists.txt") == 1 then
          require("lazy").load({ plugins = { "cmake-tools.nvim" } })
          loaded = true
        end
      end
      check()
      vim.api.nvim_create_autocmd("DirChanged", {
        callback = function()
          if not loaded then
            check()
          end
        end,
      })
    end,
  },
}

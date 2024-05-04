return {
  --   {
  --     "nvim-neotest/neotest",
  --     dependencies = {
  --       "nvim-lua/plenary.nvim",
  --       "alfaix/neotest-gtest",
  --       -- your other adapters here
  --     },
  --     adapters = {
  --       require("neotest-go")({
  --         experimental = {
  --           test_table = true,
  --         },
  --         args = { "-count=1", "-timeout=60s" },
  --       }),
  --     },
  --   },
}

return {
  {
    "natecraddock/workspaces.nvim",

    config = function()
      require("workspaces").setup({ autodir = "autochdir" })
    end,
  },
  { "artemave/workspace-diagnostics.nvim" },
}

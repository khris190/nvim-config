return {
  "ibhagwan/fzf-lua",
  config = function()
    require("fzf-lua").setup({
      diagnostics = {
        -- severity_only:   keep any matching exact severity
        severity_limit = vim.diagnostic.severity.WARN,
        -- severity_bound:  keep any equal or less severe (higher)
      },
    })
  end,
}

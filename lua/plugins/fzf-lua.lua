return {
  "ibhagwan/fzf-lua",
  config = function()
    require("fzf-lua").setup({
      -- This forces fzf-lua to use the CWD instead of looking for .git
      cwd = vim.fn.getcwd(),

      -- Alternatively, you can disable the "rooter" logic specifically
      -- so it doesn't jump to the git root.
      files = {
        cwd_header = true, -- Shows the CWD in the window header
      },
      diagnostics = {
        -- severity_only:   keep any matching exact severity
        severity_limit = vim.diagnostic.severity.WARN,
        -- severity_bound:  keep any equal or less severe (higher)
      },
    })
  end,
}

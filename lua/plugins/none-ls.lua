return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      local nls = require("null-ls")
      local composer_dir = vim.fn.getcwd()
      local composer_bin_dir = composer_dir .. "/vendor/bin"

      require("null-ls").setup({
        -- sources = {
        --   nls.builtins.formatting.phpcsfixer.with({
        --     command = composer_bin_dir .. "/php-cs-fixer",
        --     extra_args = {
        --       "--config=" .. composer_dir .. "/.php-cs-fixer.dist.php",
        --     },
        --   }),
        --   nls.builtins.diagnostics.phpcs.with({
        --     command = composer_bin_dir .. "/phpcs",
        --     extra_args = { "--standard=" .. composer_dir .. "/.phpcs.xml" },
        --   }),
        -- },
        -- you can reuse a shared lspconfig on_attach callback here
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                vim.lsp.buf.format({ async = false })
              end,
            })
          end
        end,
      })
    end,
  },
}

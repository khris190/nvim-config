local null_ls = require "null-ls"

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  debug = true,
  sources = {
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.code_actions.clang_format,
    require("none-ls.code_actions.eslint_d"),
    require("none-ls.diagnostics.eslint_d"),
    require("none-ls.diagnostics.ruff"),
    null_ls.builtins.diagnostics.clang_format,
    require("none-ls.formatting.eslint_d"),
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.clang_format,
    require("none-ls.formatting.ruff"),
  },
  on_attach = function(client, bufnr)
    require("lsp-format").on_attach(client)
    if client.supports_method("textDocument/formatting") then
      print("hello from format")
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end
  end,
}

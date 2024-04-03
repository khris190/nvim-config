local null_ls = require "null-ls"
if not null_ls then
  return
end

null_ls.setup {
  debug = true,
  sources = {
    null_ls.builtins.code_actions.gitsigns,
    require("none-ls.code_actions.eslint_d"),
    require("none-ls.diagnostics.eslint_d"),
    require("none-ls.diagnostics.ruff"),
    require("none-ls.formatting.eslint_d"),
    null_ls.builtins.formatting.stylua,
    require("none-ls.formatting.ruff"),
  },
  on_attach = function(client, bufnr)
    require("lsp-format").on_attach(client)
  end,
}

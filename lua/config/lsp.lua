-- If you are using mason.nvim, you can get the ts_plugin_path like this
local mason_registry = require("mason-registry")
local vue_language_server_path = vim.fn.expand("$MASON/packages/vue-language-server")
  .. "/node_modules/@vue/language-server"

local lspconfig = require("lspconfig")

lspconfig.ts_ls.setup({
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_language_server_path,
        languages = { "vue" },
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "svlete" },
})

require("lspconfig").volar.setup({})

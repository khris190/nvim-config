return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      svelte = {},
      intelephense = {
        init_options = {
          licenceKey = "~/.local/share/nvim/intelephense.txt",
        },
      },
      dockerls = {},
      docker_compose_language_service = {},
    },
    setup = {
      svelte = function()
        require("lazyvim.util").lsp.on_attach(function(client, bufnr)
          require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
          if client.name == "svelte" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
    },
    -- config = function()
    --   local mason_registry = require("mason-registry")
    --   local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
    --     .. "/node_modules/@vue/language-server"
    --
    --   local lspconfig = require("lspconfig")
    --
    --   lspconfig.tsserver.setup({
    --     init_options = {
    --       plugins = {
    --         {
    --           name = "@vue/typescript-plugin",
    --           location = vue_language_server_path,
    --           languages = { "vue" },
    --         },
    --       },
    --     },
    --     filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    --   })
    -- end,
  },
}

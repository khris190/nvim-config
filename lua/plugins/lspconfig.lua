return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = { svelte = {} },
    setup = {
      svelte = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "svelte" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
    },
  },
}

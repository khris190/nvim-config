return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  opts = {
    provider_selector = function(_bufnr, _filetype, _buftype)
      -- if you prefer treesitter provider rather than lsp,
      -- return ftMap[filetype] or {'treesitter', 'indent'}
      return { "treesitter", "indent" }

      -- refer to ./doc/example.lua for detail
    end,
  },
}

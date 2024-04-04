local treesitter_config = require "nvim-treesitter.configs"

treesitter_config.setup {
  ensure_installed = {
    "lua",
    "vim",
    "c",
    "javascript",
    "json",
    "typescript",
    "tsx",
    "markdown",
    "markdown_inline",
    -- "python",
    -- "ruby",
    -- "css",
    -- "html",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
}

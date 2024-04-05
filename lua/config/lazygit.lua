local theme_path = vim.fn.stdpath("cache") .. "/lazygit-theme.yml"
local config = require("lazy.util").read_file(theme_path)
-- local ending = [[
--
-- os:
--   edit: 'nvim  --server "$NVIM" --remote-tab {{filename}}; nvim --server "$NVIM" < " gg"'
--   open: 'nvim  --server "$NVIM" --remote-tab {{filename}}; nvim --server "$NVIM" < " gg"']]
-- if not string.match(config, "(os:\n  edit: 'nvim --server)") then
--   config = config .. ending
--   require("lazy.util").write_file(theme_path, config)
-- end

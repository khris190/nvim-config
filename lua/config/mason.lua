local mason = require "mason"
local signs = require("utils").signs

mason.setup {
  ui = {
    icons = {
      package_installed = signs.PassCheck,
      package_pending = signs.Running,
      package_uninstalled = signs.GitRemoved,
    },
  },
}

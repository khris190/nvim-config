local dap = require("dap")
local mason_registry = require("mason-registry")
local codelldb_root = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
local codelldb_path = codelldb_root .. "adapter/codelldb"
local liblldb_path = codelldb_root .. "lldb/lib/liblldb.so"
dap.adapters.rust = {
  type = "server",
  port = "${port}",
  host = "127.0.0.1",
  executable = {
    command = codelldb_path,
    args = { "--liblldb", liblldb_path, "--port", "${port}" },
  },
}

dap.configurations.rust = {
  {
    name = "Launch",
    type = "rust",
    request = "launch",
    program = "${workspaceFolder}/target/debug/${workspaceFolderBasename}",
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}
-- cpp?
dap.adapters.lldb = {
  type = "executable",
  command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
  name = "lldb",
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = "${command:cmake.launchTargetPath}",
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    environment = {
      {
        name = "PATH",
        value = "$PATH:${command:cmake.launchTargetDirectory}",
      },
    },
  },
}

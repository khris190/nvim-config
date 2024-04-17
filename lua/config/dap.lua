local dap = require("dap")
local mason_registry = require("mason-registry")
local codelldb_root = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
local codelldb_path = codelldb_root .. "adapter/codelldb"
local liblldb_path = codelldb_root .. "lldb/lib/liblldb.so"

require("dap").adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb-vscode", -- adjust as needed
  name = "lldb",
}
dap.configurations.rust = {
  {
    name = "Launch lldb",
    type = "lldb", -- matches the adapter
    request = "launch", -- could also attach to a currently running process
    program = function()
      print(os.execute("cargo build"))
      return "${workspaceFolder}/target/debug/${workspaceFolderBasename}"
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    showDisassembly = "never",
  },
}

local cmake = require("cmake-tools")
if cmake.is_cmake_project() == false then
  --//TODO add options for non cmake cpp project?
  -- dap.configurations.cpp = {
  --   {
  --     name = "Launch lldb",
  --     type = "lldb", -- matches the adapter
  --     request = "launch", -- could also attach to a currently running process
  --
  --     program = function()
  --       -- cmake.build({ bang = false }, function()
  --       --   vim.notify("Cmake build success")
  --       -- end)
  --       -- cmake.debug({ bang = false })
  --     end,
  --     cwd = function()
  --       return cmake.get_launch_path(cmake.get_launch_target())
  --     end,
  --     stopOnEntry = false,
  --     args = {},
  --     showDisassembly = "never",
  --   },
  -- }
end

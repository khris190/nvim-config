local dap = require("dap")

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
  -- //TODO add options for non cmake cpp project?
  dap.configurations.cpp = {
    {
      name = "Launch lldb",
      type = "lldb", -- matches the adapter
      request = "launch", -- could also attach to a currently running process

      program = function()
        return cmake.get_launch_path(cmake.get_launch_target()) .. cmake.get_launch_target()
      end,
      cwd = function()
        return cmake.get_launch_path(cmake.get_launch_target())
      end,
      stopOnEntry = true,
      args = {},
      showDisassembly = "never",
    },
  }
end

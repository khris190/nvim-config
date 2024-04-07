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
    program = function()
      vim.fn.system("cargo build")
      return "${workspaceFolder}/target/debug/${workspaceFolderBasename}"
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}

local cmake = require("cmake-tools")

if cmake.is_cmake_project() then
  vim.keymap.set("n", "<leader>dd", function()
    cmake.debug({ bang = false })
  end, { desc = "Debug" })
  -- --//TODO add options for non cmake cpp project?
  -- dap.adapters.lldb = {
  --   type = "executable",
  --   command = "/usr/bin/lldb-vscode",
  --   name = "lldb",
  -- }
  --
  -- dap.configurations.cpp = {
  --   {
  --     name = "Launch",
  --     type = "lldb",
  --     request = "launch",
  --     program = function()
  --       -- return cmake.get_launch_path(cmake.get_launch_target()) .. cmake.get_launch_target()
  --     end,
  --     cwd = cmake.get_launch_path(cmake.get_launch_target()),
  --     stopOnEntry = false,
  --     args = {},
  --   },
  -- }
end

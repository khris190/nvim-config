-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.keymap.set({ "n", "i" }, "<A-s>", function()
--   vim.cmd("w")
-- end)
-- add space dd to start debugging so i can get my custom debug runner for cmake

local cmake = require("cmake-tools")
if cmake.is_cmake_project() then
  vim.keymap.set("n", "<leader>dd", function()
    cmake.generate({ bang = false }, function()
      cmake.build({ bang = false }, function()
        -- cmake.debug({ bang = false })
        require("dap").continue()
      end)
    end)
  end, { desc = "Debug" })

  vim.keymap.set("n", "<leader>dx", function()
    cmake.generate({ bang = false }, function()
      cmake.build({ bang = false }, function()
        cmake.run_test({ args = "--output-on-failure" })
      end)
    end)
  end, { desc = "run tests" })
  -- vim.keymap.set("n", "<leader>dz", function()
  --   cmake.select_launch_target(function()
  --     vim.cmd("CMakeRun")
  --   end)
  -- end, { desc = "check stufcf" })
else
  vim.keymap.set("n", "<leader>dd", function()
    require("dap").continue()
  end, { desc = "Debug/Continue" })
end

-- tabs
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "<leader><tab>d", function()
  local bd = require("mini.bufremove").delete
  if vim.bo.modified then
    local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
    if choice == 1 then -- Yes
      vim.cmd.write()
      bd(0)
    elseif choice == 2 then -- No
      bd(0, true)
    end
  else
    bd(0)
  end
end, { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader><tab>[", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Tab" })
vim.keymap.set("n", "<leader><tab>]", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Tab" })

-- dir telescope

-- vim.keymap.set("n", "<leader>sG", function()
--   require("telescope").extensions.dir.live_grep()
-- end, { desc = "find in directory" })
-- vim.keymap.set("n", "<leader>fF", function()
--   require("telescope").extensions.dir.find_files()
-- end, { desc = "find file in dir" })

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.rs" },
  callback = function(ev)
    vim.schedule(function()
      vim.api.nvim_buf_set_keymap(0, "n", "<A-r>", "", {
        callback = function()
          -- vim.cmd("RustRun")
          print("Alt in Rust file")
        end,
      })
    end)
  end,
})

vim.keymap.set("n", "<A-s>", function()
  vim.cmd("w")
end)
-- add space dd to start debugging so i can get my custom debug runner for cmake
vim.keymap.set("n", "<leader>dd", function()
  require("dap").continue()
end, { desc = "Continue" })
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

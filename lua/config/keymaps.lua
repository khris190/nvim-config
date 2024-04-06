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

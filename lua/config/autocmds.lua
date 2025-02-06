-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.rs" },
  callback = function(ev)
    vim.api.nvim_buf_set_keymap(0, "n", "<A-r>", "", {
      callback = function()
        -- vim.cmd("RustRun")
        print("Alt in Rust file")
      end,
    })
  end,
})
-- fucking kill me it highlights links in md, what is the pattern for highlight buffer window
-- vim.api.nvim_create_autocmd({ "BufWinEnter", "InsertEnter", "InsertLeave" }, {
--   pattern = { "*" },
--   callback = function(ev)
--     if ev.file == "" then
--       vim.cmd("highlight MyMdLinkPatternHighlight guifg=lightBlue gui=underline ")
--       vim.cmd([[match MyMDLinkPatternHighlight /\v\[[^\]\[]+\]\([^\(\)]+\)/]])
--     end
--   end,
-- })

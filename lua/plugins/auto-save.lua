return {
  "okuuva/auto-save.nvim",
  event = { "InsertLeave", "WinLeave" }, -- optional for lazy loading on trigger events

  opts = {
    trigger_events = { -- See :h events
      immediate_save = { "BufLeave", "FocusLost" }, -- vim events that trigger an immediate save
      defer_save = {}, -- vim events that trigger a deferred save (saves after `debounce_delay`)
      cancel_defered_save = { "InsertEnter" }, -- vim events that cancel a pending deferred save
    },
  },
}

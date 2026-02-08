return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      strategies = {
        chat = {
          adapter = "qwen",
          inline = "qwen",
          cmd = "qwen",
        },
      },
      adapters = {
        qwen = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "qwen", -- Give this adapter a different name to differentiate it from the default ollama adapter
            schema = {
              model = {
                default = "qwen2.5-coder:7b",
              },
            },
          })
        end,
        qwensmall = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "qwensmall", -- Give this adapter a different name to differentiate it from the default ollama adapter
            schema = {
              model = {
                default = "qwen2.5-coder:0.5b",
              },
            },
          })
        end,
      },
      opts = {
        log_level = "DEBUG",
      },
      display = {
        diff = {
          enabled = true,
          close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
          layout = "vertical", -- vertical|horizontal split for default provider
          opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
          provider = "default", -- default|mini_diff
        },
      },
    },
  },
  -- {
  --   "milanglacier/minuet-ai.nvim",
  --   config = function()
  --     require("minuet").setup({
  --       virtualtext = {
  --         auto_trigger_ft = {},
  --         keymap = {
  --           -- accept whole completion
  --           accept = "<A-A>",
  --           -- accept one line
  --           accept_line = "<A-a>",
  --           -- accept n lines (prompts for number)
  --           -- e.g. "A-z 2 CR" will accept 2 lines
  --           accept_n_lines = "<A-z>",
  --           -- Cycle to prev completion item, or manually invoke completion
  --           prev = "<A-[>",
  --           -- Cycle to next completion item, or manually invoke completion
  --           next = "<A-]>",
  --           dismiss = "<A-e>",
  --         },
  --       },
  --       provider = "openai_fim_compatible",
  --       n_completions = 1,
  --       context_window = 512,
  --       provider_options = {
  --         openai_fim_compatible = {
  --           api_key = "TERM",
  --           name = "Ollama",
  --           end_point = "http://localhost:11434/v1/completions",
  --           model = "qwen2.5-coder:3b",
  --           optional = {
  --             max_tokens = 200,
  --             top_p = 0.9,
  --           },
  --         },
  --       },
  --     })
  --   end,
  -- },
  --
  -- { "nvim-lua/plenary.nvim" },
  -- {
  --   "saghen/blink.cmp",
  --   dependencies = { "milanglacier/minuet-ai.nvim" },
  --   config = function()
  --     require("blink.cmp").setup({
  --       keymap = {
  --         -- Manually invoke minuet completion.
  --         ["<A-y>"] = require("minuet").make_blink_map(),
  --       },
  --       sources = {
  --         -- Enable minuet for autocomplete
  --         default = { "lsp", "path", "buffer", "snippets", "minuet" },
  --         -- For manual completion only, remove 'minuet' from default
  --         providers = {
  --           minuet = {
  --             name = "minuet",
  --             module = "minuet.blink",
  --             async = true,
  --             -- Should match minuet.config.request_timeout * 1000,
  --             -- since minuet.config.request_timeout is in seconds
  --             timeout_ms = 3000,
  --             score_offset = 50, -- Gives minuet higher priority among suggestions
  --           },
  --         },
  --       },
  --       -- Recommended to avoid unnecessary request
  --       completion = { trigger = { prefetch_on_insert = true } },
  --     })
  --   end,
  -- },
}

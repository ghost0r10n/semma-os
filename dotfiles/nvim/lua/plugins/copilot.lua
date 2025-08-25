return {
  -- core copilot completion
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = true, auto_trigger = true },
      panel = { enabled = true },
    },
  },

  -- bridge copilot → cmp
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  -- copilot chat (needs telescope + nui.nvim, both are already in LazyVim)
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      "zbirenbaum/copilot.lua", -- core copilot
      "nvim-lua/plenary.nvim",  -- common utils
      "MunifTanjim/nui.nvim",   -- ui components
    },
    opts = {
      -- optional: tweak window layout
      window = {
        layout = "float",
        relative = "editor",
        border = "rounded",
      },
    },
  },
}


-- ~/.config/nvim/lua/plugins/mason.lua
return {
  -- Core manager
  {
    "mason-org/mason.nvim",
    lazy = false, -- <— load at startup
    priority = 1001, -- make sure it’s available early
    opts = {
      ui = { border = "rounded" },
      -- PATH = "skip",      -- (optional on NixOS) keep system PATH if you prefer
    },
  },

  -- LSPs via mason-lspconfig
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false, -- <— load at startup
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        -- core
        "lua_ls",
        "jsonls",
        "yamlls",
        "marksman",
        "bashls",
        "dockerls",
        "docker_compose_language_service",
        "html",
        "cssls",

        -- languages you asked for
        "pyright",
        "ruff_lsp",
        "gopls",
        "rust_analyzer",
        "jdtls", -- Java (Mason-managed)
        "rnix-lsp",
        -- formatters belong to mason-null-ls (kept below)
      },
      automatic_installation = true,
    },
  },

  -- Formatters / linters (unchanged)
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = { "nvimtools/none-ls.nvim" },
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        "shellcheck",
        "prettierd",
        "ruff",
        "black",
        "google_java_format",
        "golines",
        "gofumpt",
        --"codespell",
      },
      automatic_installation = true,
      handlers = {},
    },
  },

  -- DAPs (unchanged)
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        "debugpy",
        "delve",
        "codelldb",
        "java-debug-adapter",
        "js-debug-adapter",
      },
      automatic_installation = true,
      handlers = {},
    },
  },
}

-- Mason: install LSPs / formatters / DAPs automatically
return {
  -- Core manager
  { "williamboman/mason.nvim",
    opts = {
      ui = { border = "rounded" },
    },
  },

  -- LSPs via mason-lspconfig
  { "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        -- core
        "lua_ls", "jsonls", "yamlls", "marksman", "bashls",
        "dockerls", "docker_compose_language_service",
        "html", "cssls",

        -- languages you asked for
        "pyright",          -- Python (or "basedpyright")
        "ruff_lsp",         -- Python linting
        "gopls",            -- Go
        "rust_analyzer",    -- Rust (works fine even if you use rustup)
        "jdtls",            -- Java (needs a JDK on PATH)
      },
      automatic_installation = true,
    },
  },

  -- Formatters / linters via none-ls (null-ls) + Mason bridge
  { "jay-babu/mason-null-ls.nvim",
    dependencies = { "nvimtools/none-ls.nvim" },
    opts = {
      ensure_installed = {
        "stylua",            -- Lua formatter
        "shfmt", "shellcheck",
        "prettierd",         -- web stuff
        "ruff", "black",     -- Python
        "google_java_format",-- Java formatter
        "golines", "gofumpt",-- Go formatters
        "codespell",
      },
      automatic_installation = true,
      handlers = {}, -- let LazyVim/none-ls pick them up
    },
  },

  -- Debuggers via Mason
  { "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        "debugpy",           -- Python
        "delve",             -- Go
        "codelldb",          -- Rust/C/C++
        "java-debug-adapter",-- Java
        "js-debug-adapter",
      },
      automatic_installation = true,
      handlers = {},
    },
  },
}


return {
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },

  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<F3>", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  {
    "saecki/crates.nvim",
    tag = "v0.3.0",
    event = "BufRead Cargo.toml",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<leader>cr",
        function()
          require("crates").reload()
        end,
        desc = "Reload",
      },
      {
        "<leader>ci",
        function()
          require("crates").show_popup()
        end,
        desc = "Show information",
      },
      {
        "<leader>cd",
        function()
          require("crates").show_dependencies_popup()
        end,
        desc = "Show dependencies",
      },

      {
        "<leader>cu",
        function()
          require("crates").update_crate()
        end,
        desc = "Update",
      },
      {
        "<leader>cu",
        function()
          require("crates").update_crates()
        end,
        mode = "v",
        desc = "Update",
      },
      {
        "<leader>ca",
        function()
          require("crates").update_all_crates()
        end,
        desc = "Update all",
      },

      {
        "<leader>cU",
        function()
          require("crates").upgrade_crate()
        end,
        desc = "Upgrade",
      },
      {
        "<leader>cU",
        function()
          require("crates").upgrade_crates()
        end,
        mode = "v",
        desc = "Upgrade",
      },
      {
        "<leader>cA",
        function()
          require("crates").upgrade_all_crates()
        end,
        desc = "Upgrade all",
      },

      {
        "<leader>cH",
        function()
          require("crates").open_homepage()
        end,
        desc = "Open homepage",
      },
      {
        "<leader>cR",
        function()
          require("crates").open_repository()
        end,
        desc = "Open repository",
      },
      {
        "<leader>cD",
        function()
          require("crates").open_documentation()
        end,
        desc = "Open documentation",
      },
      {
        "<leader>cC",
        function()
          require("crates").open_crates_io()
        end,
        desc = "Open crates.io",
      },
    },
    config = function()
      require("crates").setup()
    end,
  },
  -- { "mrjones2014/nvim-ts-rainbow" },
  { url = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git" },
  { "m-demare/hlargs.nvim" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "json5",
        "dot",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        -- "gitignore",  -- gives errors about needing treesitter cli installed
        "rust",
        "toml",
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
  },

  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        rust_analyzer = {},
      },
    },
  },
  {
    'felpafel/inlay-hint.nvim',
    event = 'LspAttach',
    config = true,
  },
}

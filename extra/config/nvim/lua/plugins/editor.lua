vim.g.undotree_SetFocusWhenToggle = 1
vim.o.spell = true
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.clipboard = "" -- lazy enables `unnamedplus`
vim.o.ignorecase = false -- lazy enables this

return {
  -- Too magical, disables `x`
  { "ggandor/leap.nvim", enabled = false },

  { "norcalli/nvim-colorizer.lua" },

  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },

  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle" },
    keys = { { "<F5>", "<cmd>UndotreeToggle<cr>", desc = "Navigate undo tree" } },
  },

  {
    "folke/which-key.nvim",
    opts = {
      plugins = {
        marks = true,
        registers = true,
      },
    },
  },

  {
    "RRethy/vim-illuminate",
    keys = {
      {
        "<a-n>",
        function()
          require("illuminate").goto_next_reference()
        end,
        desc = "Move to next reference",
      },
      {
        "<a-p>",
        function()
          require("illuminate").goto_prev_reference()
        end,
        desc = "Move to previous reference",
      },
    },
  },
}

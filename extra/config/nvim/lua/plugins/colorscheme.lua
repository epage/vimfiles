vim.o.background = "light"
vim.g.material_style = "lighter"

return {
  { "Th3Whit3Wolf/one-nvim" },
  { 'projekt0n/github-nvim-theme' },
  { 'marko-cerovac/material.nvim' },

  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "one-nvim",
      colorscheme = "github_light_default",
      -- colorscheme = "material",
    },
  },
}

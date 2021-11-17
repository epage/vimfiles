-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]]

vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager

  -- use 'joshdick/onedark.vim' -- Theme inspired by Atom
  use 'Th3Whit3Wolf/one-nvim'

  use 'itchyny/lightline.vim' -- Fancier statusline
  use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
  use 'norcalli/nvim-colorizer.lua'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'luochen1990/rainbow'
  use 'gelguy/wilder.nvim'  -- TODO
  use {'edluffy/specs.nvim'}  -- TODO
  use 'gcmt/wildfire.vim'  -- TODO
  use {
    'zegervdv/nrpattern.nvim',
    config = function()
      require"nrpattern".setup()
    end,
    requires = { 'tpope/vim-repeat' },
  }

  use { 'tpope/vim-fugitive', cmd = { "Git" } }
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines

  use 'justinmk/vim-dirvish'
  use { 'mbbill/undotree', cmd = { 'UndotreeToggle' } }
  use "tversteeg/registers.nvim"
  use { 'tpope/vim-eunuch', cmd = { 'Delete', 'Unlink', 'Move', 'Rename', 'Chmod', 'Mkdir' } }

  use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  use { 'majutsushi/tagbar', cmd = { 'TagbarToggle' } }
  -- TODO: crashed
  -- use {
  --   'nvim-telescope/telescope.nvim',
  --   requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  -- }

  use { 'rust-lang/rust.vim', ft = {'rust'} }  -- TODO

  -- TODO: Look into:
  -- - which-key
  -- - treesitter
  -- - terminal.lua if I deal with ansi escape codes

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

--Incremental live completion
vim.o.inccommand = 'nosplit'

--Do not save when switching buffers
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = 'a'

--Save undo history
vim.o.undofile = true

vim.o.showmatch = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

vim.o.lazyredraw = true

--Wrapping
vim.o.breakindent = true
vim.o.linebreak = true

vim.o.list = true

vim.o.diffopt = "iwhite,icase"

vim.o.spell = true

--Make line numbers default
vim.wo.number = true

vim.o.cursorline = true

--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.cmd [[colorscheme one-nvim]]
vim.o.background = "light"

vim.o.wildmode = "list:longest"
vim.o.wildignore = ".svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.d,objects"
--Set statusbar
vim.g.lightline = {
  active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'fugitive#head' },
}

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.api.nvim_set_keymap('', '<F5>', ':UndotreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<F3>', ':TagbarToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })

--Map blankline
require("indent_blankline").setup {
    char = '┊',
    filetype_exclude = { 'help', 'packer' },
    buftype_exclude = { 'terminal', 'nofile' },
    char_highlight = 'LineNr',
    show_trailing_blankline_indent = false,
}

-- TODO: Crashes
--require("bufferline").setup{}

vim.g.rainbow_active = 1

vim.g.rustfmt_autosave = 1

vim.g.undotree_SetFocusWhenToggle = 1

vim.cmd [[
    let g:wildfire_objects = {
        \ "*" : ["iw", "i'", 'i"', "i)", "i]", "i}", "ip"],
        \ "c,cpp" : ["iw", "i'", 'i"', "i)", "i]", "i}", "a}"],
        \ "python" : ["iw", "i'", 'i"', "i)", "i]", "ip"],
        \ "html,xml" : ["iw", "is", "ip", "it", "at"],
    \ }
]]

-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = { hl = 'GitGutterAdd', text = '+' },
    change = { hl = 'GitGutterChange', text = '~' },
    delete = { hl = 'GitGutterDelete', text = '_' },
    topdelete = { hl = 'GitGutterDelete', text = '‾' },
    changedelete = { hl = 'GitGutterChange', text = '~' },
  },
}

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

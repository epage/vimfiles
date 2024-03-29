if has("gui_running")
    " Set for hidpi machines
    "set guifont=consolas:h11
endif

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gina#component#repo#branch'
      \ },
      \ }

let g:rainbow_active = 1

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'epage/vim-epage'

Plug 'w0ng/vim-hybrid'

Plug 'bling/vim-bufferline'
Plug 'itchyny/lightline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mhinz/vim-signify'
Plug 'luochen1990/rainbow'

Plug 'vim-scripts/nextval'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gcmt/wildfire.vim'
Plug 'majutsushi/tagbar', { 'on':  'TagbarToggle' }
Plug 'mbbill/undotree/', { 'on':  'UndotreeToggle' }
Plug 'tpope/vim-eunuch', { 'on':  ['Delete', 'Unlink', 'Move', 'Rename', 'Chmod', 'Mkdir', ] }
Plug 'lambdalisue/gina.vim', { 'on':  'Gina' }
Plug 'tpope/vim-fugitive', { 'on':  'Git' }

Plug 'tpope/vim-vinegar'
Plug 'justinmk/vim-dirvish'

Plug 'vim-scripts/a.vim', { 'on':  'A' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'sgur/vim-editorconfig'
Plug 'w0rp/ale'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
call plug#end()

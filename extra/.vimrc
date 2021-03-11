if has("gui_running")
    " Set for hidpi machines
    set guifont=consolas:h11
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

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'bling/vim-bufferline
Plug 'ctrlpvim/ctrlp.vim
Plug 'epage/vim-epage
Plug 'gcmt/wildfire.vim
Plug 'henrik/vim-indexed-search
Plug 'mhinz/vim-signify
Plug 'nathanaelkane/vim-indent-guides
Plug 'tpope/vim-sensible
Plug 'tpope/vim-vinegar
Plug 'vim-scripts/a.vim
Plug 'w0ng/vim-hybrid
Plug 'cespare/vim-toml
Plug 'itchyny/lightline.vim
Plug 'justinmk/vim-dirvish
Plug 'kien/rainbow_parentheses.vim
Plug 'lambdalisue/gina.vim
Plug 'ludovicchabant/vim-gutentags
Plug 'majutsushi/tagbar
Plug 'mbbill/undotree/
Plug 'ntpeters/vim-better-whitespace
Plug 'rust-lang/rust.vim
Plug 'sgur/vim-editorconfig
Plug 'sophacles/vim-bundle-mako
Plug 'tpope/vim-eunuch
Plug 'tpope/vim-pathogen
Plug 'w0rp/ale
call plug#end()

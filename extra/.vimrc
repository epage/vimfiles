if has('win32') || has ('win64')
    let $VIMHOME = $HOME."/vimfiles"
else
    let $VIMHOME = $HOME."/.vim"
endif

if has("gui_running")
    " Set for hidpi machines
    set guifont=consolas:h11
endif

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

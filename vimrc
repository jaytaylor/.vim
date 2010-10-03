" no compatible
set nocp

" basics
set ai
set ts=4
set sw=4
set et
set ruler

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" trailing spaces show as .
set list listchars=tab:\ \ ,trail:·

" no bell
set noerrorbells
set visualbell
set t_vb=

" gui
if has("gui_running")
    syntax on

    " pathogen
    filetype off
    call pathogen#runtime_append_all_bundles()

    " nerdtree binding
    map <Leader>nt :NERDTree<CR>

    set guifont=Consolas\ for\ BBEdit:h12
    set guioptions=egmrt
    set columns=130
    colorscheme cocaine
endif


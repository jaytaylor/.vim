" no compatible
set nocp

" basics
set ai
set ts=4
set sw=4
set et
set ruler

" Searching
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
    " pathogen
    filetype off
    call pathogen#runtime_append_all_bundles()

    " nerdtree binding
    map <Leader>a :NERDTreeToggle<CR>
    map <Leader>s :NERDTree<CR>

    set guifont=Consolas\ for\ BBEdit:h12
    set guioptions=egmrt
    set columns=130
    colorscheme cocaine
    syntax on

    set tags=tags;/
endif

set dir=~/tmp " Store all swapfiles in ~/tmp to avoid cluttering other folders wit    h .swp files

syntax on
filetype on
filetype plugin on

set ruler " Always show current positions along the bottom 
set number " turn on line numbers
set lz " do not redraw while running macros (much faster) (LazyRedraw)
"set hid " you can change buffer without saving
set backspace=2 " make backspace work normal
"set whichwrap+=<,>,h,l  " backspace and cursor keys wrap to
"set mouse=a " use mouse everywhere
set shortmess=atI " shortens messages to avoid 'press a key' prompt 
set report=0 " tell us when anything is changed via :...

set showmatch " show matching brackets
set mat=5 " how many tenths of a second to blink matching brackets for
set hlsearch " highlight search matches
set incsearch " do highlight as you type you search phrase
set so=10 " Keep 10 lines (top/bottom) for scope
set ffs=unix,dos,mac   " support all three, in this order

set statusline=%<%{StatusFN(0)}%1*%{StatusFN(1)}%m%0*\ %F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [\%03.3b\x10]\ [\%02.2B\x16]\ [LEN=%L]\ %=%04l,%03v\ [%p%%]

function StatusFN(changed)
  if &mod == a:changed | return expand('%') | else | return '' | endif
endfunction

highlight StatusLine term=bold,reverse cterm=bold,reverse ctermfg=0 ctermbg=4 guifg=#ffffff guibg=#000000
" Turn off bells and whistles 
set novisualbell noerrorbells
" Show indicator for insert, replace, and visual modes (default)
set showmode
set showcmd

" status line colors
"hi statusline term=inverse cterm=bold ctermfg=Cyan ctermbg=blue
"hi statuslineNC term=inverse cterm=bold ctermfg=white ctermbg=blue

" another funky one
" Format the status line
"              Truncate here                     Filetype  Linebreaks: (D)os (M)ac (U)nix  
"              | Filename for unmodified file           |  |         Split justification
"              | |             and for modified file    |  |         | Position
"              | |             |                        |  |         | |
"              [][------------][--------------------]   [] [-------] [][-----------------]
"set statusline=%<%{StatusFN(0)}%1*%{StatusFN(1)}%m%0*\ (%Y/%{&ff[0]})%=%-14.(%l,%c%V%)\ %P
" funky status line ..
"set statusline=%1*[%02n]%*\ %2*%F%*\ %(\ %M%R%H)%)%=%3*Pos=<%l,%c%V>%*"set statusline=%1*[%02n]%*\ %F%*\ %(%M%R%H)%)%=Pos=<%l,%c%V>%*
"  User1: color for buffer number
"hi User1 ctermfg=green ctermbg=black
"  User2: color for filename
"hi User2 ctermfg=black ctermbg=white
"hi User2 ctermfg=red ctermbg=white
"  User3: color for position
"hi User3 ctermfg=blue ctermbg=white

"colors wombat256
colors torte

set laststatus=2 " always show the status line
set fo=tcrqn " See Help (complex)
set ai " autoindent
set si " smartindent 
set cindent " do c-style indenting
set tabstop=4 " tab spacing (settings below are just to unify it)
set softtabstop=4 " unify
set shiftwidth=4 " unify 
"set expandtab
set smarttab " use tabs at the start of a line, spaces elsewhere

"let perl_extended_vars=1 " highlight advanced perl vars inside strings
"function! SuperRetab(width) range
"   silent! exe a:firstline . ',' . a:lastline . 's/\v%(^ *)@<= {'. a:width .'}/\t/g'
"endfunction
"map <A-i> i <ESC>r " alt-i (normal mode) inserts a single char, and then switches back to normal
"map <F2> <ESC>ggVG:call SuperRetab()<left>
"map <F12> ggVGg? " encypt the file (toggle)
"au BufNewFile,BufRead *.asp :set ft=aspjscript " all my .asp files ARE jscript
"au BufNewFile,BufRead *.tpl :set ft=html " all my .tpl files ARE html
"au BufNewFile,BufRead *.hta :set ft=html " all my .tpl files ARE html
"iab xasp <%@language=jscript%><CR><%<CR><TAB><CR><BS>%><ESC><<O<TAB>
"iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
"
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
autocmd BufEnter * syntax sync fromstart " ensure every file does syntax highlighting (full)

au BufReadPost * set tabstop=4 softtabstop=4 shiftwidth=4 nosmarttab

au BufReadPost *.tcl set expandtab tabstop=4 softtabstop=4 shiftwidth=4
au BufReadPost *.tcl set autoindent nosmartindent et sts=4
au BufReadPost *.tcl inoremap # #

au BufReadPost *.exp set expandtab tabstop=4 softtabstop=4 shiftwidth=4
au BufReadPost *.exp set autoindent nosmartindent et sts=4
au BufReadPost *.exp inoremap # #

autocmd FileType expect inoremap # #

"autocmd FileType python set autoindent smartindent et sts=4 cinwords=class,def,elif,else,except,finally,for,if,try,while
"autocmd FileType python inoremap # #
au BufReadPost *.js set autoindent smartindent et sts=4
au BufReadPost *.php set autoindent smartindent et sts=4
au BufReadPost *.php source ~/.vim/plugin/DoxygenToolkit.vim
au BufReadPost *.php :set comments=sr:/*,mb:*,ex:*/,b:#,:%,:XCOMM,n:>,fb:-
"au BufReadPost *.php :s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
"
au BufReadPost *.phtml set autoindent smartindent et sts=4
au BufReadPost *.phtml source ~/.vim/plugin/DoxygenToolkit.vim
au BufReadPost *.phtml :set comments=sr:/*,mb:*,ex:*/,b:#,:%,:XCOMM,n:>,fb:

" check syntax with Ctrl + L
if executable('/usr/bin/env')
    autocmd FileType php noremap <C-L> :!/usr/bin/env php -l %<CR>
    autocmd FileType phtml noremap <C-L> :!/usr/bin/env php -l %<CR>
elseif executable('/bin/env')
    autocmd FileType php noremap <C-L> :!/bin/env php -l %<CR>
    autocmd FileType phtml noremap <C-L> :!/bin/env php -l %<CR>
elseif executable('/PHP/php.exe')
    autocmd FileType php noremap <C-L> :!/PHP/php.exe -l %<CR>
    autocmd FileType phtml noremap <C-L> :!/PHP/php.exe -l %<CR>
endif

au BufReadPost *.tpl set ft=php

au BufReadPost *.py set autoindent smartindent et sts=4 cinwords=class,def,elif,else,except,finally,for,if,try,while
au BufReadPost *.py inoremap # #
au BufReadPost *.py set expandtab tabstop=4 softtabstop=4 shiftwidth=4
au BufReadPost *.mako set expandtab

au BufReadPost *.as :set ft=actionscript
au BufReadPost *.as :source ~/.vim/syntax/actionscript.vim

source ~/.vim/cmdalias.vim
:call CmdAlias("Wq", "wq")
:call CmdAlias("WQ!", "wq!")
:call CmdAlias("Wq!", "wq!")
:call CmdAlias("wQ!", "wq!")
:call CmdAlias("W", "w")
:call CmdAlias("Q", "q")
:call CmdAlias("WQ", "wq")
:call CmdAlias("wQ", "wq")
:call CmdAlias("Q!", "q!")
:call CmdAlias("Set", "set")
:call CmdAlias("SET", "set")
:call CmdAlias("sET", "set")


" bind some bash shortcuts to do the same thing in vim
"

" kill the remainder of the line
map  <C-k> <ESC>d$
imap <C-k> <ESC>d$$a

" go to the beginning of the line
"map  <C-a> <ESC>0
"imap <C-a> <ESC>0i

" transpose two characters
map  <C-t> <ESC>vxp
imap <C-t> <ESC>vxpi

" delete previous word
"map  <C-w> <ESC>db
"imap <C-w> <ESC>dbi

" delete entire line
map  <C-u> <ESC>0d$
imap <C-u> <ESC>0d$i


" forward one word
map  <A-f> <ESC>w
imap <A-f> <ESC>wi

" backwards one word
map  <A-b> <ESC>b
imap <A-b> <ESC>bi

" go to the end of the line
map  <C-e> <ESC>$
imap <C-e> <ESC>$a

" transpose two adjacent words
"map <A-t> <ESC>

" toggle case sensitivity
nnoremap \tc :set invignorecase ignorecase?<CR>
nmap <F3> \tc
imap <F3> <C-O>\tc
"set ignorecasetoggle=<F3>

" The paste option is intended for invoking temporarily while pasting in text.
" It avoids things like autoindent causing .stepped. text. This defines the \tp
" (.toggle paste.) mapping, also set to <F4>  in both normal and insert mode:
nnoremap \tp :set invpaste paste?<CR>
nmap <F4> \tp
imap <F4> <C-O>\tp
set pastetoggle=<F4>

source ~/.vim/plugin/taglist.vim

" This defines \tf (.toggle format.) and <F2> to toggle whether lines should
" automatically be wrapped as they are typed:
nnoremap \tf :if &fo =~ 't' <Bar> set fo-=t <Bar> else <Bar> set fo+=t <Bar>
  \ endif <Bar> set fo?<CR>
nmap <F5> \tf
imap <F5> <C-O>\tf

" This defines \tl (.toggle list.) and <F2> to toggle indicating non-printing
" characters:
nnoremap \tl :set invlist list?<CR>
nmap <F6> \tl

if has("gui")
  set lines=82
  set columns=120

  nnoremap <C-Up> :silent! let &guifont = substitute(
   \ &guifont,
   \ ':h\zs\d\+',
   \ '\=eval(submatch(0)+1)',
   \ '')<CR>
  nnoremap <C-Down> :silent! let &guifont = substitute(
   \ &guifont,
   \ ':h\zs\d\+',
   \ '\=eval(submatch(0)-1)',
   \ '')<CR>


  colorscheme jay-xoria256
  map <F4> :TlistToggle<CR>:colorscheme jay-xoria256<CR>
  let Tlist_Use_Right_Window = 1

  " space / shift-space scroll in normal mode
  noremap <S-space> <C-b>
  noremap <space> <C-f>

else

  "colorscheme jay-xoria256
  map <F4> :TlistToggle<CR>
  let Tlist_Use_Right_Window = 1

  " space / shift-space scroll in normal mode
  noremap <S-K> <C-b>
  noremap <S-J> <C-f>
endif







:highlight LineNr term=NONE cterm=NONE ctermfg=Gray ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE


"nnoremap <S-J> :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-D>:set scroll=0<CR>



"Jason Fan and Jason Krone .vimrc - inspired by soon to be Dr. Woogerd"
set encoding=utf-8
set guifont=Liberation\ Mono\ for\ Powerline\ 10
"*********************** VUNDLE PACKAGE MANAGER **********************
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"" PLUGINS 
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
"" /PLUGINS
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ****** AIRLINE
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
""if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif

"let g:airline_symbols.space = "\ua0"
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '◀'
""let g:airline_symbols.linenr = '␊'
""let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
""let g:airline_symbols.paste = 'Þ'
""let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
"

"**************************** GENERAL *************************
:syntax on


"Check UTF-8 compatibility and set work environment
if has("multi_byte")
        if &termencoding == ""
            let &termencoding = &encoding
        endif
        set encoding=utf-8
        setglobal fileencoding=utf-8
        "setglobal bomb
        set fileencodings=ucs-bom,utf-8,latin1
endif
"/*****************************************************************************/
if filereadable("compile")
        set makeprg=sh\ compile
elseif filereadable("compile.sh")
        set makeprg=sh\ compile.sh
endif

:command -nargs=* Mk :make -link "<args>"
":nmap mm :w <CR> :Mk 
:nmap mm :w <CR> :!clear <CR> :make
":nmap MAKE :make\ -link
au BufRead,BufNewFile *.pde     setf processing
:command P :! processing-java --force --sketch=$PWD/ --output=temp --run

"***************************** FORMATING (Linux Kernel) ***********************


:filetype on

"INDENTATION
set guicursor+=a:blinkon1
"set tabs to 8 spaces
set expandtab       "inserts space characters when tab key is pressed
set smarttab
set ai "Auto indent
set si "Smart indent

if (&filetype=='c' || &filetype=='cpp')
        set shiftwidth=8  "spaces per indent
        set tabstop=8     "spaces per tab
else
        set shiftwidth=4
        set tabstop=4
endif

" bracket and paren auto expansion
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i

"*********************** Vim Interface *************************************
"Cursor
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set gcr=n-v-c:block-Cursor
set gcr+=i:ver100-iCursor
set gcr+=n-v-c-i:blink1
set gcr+=n-v-c-i:blinkwait10

"Line Numbers
set number
set numberwidth=2
set ruler
"turn off spellcheck by default
set nospell

"Highlight matching braces
set showmatch
set mat=2   "highlight blink time

"Backspace as it should work
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"Text width and wrapping configuration

set textwidth=80
set tw=80
set wrap "set wrap
set wrapmargin=80
"highlight lines above 80 chars
"highlight OverLength ctermbg=red ctermfg=white guibg=#fc322f
"match OverLength /\%81v.\+/


"SEARCH
"Ignore case when serching
set ignorecase

"********************** Key Remapping / Moving around *********************

imap jj <Esc>
"nmap ; :
nmap :W :w
nmap :Q :q
nmap :WQ :wq
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-Down> <C-W>j
map <C-Up> <C-W>k
map <C-Left> <C-W>h
map <C-Right> <C-W>l

"DISABLE ARROWKEYS
"noremap <Left> <NOP>
"noremap <Right> <NOP>
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"imap <Left> <NOP>
"imap <Right> <NOP>
"imap <Up> <NOP>
"imap <Down> <NOP>
"

"autocomplete with <tab>
function! Tab_Or_Complete()
if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
else
        return "\<Tab>"
                endif
                endfunction
                :inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
                :set dictionary="/usr/dict/words"


imap {<CR> {<CR><CR>}<UP><TAB>

                "separation lines
abb clin /*****************************************************************************/
abb dlin +-----------------------------------------------------------------------------+
abb islib #include <stdlib.h>
abb isio #include <stdio.h>
abb isass #include <assert.h>
abb #i #include


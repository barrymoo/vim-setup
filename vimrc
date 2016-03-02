set nocompatible
filetype off

" Vundle Setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Our Plugins
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'SirVer/ultisnips'
Bundle 'Shougo/neocomplete'
Bundle 'ervandew/supertab'
Bundle 'vim-latex/vim-latex'

" Plugin Options
filetype plugin indent on
filetype plugin on

" Necessary mouse improvements
set mouse=a
set iskeyword+=.
set iskeyword+=-
set clipboard=unnamed

" My Favorites
set number
set ruler
set splitright
set showmatch
set hlsearch
set incsearch
syntax on
set pastetoggle=<F2>
nnoremap Q <nop>

" No Swap Files
set nobackup
set noswapfile

" Sometimes the backspace doesn't work
set backspace=2

" Some useful maps
let mapleader=','
nnoremap ; :
map <leader>z <C-w><C-w>
nmap <silent> <leader>/ :nohlsearch<CR>
nmap <leader>s :setlocal spell! spell?<CR>
nmap <leader>wa :wqa<CR>
nmap <leader>ww :w<CR>
nmap <leader>qa :qa<CR>
nmap <leader>qq :bd<CR>
set pastetoggle=<F2>

" Tab behavior
set shiftround
set expandtab
set tabstop=4
set shiftwidth=4

" Latex
" I hate the folding in vim-latex suite
autocmd FileType tex setlocal nofoldenable
nmap <leader>lc :! runlatex % > logfile 2>&1 &<CR><CR>
nmap <leader>pc :! pdflatex % > logfile 2>&1 &<CR><CR>
nmap <leader>lo :! open %:r.pdf > /dev/null 2>&1 &<CR><CR>

" Gnuplot
nmap <leader>gc :! gnuplot % > /dev/null 2>&1 &<CR><CR>
nmap <leader>go :! open %:r.eps > /dev/null 2>&1 &<CR><CR>

"Code Block Movement
vnoremap < <gv
vnoremap > >gv

" Fortran
let fortran_free_source=1

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'c'
nmap <leader>cp :CtrlP <CR>

" Avogadro Development
autocmd FileType cpp set tabstop=2 shiftwidth=2

" UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
nmap <leader>ue :UltiSnipsEdit <CR>
let g:UltiSnipsEditSplit = 'vertical'

" Neocomplete
let g:neocomplete#enable_at_startup = 1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType cpp setlocal omnifunc=omni#cpp#complete#Main

" Full Screen gVim
set colorcolumn=81
if has("gui_running")
    set lines=999 columns=999
    set background=dark
    set guifont=Monaco:h16
    autocmd VimLeave * :!open -a ITerm
else
    highlight Pmenu ctermbg=7 guibg=LightGray
    highlight PmenuSel ctermbg=4 guibg=DarkGray guifg=White
    highlight SpellBad ctermbg=4
    highlight IncSearch ctermbg=4
    highlight ColorColumn ctermbg=4
endif

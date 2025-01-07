" vim: foldmethod=marker sw=2 ts=2 expandtab

syntax enable
silent! colorscheme default
set backspace=2
set backup
set backupdir=$HOME/.vim_backup
set cindent
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set encoding=utf-8
set expandtab
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,utf-16,utf-16le,latin1
set fileformats=unix,dos,mac
set formatoptions+=mM
set formatoptions-=ro
set hidden
set hlsearch
set ignorecase
set laststatus=2
set lazyredraw
set list
set listchars=tab:»\ ,trail:-,extends:»,precedes:«,nbsp:%
set nocp incsearch
set number
set scrolloff=5
set shiftwidth=4
set showcmd
set smartcase
set smarttab
set t_Co=256
set ttimeoutlen=50
set vb t_vb=
set wildmenu
set wildmode=list:longest
set undodir=$HOME/.vim_undo
set undofile

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap <Down> g<Down>
nnoremap <Up> g<Up>
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
vnoremap <Down> g<Down>
vnoremap <Up> g<Up>

nnoremap <Space>a 0
nnoremap <Space>e $

nnoremap q: :q
nnoremap <Space>q q:

inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>

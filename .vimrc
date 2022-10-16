""""""""""""""""""""""""""""""
"           .vimrc           "
""""""""""""""""""""""""""""""

set nocompatible
set vb t_vb = 
set noerrorbells

"====== エンコード関係 ======"
set encoding=utf-8
set fileencodings=utf-8,euc-jp,cp932,iso-2022-jp,sjis
set fileformats=unix,dos,mac


"========= 保存関係 ========="
set nobackup
set noswapfile
set autoread
set confirm
set hidden


"========= 色関係 ========="
syntax enable
colorscheme industry
set background=dark
set showmatch matchtime=1


"===== ステータス関係 ====="
set laststatus=2
set statusline=%-(%f%m%h%r%w%)%=%{&ff}\|%{&fenc}\ %y%c,%l/%L\ %0P
set showcmd
set wildmenu


"===== ウィンドウ関係 ====="
set splitbelow
set splitright


"======= 行番号関係 ======="
set number
set relativenumber
set cursorline


"======= 表示関係 ======="
set wrap
set notitle
set ruler
set scrolloff=5


"======= Tab関係 ======="
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set list 
set listchars=tab:»-,trail:~,eol:↲,extends:»,precedes:«,nbsp:%


"======= 検索関係 ======="
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch
set pumheight=5


"=== インデント関係 ==="
set autoindent
set smarttab
set smartindent
set cindent

if has("autocmd")
  filetype plugin on
  filetype indent on

  autocmd FileType c	setlocal softtabstop=2 shiftwidth=2 tabstop=2 expandtab
  autocmd FileType cpp	setlocal softtabstop=2 shiftwidth=2 tabstop=2 expandtab
  autocmd FileType python	setlocal softtabstop=4 shiftwidth=4 tabstop=4 expandtab
endif


"=== キーマップ ==="
let mapleader = "\<Space>"

" 移動系
nnoremap j gj
nnoremap k gk

nnoremap H ^
nnoremap J L
nnoremap K H
nnoremap L $

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

nnoremap <C-a> <Home>
nnoremap <C-e> <End>

" コピー＆ペースト関係
nnoremap Y y$
nnoremap p ]p
nnoremap P ]P

nnoremap <CR> o<Esc>
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap <silent> <Leader>f :let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>
nmap <Leader>s <Leader>f:%s/<C-r>///g<LEFT><LEFT>

" インデント
vnoremap > >gv
vnoremap < <gv
nnoremap > >>
nnoremap < <<

" インクリメント＆デクリメント
nnoremap + <C-a>
nnoremap - <C-x>


augroup vimrcEx
    au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" | endif
augroup END


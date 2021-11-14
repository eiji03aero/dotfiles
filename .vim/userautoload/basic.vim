"----------------------------------------
" Required by dein
" ---------------------------------------
filetype plugin indent on
syntax enable
"----------------------------------------
" Basic config
" ---------------------------------------
set wildmenu
set wildmode=list
set hidden
set encoding=utf-8
set fileencoding=utf-8
set scrolloff=2
set noswapfile
set nowritebackup
set nobackup
set ttyfast
set updatetime=2000
set lazyredraw
if v:version > 800
  set belloff=all
  set completeopt=menu,noselect
endif
"----------------------------------------
" Search
"----------------------------------------
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch
"----------------------------------------
" Display
"----------------------------------------
syntax on
" statusline --------------------
" set statusline=%F
" set statusline+=%m
" set statusline+=%r
" set statusline+=%h
" set statusline+=%w
" set statusline+=%=
" set statusline+=[ROW=%l/%L]
set laststatus=2
set showtabline=2
set showcmd
set cmdheight=2
" indent/space --------------------
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set autoindent
set smartindent

set list
set listchars=tab:>-,trail:.
set autoread
set showmatch matchtime=0
set nofoldenable
set number relativenumber
set display=lastline
set history=50
set clipboard=unnamed
set nrformats=
set pumheight=20
set whichwrap=b,s,h,l,<,>,[,],~
set mouse=a
set backspace=indent,eol,start
set cursorline
set synmaxcol=500
set shortmess+=c
set signcolumn=yes
" rtp related --------------------
set rtp+=/usr/local/opt/fzf
" language --------------------
set dictionary+=/usr/share/dict/words
" set spell spelllang=en_us
"----------------------------------------
" Custom auro groups
"----------------------------------------
augroup custom_augroup
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
  " autocmd VimEnter * execute 'NERDTree'
  autocmd FilterWritePre * if &diff | setlocal wrap< | endif
  autocmd FileType vim setlocal foldmethod=indent
  autocmd FileType nerdtree setlocal signcolumn=no
  autocmd BufRead,BufNewFile *.jsx set filetype=javascript.jsx
  autocmd BufRead,BufNewFile *.tsx set filetype=typescript.tsx
  " autocmd FileType vue syntax sync fromstart
augroup END
"----------------------------------------
" Extra config
"----------------------------------------
colorscheme wombat2
" let g:jsx_ext_required = 0
let g:vim_json_syntax_conceal = 0
let g:gutentags_enabled = 0

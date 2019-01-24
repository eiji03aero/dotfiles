"----------------------------------------
" Required by dein
" ---------------------------------------
filetype plugin indent on
syntax enable
"----------------------------------------
" Basic config
" ---------------------------------------
set wildmenu
set wildmode=list:full
set hidden
set encoding=utf-8
set fileencoding=utf-8
set scrolloff=2
set noswapfile
set nowritebackup
set nobackup
set belloff=all
set ttyfast
set updatetime=2000
set completeopt=menu,noselect
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
set statusline=%F
set statusline+=%m
set statusline+=%r
set statusline+=%h
set statusline+=%w
set statusline+=%=
set statusline+=[ROW=%l/%L]
set laststatus=2
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
set number
set display=lastline
set history=50
set clipboard=unnamed
set nrformats=
set pumheight=15
set whichwrap=b,s,h,l,<,>,[,],~
set mouse=a
set backspace=indent,eol,start
set cursorline
set synmaxcol=500
" rtp related --------------------
set rtp+=/usr/local/opt/fzf
" dictionary --------------------
set dictionary=/usr/share/dict/words
"----------------------------------------
" Custom auro groups
"----------------------------------------
augroup custom_augroup
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
  " autocmd VimEnter * execute 'NERDTree'
  autocmd FilterWritePre * if &diff | setlocal wrap< | endif
  autocmd FileType vim setlocal foldmethod=indent
  autocmd BufRead,BufNewFile *.jsx set filetype=javascript.jsx
augroup END
"----------------------------------------
" Extra config
"----------------------------------------
let g:jsx_ext_required = 0
let g:vim_json_syntax_conceal = 0

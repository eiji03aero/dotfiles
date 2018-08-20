"Adein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/eijiosakabe/.vim/dein')
  call dein#begin('/Users/eijiosakabe/.vim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/eijiosakabe/.vim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/dein.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-endwise')
  " call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('rking/ag.vim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('vim-scripts/dbext.vim')
  " operaionals-------------------- 
  call dein#add('junegunn/fzf.vim')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('mattn/emmet-vim')
  call dein#add('tyru/caw.vim')
  call dein#add('tyru/open-browser.vim')
  call dein#add('tpope/vim-surround')
  " Display--------------------
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('Yggdroot/indentLine')
  call dein#add('thinca/vim-splash')
  " Syntax--------------------
  call dein#add('dag/vim2hs')
  call dein#add('hdima/python-syntax')
  call dein#add('fatih/vim-go')
  call dein#add('tpope/vim-rails')
  call dein#add('othree/html5.vim')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('wavded/vim-stylus')
  call dein#add('othree/yajs.vim')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('slim-template/vim-slim')
  call dein#add('digitaltoad/vim-pug')
  call dein#add('posva/vim-vue')
  call dein#add('mxw/vim-jsx')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('elzr/vim-json')
  call dein#add('mattn/webapi-vim')
  call dein#add('tell-k/vim-browsereload-mac')
  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

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
"----------------------------------------
" Custom config
"----------------------------------------
let g:jsx_ext_required = 0
let g:vim_json_syntax_conceal = 0
let g:splash#path = '/Users/eijiosakabe/Documents/data/my_pg/tools/vim-splash/vim_intro.txt'
packadd termdebug
"----------------------------------------
" Custom commands
"----------------------------------------
" Basics ----------------------------------------
let mapleader = "\<Space>"
let g:user_emmet_expandabbr_key = '<c-e>'
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap <Leader>ta :Terminal<CR>source $HOME/.bash_profile<CR>
nnoremap <Leader>wb :sp<CR>
nnoremap <Leader>wv :vsp<CR>
nnoremap <Leader>wn :vnew<CR>
nnoremap <Leader>wm :new<CR>
nnoremap <Leader>wi :tabn<CR>
nnoremap <Leader>wu :tabN<CR>
nnoremap <Leader>wc :tabc<CR>
nnoremap <Leader>wo :tabe<CR>
nnoremap <Leader>wy :tabo<CR>
nnoremap <Leader>wj :%! jq '.'<CR>
nnoremap <Leader>we :e .<CR>
nnoremap <Leader>wl $
nnoremap <Leader>wh 0
nnoremap <Leader>wp %
nnoremap <Leader>n :cn<CR>
nnoremap <Leader>p :cp<CR>
nnoremap <Leader>s :%s/
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
nnoremap <Leader>y :call YankPathToClip()<CR>
" Insert mode ----------------------------------------
inoremap <C-C> <ESC>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap `<Enter> ``<Left><CR><ESC><S-o>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap ` ``<LEFT>
inoremap <C-f>^ <%  %><LEFT><LEFT><LEFT>
inoremap <C-f>- <%-  %><LEFT><LEFT><LEFT>
inoremap <C-f>= <%=  %><LEFT><LEFT><LEFT>
inoremap <C-f>. ->
inoremap <C-f>> =>
inoremap <C-f>, <-
inoremap <C-f>< <=
inoremap <C-f>i <Bar>
inoremap <C-f>d $
inoremap <C-f>b \
inoremap <C-f>u _
inoremap <C-f>a &
inoremap <C-f>p %
inoremap <C-f>l <C-o>$
inoremap <C-f>o <C-o>o
inoremap <expr><C-i> neocomplete#complete_common_string()
" Visual mode ----------------------------------------
vnoremap n %
" Terminal mode ----------------------------------------
tnoremap <C-w>q <C-w>:quit!<CR>
tnoremap <C-w>d <C-w>:hide<CR>
tnoremap <Esc> <C-w><S-n>
" File-related shortcuts ----------------------------------------
nnoremap <Leader>mv :e ~/.vimrc<CR>
nnoremap <Leader>mh :e ~/.hyper.js<CR>
nnoremap <Leader>mt :e ~/.tmux.conf<CR>
nnoremap <Leader>mbp :e ~/.bash_profile<CR>
nnoremap <Leader>mbr :e ~/.bashrc<CR>
nnoremap <Leader>me :e ~/.enhancd/enhancd.log<CR>
nnoremap <Leader>sv :source ~/.vimrc<CR>
nnoremap <Leader>st :source ~/.tmux.conf<CR>
" fzf ----------------------------------------
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fg :Ag<space>
nnoremap <Leader>fc :Commits<CR>
nnoremap <Leader>fs :GFiles?<CR>
" Git ----------------------------------------
nnoremap <Leader>gis :Gstatus<CR>
nnoremap <Leader>gia :Gwrite<CR>
nnoremap <Leader>gir :Gread<CR>
nnoremap <Leader>gic :Gcommit<CR>
nnoremap <Leader>gib :Gblame<CR>
nnoremap <Leader>gid :Gdiff<CR>
" Vim-rails ----------------------------------------
nnoremap <Leader>rc :Econtroller<Space>
nnoremap <Leader>re :Eenvironment<Space>
nnoremap <Leader>ri :Einitializer<CR>
nnoremap <Leader>rh :Ehelper<Space>
nnoremap <Leader>rmi :Emigration<Space>
nnoremap <Leader>rmo :Emodel<Space>
nnoremap <Leader>rtf :Efunctionaltest<Space>
nnoremap <Leader>rti :Eintegrationtest<Space>
nnoremap <Leader>rtu :Eunittest<Space>
nnoremap <Leader>ra :A<CR>
nnoremap <Leader>rr :R<CR>
" Vim-splash ----------------------------------------
nnoremap <Leader>vsi :Splash ~/Documents/data/my_pg/tools/vim-splash/vim_intro.txt<CR>
nnoremap <Leader>vsc :Splash ~/Documents/data/my_pg/tools/vim-splash/conciergeu_logo.txt<CR>
" NERD-tree ----------------------------------------
nnoremap <C-n> :NERDTreeToggle<CR>
" EasyMotion ----------------------------------------
noremap <Leader> <Plug>(easymotion-prefix)
" nmap <Leader>s <Plug>(easymotion-overwin-f2)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)
" EasyAlign ----------------------------------------
vmap ga <Plug>(EasyAlign)
" OpenBrowser ----------------------------------------
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
"----------------------------------------
" Custom Functions
"----------------------------------------
function! YankPathToClip ()
  echo "Yanked the path to clipboard: " expand('%:p')
  let @+ = expand('%:p')
endfunction

function! s:bufnew()
  if &buftype == "terminal" && &filetype == ""
    set filetype=terminal
  endif
endfunction

function! s:filetype()
endfunction

function! s:open(args) abort
  if empty(term_list())
    execute "terminal" a:args
  else
    let bufnr = term_list()[0]
    execute term_getsize(bufnr)[0] . "new"
    execute "buffer + " bufnr
  endif
endfunction

command! -nargs=*
\   Terminal call s:open(<q-args>)

augroup my-terminal
  autocmd!
  autocmd BufNew * call timer_start(0, { -> s:bufnew() })
  autocmd FileType terminal call s:filetype()
augroup END
"----------------------------------------
" Custom AutoGroups
"----------------------------------------
augroup custom_augroup
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
  " autocmd VimEnter * execute 'NERDTree'
  autocmd FilterWritePre * if &diff | setlocal wrap< | endif
  autocmd FileType vim setlocal foldmethod=indent
  " autocmd BufRead,BufNewFile *.es6 setfiletype javascript
augroup END
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
" statusline--------------------
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
" indent/space--------------------
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
set synmaxcol=3000
" rtp related--------------------
set rtp+=/usr/local/opt/fzf

augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END
" ----------------------------------------
" Colorscheme
"----------------------------------------
" Basics--------------------
hi SpecialKey   ctermfg = 235
hi Directory    ctermfg = blue
hi Search       ctermfg = black       ctermbg = lightyellow
hi IncSearch    ctermfg = white       ctermbg = darkblue
hi LineNr       ctermfg = grey
hi CursorLine   cterm   = underline   ctermfg = none ctermbg = none
hi CursorLineNr ctermfg = darkblue
hi StatusLine   ctermfg = black       ctermbg = grey
hi StatusLineNC ctermfg = darkgrey    ctermbg = white
hi WildMenu     ctermfg = white       ctermbg = darkblue
hi VertSplit    ctermbg = 234         ctermfg = 234
hi Title        ctermfg = red
hi SpellRare    ctermfg = black
hi Pmenu        ctermfg = grey        ctermbg = black
hi PmenuSel     ctermfg = white       ctermbg = darkblue
hi preProc      ctermfg = cyan
hi Terminal     ctermbg = black    ctermfg = white
" Syntax--------------------
hi MatchParen ctermfg = yellow  ctermbg = darkgrey
hi Comment    ctermfg = grey
hi Constant   ctermfg = darkgreen
hi Special    ctermfg = red
hi Identifier ctermfg = red
hi Statement  ctermfg = yellow
hi Type       ctermfg = darkblue
hi Ignore     ctermfg = darkgrey
hi DiffAdd    cterm   = bold  ctermfg = 10 ctermbg = 22
hi DiffDelete cterm   = bold  ctermfg = 10 ctermbg = 52
hi DiffChange cterm   = bold  ctermfg = 10 ctermbg = 17
hi DiffText   cterm   = bold  ctermfg = 10 ctermbg = 21
hi Folded     ctermfg = white ctermbg = darkblue
hi FoldColumn ctermfg = white ctermbg = black
"----------------------------------------
" NERDTree
"----------------------------------------
let g:NERDTreeShowBookmarks=1
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 40
let g:NERDTreeIndicatorMapCustom = {
  \ "Modified"  : "✹",
  \ "Staged"    : "✚",
  \ "Untracked" : "✭",
  \ "Renamed"   : "➜",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "✖",
  \ "Dirty"     : "✗",
  \ "Clean"     : "✔︎",
  \ "Unknown"   : "?"
  \ }
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('hs',     '208',          'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('py',     'yellow',       'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('go',     '250',          'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'darkblue',     'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',       'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',       'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',       'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('lock',   '250',          'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   '208',          'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'white',        'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('slim',   'red',          'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'blue',         'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    '208',          'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('scss',   'lightmagenta', 'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'red',          'none', 'red',     '#151515')
call NERDTreeHighlightFile('js',     'yellow',       'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('jsx',    'yellow',       'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('coffee', '208',          'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('ts',     '208',          'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('tsx',    '208',          'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta',      'none', '#ff00ff', '#151515')
"----------------------------------------
" airline
"----------------------------------------
let g:airline_theme                             = 'jellybeans'
let g:airline_powerline_fonts                   = 0
let g:airline#extensions#tabline#enabled        = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled     = 0
let g:airline#extensions#whitespace#symbol      = '!'
let g:airline#extensions#branch#enabled         = 0
let g:airline_branch_prefix                     = '⭠ '
let g:airline#extensions#readonly#symbol        = '⭤ '
let g:airline#extensions#branch#enabled         = 1
let g:airline#extensions#readonly#enabled       = 1
"----------------------------------------
" emmet-vim
"----------------------------------------
let g:user_emmet_mode = 'iv'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
  \ 'variables': {
  \   'lang' : 'ja',
  \ },
  \ 'html' : {
  \   'filters':     'html',
  \   'indentation': '  ',
  \ },
  \ 'css' : {
  \   'filters':     'fc',
  \   'indentation': '  ',
  \ },
  \ 'javascript.jsx': {
  \   "extends":     'jsx',
  \   "indentation": '  ',
  \ },
  \ 'php' : {
  \   'extends':     'html',
  \   'filters':     'html',
  \   'indentation': '  ',
  \ },
  \ 'erb' : {
  \   'expands':     'html',
  \   'filters':     'html',
  \   'indentation': '  ',
  \ }
  \}
augroup EmmetVim
  autocmd!
  autocmd FileType * let g:user_emmet_settings.indentation = ' '[:&tabstop]
augroup END
"----------------------------------------
" neocomplete
"----------------------------------------
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'
"----------------------------------------
" easymotion
"----------------------------------------
let g:EasyMotion_smartcase = 1
"----------------------------------------
" rsense
"----------------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
augroup my_rsense
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
augroup END
let g:rsenseHome = expand("/Users/eijiosakabe/.rbenv/shims/rsense")
let g:rsenseUseOmniFunc = 1
"----------------------------------------
" vim-go
"----------------------------------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 0
"----------------------------------------
" sql-completion
"----------------------------------------
let g:loaded_sql_completion = 0
let g:omni_sql_no_default_maps = 1
"----------------------------------------
" typescript-vim
"----------------------------------------
" let g:typescript_indent_disable = 1
"----------------------------------------
" fzf
"----------------------------------------
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['fg', 'Normal'],
  \ 'hl':      ['fg', 'Directory'],
  \ 'fg+':     ['fg', 'CursorLine'],
  \ 'bg+':     ['fg', 'CursorLineNr'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'StatusLine'],
  \ 'pointer': ['fg', 'CursorLineNr'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
"----------------------------------------
" qfixhowm
"----------------------------------------
set runtimepath+=~/qfixhowm
let QFixHowm_Key = 'g'
let QFixHowm_FileType = 'qfix_memo'
let howm_dir             = '~/howm'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'
"----------------------------------------
" vim2hs
"----------------------------------------
let g:haskell_conceal_enumerations = 1

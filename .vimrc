set nocompatible

" -------------------- Plugins --------------------
if !filereadable(expand('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()

Plug '/Users/eijiosakabe/Projects/claudecode.vim', { 'do': 'cd mcp-server && npm install' }
Plug 'honza/vim-snippets'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'sodapopcan/vim-twiggy'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'tyru/caw.vim'
Plug 'tpope/vim-surround'
Plug 't9md/vim-textmanip'
Plug 'Yggdroot/indentLine'
Plug 'michaeljsmith/vim-indent-object'
Plug 'thinca/vim-splash'
Plug 'tpope/vim-endwise'
Plug 'eiji03aero/quick-notes'
Plug 'brooth/far.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'lambdalisue/fern.vim'
Plug 'yuki-yano/fern-preview.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'neoclide/coc.nvim'
Plug 'eiji03aero/any-jump.vim'

" -------------------- javascript --------------------
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'typescript'] }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'jparise/vim-graphql', { 'for': 'graphql' }
Plug 'elmcast/elm-vim', { 'for': 'elm' }
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'leafOfTree/vim-vue-plugin', { 'for': 'vue' }
Plug 'prettier/vim-prettier', { 'for': ['javascript', 'typescript', 'css', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
" -------------------- dart --------------------
Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
" -------------------- html --------------------
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'digitaltoad/vim-pug', { 'for': ['pug', 'vue'] }
Plug 'lepture/vim-jinja', { 'for': ['html', 'jinja2', 'jinja', 'njk'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
" -------------------- haskell --------------------
Plug 'dag/vim2hs', { 'for': 'haskell' }
" -------------------- cpp --------------------
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['cpp', 'h', 'hpp'] }
" -------------------- go --------------------
Plug 'mattn/vim-goimports', { 'for': 'go' }
" -------------------- python --------------------
Plug 'hdima/python-syntax', { 'for': 'python' }
" -------------------- kotlin --------------------
Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }
" -------------------- sql --------------------
Plug 'vim-scripts/dbext.vim', { 'for': 'sql' }
" -------------------- config --------------------
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'uarun/vim-protobuf', { 'for': 'proto' }

call plug#end()

if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  PlugInstall --sync | q
  call coc#util#install()
endif

" -------------------- Other settings --------------------
runtime! userautoload/*vim
runtime! userautoload/plugins/*vim

set rtp+=/opt/homebrew/opt/fzf

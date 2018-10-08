"Adein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/dein')
  call dein#begin('~/.vim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neco-vim')
  call dein#add('ujihisa/neco-look')
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  " operaionals-------------------- 
  call dein#add('scrooloose/nerdtree')
  call dein#add('tpope/vim-fugitive')
  call dein#add('junegunn/fzf.vim')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('mattn/emmet-vim')
  call dein#add('tyru/caw.vim')
  call dein#add('tpope/vim-surround')
  call dein#add('w0rp/ale')
  call dein#add('sjl/gundo.vim')
  call dein#add('majutsushi/tagbar')
  call dein#add('t9md/vim-textmanip')
  " Display--------------------
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('Yggdroot/indentLine')
  call dein#add('thinca/vim-splash')
  call dein#add('vim-scripts/dbext.vim')
  call dein#add('airblade/vim-gitgutter')
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

  call dein#add('tpope/vim-endwise')

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
" autoload
" ---------------------------------------
set runtimepath+=~/.vim/
runtime! userautoload/init/*vim
runtime! userautoload/plugins/*vim
runtime! userautoload/others/*vim

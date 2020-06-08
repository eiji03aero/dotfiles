set nocompatible

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(expand('~/.vim/rc/dein.toml'),      {'lazy': 0})
  call dein#load_toml(expand('~/.vim/rc/dein_lazy.toml'), {'lazy': 1})

  if v:version > 800 || has('nvim')
    call dein#load_toml(expand('~/.vim/rc/dein_v8.toml'))
  else
    echom 'hogeeee'
    call dein#load_toml(expand('~/.vim/rc/dein_v7.toml'))
  endif

  " commentout this line when need to deal with local plugin
  " call dein#local('~/projects')

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

runtime! userautoload/*vim
runtime! userautoload/plugins/*vim

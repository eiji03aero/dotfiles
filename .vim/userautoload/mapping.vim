"----------------------------------------
" Custom commands
"----------------------------------------
" Normal mode ----------------------------------------
let mapleader = "\<Space>"
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap <C-]> g<C-]>
" window
nnoremap <Leader>wb :sp<CR>
nnoremap <Leader>wv :vsp<CR>
nnoremap <Leader>wn :vnew<CR>
nnoremap <Leader>wN :call SplitWindowRight()<CR>
nnoremap <Leader>wm :new<CR>
nnoremap <Leader>wr :e!<CR>
nnoremap <Leader>ww :w<CR>
nnoremap <Leader>w- <C-w><Bar><C-w>_
nnoremap <Leader>w= <C-w>=
nnoremap <Leader>wa gg<S-v><S-g><CR>
nnoremap <Leader>wl $
nnoremap <Leader>wh 0
nnoremap <Leader>wp %
nnoremap <Leader>wo :on<CR>
nnoremap <Leader>wq :q<CR>
nnoremap <Leader>wQ :qa<CR>
" tab
nnoremap <Leader>tn :tabn<CR>
nnoremap <Leader>tp :tabp<CR>
nnoremap <Leader>ts :tab split<CR>
nnoremap <Leader>te :tabe<CR>
nnoremap <Leader>tc :tabc<CR>
nnoremap <Leader>to :tabo<CR>
nnoremap <Leader>tl :tabs<CR>
" buffer
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bl :ls<CR>
nnoremap <Leader>y :call YankPathToClip()<CR>
nnoremap <Leader>ct :! ctags -R<CR>
nnoremap <Leader>cp <C-w>}<CR>
nnoremap <Leader>cc :pc<CR>
nnoremap <Leader>cn :cn<CR>
nnoremap <Leader>cp :cp<CR>
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
nnoremap <Leader>, :call JustAppend(',')<CR>
nnoremap <Leader>; :call JustAppend(';')<CR>
nnoremap <Leader>x :call JustTrimTail()<CR>
nnoremap <Leader>ud :call OpenDoc()<CR>
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
inoremap <expr> ) OmitDuplicateCharacter(")")
inoremap <expr> } OmitDuplicateCharacter("}")
inoremap <expr> ] OmitDuplicateCharacter("]")
inoremap <C-f>{ {
inoremap <C-f>[ [
inoremap <C-f>( (
inoremap <C-f>" "
inoremap <C-f>' '
inoremap <C-f>` `
inoremap <C-f>^ <%  %><LEFT><LEFT><LEFT>
inoremap <C-f>- <%-  %><LEFT><LEFT><LEFT>
inoremap <C-f>= <%=  %><LEFT><LEFT><LEFT>
inoremap <C-f>. ->
inoremap <C-f>> =>
inoremap <C-f>, <-
inoremap <C-f>< <=
inoremap <C-f>d $
inoremap <C-f>a &
inoremap <C-f>p %
inoremap <C-f>l <C-o>$
inoremap <C-f>o <C-o>O
" Visual mode ----------------------------------------
vnoremap n %
vnoremap z/ y/<C-r>"<CR>
vnoremap z? y?<C-r>"<CR>
" Operator ----------------------------------------
onoremap in( :<c-u>normal! f(vi(<CR><LEFT><CR>
" Fold function ----------------------------------------
nnoremap <Leader>hi zi
nnoremap <Leader>hf zf
nnoremap <Leader>ha za
nnoremap <Leader>hA zA
nnoremap <Leader>hd zd
nnoremap <Leader>hR zR
nnoremap <Leader>hM zM
nnoremap <Leader>ht vit zf
nnoremap <Leader>ht vip zf
vnoremap <Leader>hf zf
" File-related shortcuts ----------------------------------------
nnoremap <Leader>mvv :e ~/.vim<CR>
nnoremap <Leader>mvm :e ~/.vim/userautoload/mapping.vim<CR>
nnoremap <Leader>mvp :e ~/.cache/dein/repos/github.com/<CR>
nnoremap <Leader>mh :e ~/.hyper.js<CR>
nnoremap <Leader>mt :e ~/.tmux.conf<CR>
nnoremap <Leader>mbp :e ~/.bash_profile<CR>
nnoremap <Leader>mbr :e ~/.bashrc<CR>
nnoremap <Leader>md :e ~/dotfiles<CR>
nnoremap <Leader>sv :source ~/.vimrc<CR>
nnoremap <Leader>st :source ~/.tmux.conf<CR>
" fzf ----------------------------------------
nnoremap ,b :Buffers<CR>
nnoremap ,w :Windows<CR>
nnoremap ,f :Files<CR>
nnoremap ,t :Tags<CR>
nnoremap ,g :Ag<CR>
nnoremap ,r :History<CR>
nnoremap ,c :Commits<CR>
nnoremap ,s :GFiles?<CR>
nnoremap ,d :Directories<CR>
" Git ----------------------------------------
nnoremap <Leader>gis :Gstatus!<CR>
nnoremap <Leader>gia :Gwrite<CR>
nnoremap <Leader>gir :Gread<CR>
nnoremap <Leader>gic :Gcommit<CR>
nnoremap <Leader>gib :Gblame<CR>
nnoremap <Leader>gid :Gdiff<CR>
nnoremap <Leader>gil :Glog<CR>
" Gitgutter ----------------------------------------
nnoremap <Leader>gig :GitGutterAll<CR>
" Vim-rails ----------------------------------------
nnoremap <Leader>rc :Econtroller<CR>
nnoremap <Leader>re :Eenvironment<CR>
nnoremap <Leader>ri :Einitializer<CR>
nnoremap <Leader>rh :Ehelper<CR>
nnoremap <Leader>rmi :Emigration<CR>
nnoremap <Leader>rmo :Emodel<CR>
nnoremap <Leader>rtf :Efunctionaltest<CR>
nnoremap <Leader>rti :Eintegrationtest<CR>
nnoremap <Leader>rtu :Eunittest<CR>
nnoremap <Leader>rv :Eview<CR>
nnoremap <Leader>ra :A<CR>
nnoremap <Leader>rr :R<CR>
" Vim-go ----------------------------------------
nnoremap <Leader>goi :GoImport<Space>
nnoremap <Leader>godr :GoDrop<Space>
nnoremap <Leader>godc :GoDoc<Space>
nnoremap <Leader>gol :GoLint<CR>
" " Vim-splash ----------------------------------------
" nnoremap <Leader>vsi :Splash ~/.vim/splash/vim_intro.txt<CR>
" nnoremap <Leader>vsc :Splash ~/.vim/splash/conciergeu_logo.txt<CR>
" NERD-tree ----------------------------------------
nnoremap <C-n>t :NERDTreeToggle<CR>
nnoremap <C-n>g :NERDTreeFocus<CR>
nnoremap <C-n>f :NERDTreeFind<CR>
nnoremap <C-n>F :NERDTreeFind<Space>
nnoremap <C-n>c :NERDTreeCWD<Space>
nnoremap <C-n>b :NERDTreeFromBookmark<Space>
nnoremap <C-n>m :NERDTreeMirror<CR>
" Tagbar ----------------------------------------
nnoremap <C-t>t :TagbarToggle<CR>
nnoremap <C-t>s :TagbarShowTag<CR>
" EasyAlign ----------------------------------------
vmap ga <Plug>(EasyAlign)
" Deoplete ----------------------------------------
" inoremap <expr><C-m> deoplete#refresh()
" Neosnippets ----------------------------------------
imap <C-i> <Plug>(neosnippet_expand_or_jump)
smap <C-i> <Plug>(neosnippet_expand_or_jump)
xmap <C-i> <Plug>(neosnippet_expand_target)
nnoremap <Leader>pse :NeoSnippetEdit<CR>
" Ale ----------------------------------------
nnoremap <Leader>at :ALEToggle<CR>
nnoremap <Leader>ad :ALEDetail<CR>
nnoremap <Leader>an :ALENextWrap<CR>
nnoremap <Leader>ap :ALEPreviousWrap<CR>
nnoremap <Leader>ag :ALEGoToDefinition<CR>
nnoremap <Leader>af :ALEFindReferences<CR>
" Dart ----------------------------------------
nnoremap <Leader>df :DartFmt<CR>
nnoremap <Leader>da :DartAnalyzer<CR>
nnoremap <Leader>dj :Dart2Js<CR>
" QuickNotes ----------------------------------------
nnoremap <Leader>qnn :call QuickNotesNew()<CR>
nnoremap <Leader>qnd :call QuickNotesNewDiary()<CR>
nnoremap <Leader>qnln :call QuickNotesLsNotes()<CR>
nnoremap <Leader>qnld :call QuickNotesLsDiary()<CR>

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
nnoremap <Leader>ta :ter<CR>source $HOME/.bash_profile<CR>
nnoremap <Leader>wb :sp<CR>
nnoremap <Leader>wv :vsp<CR>
nnoremap <Leader>wn :vnew<CR>
nnoremap <Leader>wm :new<CR>
nnoremap <Leader>wi :tabn<CR>
nnoremap <Leader>wu :tabN<CR>
nnoremap <Leader>wc :tabc<CR>
nnoremap <Leader>wo :tabe<CR>
nnoremap <Leader>wy :tabo<CR>
nnoremap <Leader>we :e .<CR>
nnoremap <Leader>wE :e!<CR>
nnoremap <Leader>w- <C-w><Bar><C-w>_
nnoremap <Leader>w= <C-w>=
nnoremap <Leader>wa gg<S-v><S-g><CR>
nnoremap <Leader>wl $
nnoremap <Leader>wh 0
nnoremap <Leader>wp %
nnoremap <Leader>n :cn<CR>
nnoremap <Leader>p :cp<CR>
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
inoremap <C-f>i <Bar>
inoremap <C-f>d $
inoremap <C-f>b \
inoremap <C-f>u _
inoremap <C-f>a &
inoremap <C-f>p %
inoremap <C-f>l <C-o>$
inoremap <C-f>o <C-o>o
" Visual mode ----------------------------------------
vnoremap n %
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
" Terminal mode ----------------------------------------
tnoremap <C-w>q <C-w>:quit!<CR>
tnoremap <C-w>d <C-w>:hide<CR>
tnoremap <Esc> <C-w><S-n>
" File-related shortcuts ----------------------------------------
nnoremap <Leader>mvv :e ~/.vim<CR>
nnoremap <Leader>mvr :e ~/.vimrc<CR>
nnoremap <Leader>mvm :e ~/.vim/userautoload/init/mapping.vim<CR>
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
nnoremap <Leader>fg :Ag<CR>
nnoremap <Leader>fc :Commits<CR>
nnoremap <Leader>fs :GFiles?<CR>
" Gundo ----------------------------------------
nnoremap <Leader>fu :GundoToggle<CR>
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
" " Vim-splash ----------------------------------------
" nnoremap <Leader>vsi :Splash ~/.vim/splash/vim_intro.txt<CR>
" nnoremap <Leader>vsc :Splash ~/.vim/splash/conciergeu_logo.txt<CR>
" NERD-tree ----------------------------------------
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<Space>
" Tagbar ----------------------------------------
nnoremap <C-t>t :TagbarToggle<CR>
nnoremap <C-t>f :TagbarShowTag<CR>
" ctags ----------------------------------------
nnoremap <C-]> g<C-]>
" EasyMotion ----------------------------------------
noremap <Leader> <Plug>(easymotion-prefix)
" nmap <Leader>s <Plug>(easymotion-overwin-f2)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)
" EasyAlign ----------------------------------------
vmap ga <Plug>(EasyAlign)
" Neocomplete ----------------------------------------
inoremap <expr><C-i> neocomplete#complete_common_string()
inoremap <expr><C-g> neocomplete#undo_completion()
" Neosnippets ----------------------------------------
imap <C-s> <Plug>(neosnippet_expand_or_jump)
smap <C-s> <Plug>(neosnippet_expand_or_jump)
xmap <C-s> <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
nnoremap <Leader>st :set completeopt=preview!<CR>
" Ale ----------------------------------------
nnoremap <Leader>at :ALEToggle<CR>
nnoremap <Leader>ad :ALEDetail<CR>
nnoremap <Leader>an :ALENextWrap<CR>
nnoremap <Leader>ap :ALEPreviousWrap<CR>
nnoremap <Leader>ag :ALEGoToDefinition<CR>
nnoremap <Leader>af :ALEFindReferences<CR>

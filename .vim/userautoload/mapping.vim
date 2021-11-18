"----------------------------------------
" Custom commands
"----------------------------------------
" Normal mode ----------------------------------------
let mapleader = "\<Space>"
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap gx :call OpenURLUnderCursor()<CR>
nnoremap <C-]> g<C-]>

nnoremap <expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<Right>"
inoremap <expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<Left>"

" window operation
nnoremap <Leader>wb :sp<CR>
nnoremap <Leader>wv :vsp<CR>
nnoremap <Leader>wm :new<CR>
nnoremap <Leader>wn :vnew<CR>
nnoremap <Leader>wN :call SplitWindowRight()<CR>
nnoremap <Leader>wpc :ped %<CR>:wincmd P<CR>
nnoremap <Leader>wo :on<CR>
nnoremap <Leader>w- <C-w><Bar><C-w>_
nnoremap <Leader>w= <C-w>=
"   buffer operation
nnoremap <Leader>ww :w<CR>
nnoremap <Leader>wW o<ESC>:w<CR>dd:w<CR>
" nnoremap <Leader>wnoa :noa w<CR> " this is for writing buffer without autocmd
nnoremap <Leader>wr :e!<CR>
nnoremap <Leader>wq :q<CR>
nnoremap <Leader>wQ :qa<CR>
nnoremap <Leader>wa gg<S-v><S-g><CR>
nnoremap <Leader>wl $
nnoremap <Leader>wh 0
nnoremap <Leader>won :set relativenumber!<CR>
"   window file explorer utils
nnoremap <Leader>wd :exec "e ".fnamemodify(expand('%'), ':h')<CR>
nnoremap <Leader>w. :e .<CR>
" tab
nnoremap <Leader>tn :tabn<CR>
nnoremap <Leader>tp :tabp<CR>
nnoremap <Leader>tN :tabm +1<CR>
nnoremap <Leader>tP :tabm -1<CR>
nnoremap <Leader>ts :tab split<CR>
nnoremap <Leader>te :tabe<CR>
nnoremap <Leader>tc :tabc<CR>
nnoremap <Leader>to :tabo<CR>
" help
nnoremap <Leader>ht :call OpenHelpInNewTab()<CR>
" buffer
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bl :ls<CR>
nnoremap <Leader>jq :%!jq '.'<CR>
nnoremap <Leader>ct :! ctags -R<CR>
nnoremap <Leader>cp <C-w>}<CR>
nnoremap <Leader>cc :pc<CR>
nnoremap <Leader>cn :cn<CR>
nnoremap <Leader>cp :cp<CR>
nnoremap <Leader>lc :lcl<CR>
nnoremap <Leader>ln :lne<CR>
nnoremap <Leader>lp :lp<CR>
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
nnoremap <Leader>, :call JustAppend(',')<CR>
nnoremap <Leader>; :call JustAppend(';')<CR>
nnoremap <Leader>. :call JustAppend('.')<CR>
nnoremap <Leader>x :call JustTrimTail()<CR>
" Yank utils
nnoremap <Leader>yp :call YankPathToClip()<CR>
nnoremap <Leader>yf :call YankFileNameToClip()<CR>
nnoremap <Leader>pi" vi"p
nnoremap <Leader>pi' vi'p
" Print utils
nnoremap <Leader>prc :echo expand('%:p')<CR>
nnoremap <Leader>prgb :echo fugitive#head()<CR>
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
inoremap <expr>) OmitDuplicateCharacter(")")
inoremap <expr>} OmitDuplicateCharacter("}")
inoremap <expr>] OmitDuplicateCharacter("]")
" Custom input
inoremap <C-f>{ {
inoremap <C-f>[ [
inoremap <C-f>( (
inoremap <C-f>" "
inoremap <C-f>' '
inoremap <C-f>` `
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
vnoremap z/ y/<C-r>"<CR>
vnoremap z? y?<C-r>"<CR>
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
" dein ----------------------------------------
nnoremap <Leader>dr  :call RefreshDeinCache()<CR>
" coc ----------------------------------------
nnoremap ,cld  :CocDiagnostics<CR>
nnoremap ,cle  :CocList extensions<CR>
nnoremap ,clc  :CocList commands<CR>
nnoremap ,clo  :CocList outline<CR>
nnoremap ,cls  :CocList -I symbols<CR>
nnoremap ,cc  :CocCommand<CR>
nnoremap ,ca  :CocAction<CR>
nnoremap ,cn  :CocNext<CR>
nnoremap ,cp  :CocPrev<CR>
nnoremap ,cr  :CocRestart<CR>
nnoremap K :call ShowDocumentation()<CR>
inoremap <expr> <TAB>
     \ pumvisible() ? "\<C-n>" :
     \ CheckBackSpace() ? "\<TAB>" :
     \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
vnoremap ,cc  :CocCommand<CR>
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)
" coc-snippets ----------------------------------------
imap <C-i> <Plug>(coc-snippets-expand-jump)
smap <C-i> <Plug>(coc-snippets-expand-jump)
xmap <C-i> <Plug>(coc-snippets-expand-jump)
nnoremap <Leader>pcse :CocCommand snippets.editSnippets<CR>
nnoremap <Leader>pcsf :CocCommand snippets.openSnippetFiles<CR>
" fzf ----------------------------------------
nnoremap ,a :Files<CR>
nnoremap ,f :Files<CR>
nnoremap ,g :Ag<CR>
nnoremap ,r :History<CR>
nnoremap ,s :GFiles?<CR>
nnoremap ,d :Directories<CR>
nnoremap ,l :Commits<CR>
nnoremap ,b :BCommits<CR>
nnoremap ,n :call QuickNotesFzf()<CR>
" any-jump ----------------------------------------
nnoremap <Leader>jw :AnyJump<CR>
vnoremap <Leader>jw :AnyJumpVisual<CR>
nnoremap <Leader>jb :AnyJumpBack<CR>
nnoremap <Leader>jl :AnyJumpLastResults<CR>
" far ----------------------------------------
nnoremap <silent><Leader>ff :Farf<CR>
vnoremap <silent><Leader>ff :Farf<CR>
nnoremap <silent><Leader>fr :Farr<CR>
vnoremap <silent><Leader>fr :Farr<CR>
vnoremap <silent><Leader>fre :Refar<CR>
" Git ----------------------------------------
nnoremap <Leader>gis :Git!<CR>
nnoremap <Leader>gia :Gwrite<CR>
nnoremap <Leader>gir :Gread<CR>
nnoremap <Leader>gic :Gcommit<CR>
nnoremap <Leader>gib :Git blame<CR>
nnoremap <Leader>gid :Gdiff<CR>
nnoremap <Leader>gil :%Gclog<CR>
nnoremap <Leader>gicu :CocCommand git.chunkUndo<CR>
nnoremap <Leader>gics :CocCommand git.chunkStage<CR>
nmap <Leader>gicn <Plug>(coc-git-nextchunk)
nmap <Leader>gicp <Plug>(coc-git-prevchunk)
nnoremap <Leader>gicons :call GitConflictShow()<CR>
nnoremap <Leader>giconrf :call GitConflictResolveFst()<CR>
nnoremap <Leader>giconrs :call GitConflictResolveSnd()<CR>
nnoremap <Leader>giconk :call GitConflictKeepBoth()<CR>
nnoremap <Leader>giyu :CocCommand git.copyUrl<CR>
nnoremap <Leader>giyb :call YankCurrentBranchToClip()<CR>
nnoremap <Leader>gif :! git fetch -p<CR>
nnoremap <Leader>girh :! git reset --hard<CR>
nnoremap <Leader>gir1 :! git reset HEAD~1<CR>
" Vim-go ----------------------------------------
nnoremap <Leader>goim :GoImport<Space>
nnoremap <Leader>goia :GoImportAs<Space>
nnoremap <Leader>goig :GoImport<Space>github.com/
nnoremap <Leader>goii :GoImports<CR>
nnoremap <Leader>godr :GoDrop<Space>
nnoremap <Leader>gol :GoLint<CR>
nnoremap <Leader>gof :GoFmt<CR>
nnoremap <Leader>gor :GoRename<CR>
nnoremap <Leader>gotj :GoAddTags json<CR>
nnoremap <Leader>godb :GoDocBrowser<CR>
nnoremap <Leader>godi :GoDiagnostics<CR>
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
nnoremap <C-n>g :Twiggy<CR>
" ranger ----------------------------------------
nnoremap <C-n>r :Ranger<CR>
" Tagbar ----------------------------------------
nnoremap <C-t>t :TagbarToggle<CR>
nnoremap <C-t>s :TagbarShowTag<CR>
" EasyAlign ----------------------------------------
vmap ga <Plug>(EasyAlign)
" Prettier ----------------------------------------
nnoremap <Leader>pp :PrettierAsync<CR>
" Dart ----------------------------------------
nnoremap <Leader>df :DartFmt<CR>
nnoremap <Leader>da :DartAnalyzer<CR>
nnoremap <Leader>dj :Dart2Js<CR>
" QuickNotes ----------------------------------------
nnoremap <Leader>qnn :call QuickNotesNew()<CR>
nnoremap <Leader>qnd :call QuickNotesNewDiary()<CR>
nnoremap <Leader>qngb :call CreateGitBranchNote()<CR>
nnoremap <Leader>qnln :call QuickNodesLs()<CR>
nnoremap <Leader>qnld :call QuickNotesLsDiary()<CR>

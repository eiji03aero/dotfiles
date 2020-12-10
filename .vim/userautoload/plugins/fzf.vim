let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'vsplit',
  \ 'ctrl-i': 'split' }

" Default fzf layout
" - down / up / left / right
" let g:fzf_layout = { 'down': '~40%' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
 \ 'bg':      ['fg', 'VertSplit'],
 \ 'hl':      ['fg', 'Identifier'],
 \ 'fg+':     ['fg', 'Normal'],
 \ 'bg+':     ['fg', 'Normal'],
 \ 'hl+':     ['fg', 'Identifier'],
 \ 'info':    ['fg', 'Identifier'],
 \ 'prompt':  ['fg', 'identifier'],
 \ 'pointer': ['fg', 'CursorLineNr'],
 \ 'marker':  ['fg', 'Keyword'],
 \ 'spinner': ['fg', 'Label'],
 \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

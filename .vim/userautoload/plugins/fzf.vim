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

source ~/.vim/autoload/lightline/colorscheme/sapphire.vim

let g:lightline = {
\ 'colorscheme': 'sapphire',
\ 'component_function': {
\   'gitbranch': 'FugitiveHead'
\ },
\ 'active': {
\   'left': [
\     [ 'mode', 'paste' ],
\     [ 'gitbranch', 'readonly' ],
\     [ 'filename', 'modified' ],
\   ]
\ },
\ 'mode_map': {
\   'n' : 'N',
\   'i' : 'I',
\   'R' : 'R',
\   'v' : 'V',
\   'V' : 'VL',
\   "\<C-v>": 'VB',
\   'c' : 'C',
\   's' : 'S',
\   'S' : 'SL',
\   "\<C-s>": 'SB',
\   't': 'T',
\ },
\ }

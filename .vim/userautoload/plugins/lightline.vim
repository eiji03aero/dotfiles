source ~/.vim/autoload/lightline/colorscheme/sapphire.vim

let g:lightline = {
  \ 'colorscheme': 'sapphire',
  \ 'component': {
  \   'relparentpath': '%<%{LightlineRelativeParentPath()}',
  \ },
  \ 'component_function': {
  \   'filetype': 'LightlineFiletype',
  \   'fileencoding': 'LightlineFileencoding',
  \   'fileformat': 'LightlineFileformat',
  \   'filename': 'LightlineFilename',
  \   'gitbranch': 'fugitive#head',
  \ },
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'filename' ],
  \     [ 'relparentpath' ],
  \     [ 'modified', 'readonly' ],
  \   ]
  \ },
  \ 'inactive': {
  \   'left': [
  \     [ 'filename' ],
  \     [ 'relparentpath' ],
  \     [ 'modified' ],
  \   ]
  \ },
  \ 'tabline': {
  \   'left': [ [ 'tabs' ] ],
  \   'right': [ [ 'gitbranch', 'close' ] ],
  \ },
  \ 'mode_map': {
  \   'n' : 'NL',
  \   'i' : 'IN',
  \   'R' : 'RE',
  \   'v' : 'VI',
  \   'V' : 'VL',
  \   "\<C-v>": 'VB',
  \   'c' : 'C',
  \   's' : 'S',
  \   'S' : 'SL',
  \   "\<C-s>": 'SB',
  \   't': 'T',
  \ },
  \ }

let s:threshold = {}
let s:threshold.winwidthS = 80
let s:threshold.winwidthM = 120
let s:threshold.filename = 60
let s:threshold.branch = 30

function! LightlineFiletype()
  return winwidth(0) > s:threshold.winwidthS ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > s:threshold.winwidthM ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > s:threshold.winwidthM ? &fileformat : ''
endfunction

function! LightlineFugitive()
  let branch = fugitive#head()
  if winwidth(0) < s:threshold.winwidthM
    return s:trimWithLimit(branch, s:threshold.branch)
  endif

  return branch
endfunction

function! LightlineFilename()
  let filename = expand('%:t')
  if filename == ''
    let filename = '[NO NAME]'
  endif

  if winwidth(0) < s:threshold.winwidthM
    return s:trimWithLimit(filename, s:threshold.filename)
  endif

  return filename
endfunction

function! LightlineRelativeParentPath()
  let parentPath = expand('%:.:h')
  return parentPath
endfunction

function s:trimWithLimit(str, limit) abort
  if len(a:str) >= a:limit
    let half = a:limit / 2
    return a:str[half] . ' .. ' . a:str[(len(a:str) - half):]
  endif

  return a:str
endfunction

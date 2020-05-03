let g:tagbar_width = 40
let g:tagbar_autoshowtag = 0
let g:tagbar_sort = 0

let g:tagbar_type_coffee = {
  \ 'ctagstype' : 'coffee',
  \ 'kinds' : [
  \   'n:namespace',
  \   'c:class',
  \   'o:object',
  \   'm:methods',
  \   'f:functions',
  \   'i:instance variables',
  \   'v:var:1',
  \ ],
  \ 'sro' : ".",
  \ 'scope2kind' : {
  \   'o' : 'object',
  \   'f' : 'function',
  \   'm' : 'method',
  \   'v' : 'var',
  \   'i' : 'ivar'
  \ },
  \ 'kind2scope' : {
  \  'function' : 'f',
  \  'method' : 'm',
  \  'var' : 'v',
  \  'ivar' : 'i',
  \  'object' : 'o'
  \ },
  \ 'deffile' : '~/.ctags.d/coffee.ctags'
  \ }

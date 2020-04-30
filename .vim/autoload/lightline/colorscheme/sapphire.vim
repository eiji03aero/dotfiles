let s:term_red = 204
let s:term_green = 114
let s:term_yellow = 180
let s:term_blue = 33
let s:term_purple = 170
let s:term_white = 254
let s:term_black = 233
let s:term_grey = 236
let s:term_brightgrey = 244

let s:set = {}
let s:set.modified = [ '#98c379', '#292c33', s:term_red, s:term_black ]
let s:set.white = [ '#98c379', '#292c33', s:term_white, s:term_black ]
let s:set.blue = [ '#98c379', '#292c33', s:term_blue, s:term_black ]
let s:set.grey = [ '#98c379', '#292c33', s:term_brightgrey, s:term_black ]
let s:set.redBg = [ '#98c379', '#292c33', s:term_black, s:term_red ]
let s:set.greenBg = [ '#98c379', '#292c33', s:term_black, s:term_green ]
let s:set.blueBg = [ '#98c379', '#292c33', s:term_black, s:term_blue ]
let s:set.purpleBg = [ '#98c379', '#292c33', s:term_black, s:term_purple ]
let s:set.whiteBlueBg = [ '#98c379', '#292c33', s:term_white, s:term_blue ]

" Hard to read. should be formatted in object literal syntax
" Show modified on inactive
" Make modified more visible
let s:p = {}

let s:p.normal = {
  \ 'left': [
  \   s:set.blueBg,
  \   s:set.white,
  \   s:set.grey,
  \   s:set.modified
  \ ],
  \ 'middle': [
  \   s:set.white,
  \ ],
  \ 'right': [
  \   s:set.blueBg,
  \   [ '#abb2bf', '#3e4452', s:term_white, s:term_grey ],
  \   s:set.white,
  \ ],
  \ 'error': [
  \   [ '#292c33', '#e06c75', s:term_black, s:term_red ]
  \ ],
  \ 'warning': [
  \   [ '#292c33', '#e5c07b', s:term_black, s:term_yellow ]
  \ ]
  \ }

let s:p.inactive = {
  \ 'left': [
  \   s:set.white,
  \   s:set.grey,
  \   s:set.modified
  \ ],
  \ 'right': [
  \   [ '#abb2bf', '#3e4452', s:term_white, s:term_grey ],
  \   s:set.white,
  \ ]
  \ }

let s:p.insert = {
  \ 'left': [
  \   s:set.greenBg,
  \   s:set.white,
  \   s:set.grey,
  \   s:set.modified
  \ ],
  \ 'middle': s:p.normal.middle,
  \ 'right': [
  \   s:set.greenBg,
  \   [ '#ABB2BF', '#3E4452', s:term_white, s:term_grey ]
  \ ],
  \ }

let s:p.replace = {
  \ 'left': [
  \   s:set.purpleBg,
  \   s:set.white,
  \   s:set.grey,
  \   s:set.modified
  \ ],
  \ 'middle': s:p.normal.middle,
  \ 'right': [
  \   s:set.purpleBg,
  \   s:p.normal.right[1],
  \   [ '#e06c75', '#292c33', s:term_purple, s:term_black ]
  \ ]
  \ }

let s:p.visual = {
  \ 'left': [
  \   s:set.redBg,
  \   s:set.white,
  \   s:set.grey,
  \   s:set.modified
  \ ],
  \ 'right': [
  \   s:set.redBg,
  \   s:p.normal.right[1],
  \   s:set.white,
  \ ]
  \ }

let s:p.tabline = {
  \ 'left': [ s:set.white ],
  \ 'tabsel': [ s:set.blueBg ],
  \ 'middle': s:p.normal.middle,
  \ 'right': [ s:set.blueBg ]
  \ }

let g:lightline#colorscheme#sapphire#palette = lightline#colorscheme#fill(s:p)

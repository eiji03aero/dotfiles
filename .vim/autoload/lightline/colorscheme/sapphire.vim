let s:term_red = 204
let s:term_green = 114
let s:term_yellow = 180
let s:term_blue = 33
let s:term_brightBlue = 39
let s:term_purple = 170
let s:term_white = 254
let s:term_black = 233
let s:term_grey = 236
let s:term_brightgrey = 244

let s:set = {}
let s:set.modified = [ s:term_red, s:term_black ]
let s:set.white = [ s:term_white, s:term_black ]
let s:set.blue = [ s:term_blue, s:term_black ]
let s:set.brightBlue = [ s:term_brightBlue, s:term_black ]
let s:set.grey = [ s:term_brightgrey, s:term_black ]
let s:set.redBg = [ s:term_black, s:term_red ]
let s:set.greenBg = [ s:term_black, s:term_green ]
let s:set.blueBg = [ s:term_black, s:term_blue ]
let s:set.purpleBg = [ s:term_black, s:term_purple ]
let s:set.blueGreyBg = [ s:term_blue, s:term_grey ]
let s:set.whiteBlueBg = [ s:term_white, s:term_blue ]

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
  \ 'left': [ s:set.grey ],
  \ 'tabsel': [ s:set.blue ],
  \ 'middle': s:p.normal.middle,
  \ 'right': [ s:set.blue ]
  \ }

let g:lightline#colorscheme#sapphire#palette = lightline#colorscheme#fill(s:p)

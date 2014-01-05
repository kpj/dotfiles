syntax on
filetype plugin indent on

set tabstop=2
set shiftwidth=2
set expandtab

set laststatus=2

set incsearch
set hlsearch

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

""""""""""""""
" My plugins "
""""""""""""""
"set nu
"NERDTree

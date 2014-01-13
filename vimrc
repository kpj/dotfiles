syntax on

set autoindent
set cindent

set tabstop=4
set shiftwidth=4
set noexpandtab

set laststatus=2

set incsearch
set hlsearch

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

" auto paste mode
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

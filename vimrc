" syntax highlighting
syntax on

" Vundle stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Own plugins (Commands: PluginList, PluginInstall)

Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'

" End
call vundle#end()
filetype plugin indent on

" indentation
"set autoindent
"set cindent

" Shortcuts
nmap <F2> :TagbarToggle<CR>

set tabstop=4
set shiftwidth=4
"set noexpandtab
set expandtab

" fix for my plugins
set laststatus=2

" improved search
set incsearch
set hlsearch
nnoremap <CR> :nohlsearch<CR><CR> " disable highlighting on <Return>
set ignorecase " case insensitive search
set smartcase " only case sensitive if uppercase letter contained (with above)

" something
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

" auto paste mode
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" remember last position in file
set viminfo='10,\"100,:20,%,n/tmp/viminfo
augroup JumpCursorOnEdit
  au!
  autocmd BufReadPost *
    \ if expand("<afile>:p:h") !=? $TEMP |
    \   if line("'\"") > 1 && line("'\"") <= line("$") |
    \     let JumpCursorOnEdit_foo = line("'\"") |      
    \     let b:doopenfold = 1 |                  
    \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
    \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
    \        let b:doopenfold = 2 |                               
    \     endif |                  
    \     exe JumpCursorOnEdit_foo |
    \   endif |                     
    \ endif    
  " Need to postpone using "zv" until after reading the modelines.
  autocmd BufWinEnter *
    \ if exists("b:doopenfold") |
    \   exe "normal zv" |        
    \   if(b:doopenfold > 1) |
    \       exe  "+".1 |      
    \   endif |         
    \   unlet b:doopenfold |
    \ endif                 
augroup END


""""""""""""""
" My plugins "
""""""""""""""
set nu
"NERDTree

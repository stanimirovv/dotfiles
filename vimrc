syntax on
colorscheme elflord
set nocompatible
" This shows what you are typing as a command.  I love this!
set showcmd
" Needed for Syntax Highlighting and stuff
filetype on
filetype plugin on
syntax enable
" Who doesn't like autoindent?
" Spaces are better than a tab character
set expandtab
set smarttab
" Who wants an 8 character tab?  Not me!
set shiftwidth=3
set softtabstop=3
" Cool tab completion stuff
 set wildmenu
 set wildmode=list:longest,full
" " Got backspace?
 set backspace=2
" line numbers
 set nu
" exclude included files from autocomplete since it takes time to search the
" first time since it must cache the files
set complete-=i
set cursorline
:imap jk <Esc>

" scroll will never go to the bottom 3 and first 3 lines of a file
set scrolloff=3

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

   " bind K to grep word under cursor
   nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
else
   " if we don't have ag we will fallback to grep
   command GREP :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('%') | copen
   nnoremap K :GREP<Enter>
endif

set hlsearch
nnoremap * *``
highlight Pmenu ctermbg=darkgray ctermfg=white

" Hotkeys for window resizing: ctrlw | ctrlw_ ctrlw=
" [v]sp | b[n] - open buffer in split


" Folding
" zA toggle zc create zo open
set foldmethod=indent   
set foldnestmax=20
set nofoldenable

" CtrlP
set foldmethod=indent   
set foldnestmax=20
set nofoldenable
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Change dir to current file dir. Useful if after a MRU you change the dir
" root or project
command CDC cd %:p:h


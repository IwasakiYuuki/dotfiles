if &compatible
  set nocompatible               " Be iMproved
endif

" Required
set runtimepath+=/Users/202204004/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
  if dein#check_install()
    call dein#install()
  endif
endif

" Required
filetype plugin indent on
syntax enable

" General Settings
set tabstop=4
set number
set clipboard+=unnamedplus
set autoindent
set expandtab
set encoding=UTF-8
set ignorecase                  " case insensitive search
set smartcase
set splitright
set splitbelow
set termguicolors
set laststatus=3
colorscheme nightfly

" Keyboard Mappings
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <ESC> <NOP>
inoremap jj <ESC>
" window split command
nnoremap ss :<C-u>new<CR>
nnoremap sv :<C-u>vnew<CR>
nnoremap sq :<C-u>q<CR>
" window move
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" tab command
nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sN gT
nnoremap sc :<C-u>tabclose<CR>
" for US keyboard
nnoremap ; :
vnoremap ; :
nnoremap <S-a> ^i
nnoremap <S-s> $a
" search
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Indent settings
if has("autocmd")
  filetype plugin on
  filetype indent on
  "sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtab
  autocmd FileType vim              setlocal sw=2 sts=2 ts=2 et
  autocmd FileType c                setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c,cpp,java       setlocal cindent
  autocmd FileType html             setlocal sw=2 sts=2 ts=2 et
  autocmd FileType ruby             setlocal sw=2 sts=2 ts=2 et
  autocmd FileType php              setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql              setlocal sw=2 sts=2 ts=2 noet
  autocmd FileType js               setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ts               setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sh               setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh              setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python           setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala            setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json             setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yml              setlocal sw=2 sts=2 ts=2 et
  autocmd FileType yaml             setlocal sw=2 sts=2 ts=2 et
  autocmd FileType tml              setlocal sw=2 sts=2 ts=2 et
  autocmd FileType toml             setlocal sw=2 sts=2 ts=2 et
  autocmd FileType css              setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scss             setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sass             setlocal sw=2 sts=2 ts=2 et
  autocmd FileType javascript       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType javascriptreact  setlocal sw=2 sts=2 ts=2 et
  autocmd FileType typescriptreact  setlocal sw=2 sts=2 ts=2 et
  autocmd FileType markdown         setlocal sw=2 sts=2 ts=2 et

  " mapping custom filetype
  autocmd BufRead,BufNewFile *.bq setfiletype sql
endif

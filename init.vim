if &compatible
  set nocompatible               " Be iMproved
endif


" Required:
set runtimepath+=/home/yuuki/.cache/dein/repos/github.com/Shougo/dein.vim
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

" Required:
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
inoremap jj <ESC>
nnoremap ss :<C-u>new<CR>       " window split command
nnoremap sv :<C-u>vnew<CR>
nnoremap sq :<C-u>q<CR>
nnoremap <C-h> <C-w>h           " window move
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap st :<C-u>tabnew<CR>    " tab command
nnoremap sn gt
nnoremap sN gT
nnoremap sc :<C-u>tabclose<CR>

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


let g:bq_status_win_opts = {
\  'relative': 'win',
\  'width': 30,
\  'height': 5,
\  'col': 0,
\  'row': 0,
\  'anchor': 'NE',
\  'style': 'minimal',
\  'border': 'rounded',
\}
let g:bq_status_div_win_opts = {
\  'relative': 'win',
\  'width': 32,
\  'height': 1,
\  'zindex': 51,
\  'col': 10,
\  'row': 2,
\  'anchor': 'NE',
\  'style': 'minimal',
\}

let w:bq_status_buf = nvim_create_buf(v:false, v:true)
let w:bq_status_div_buf = nvim_create_buf(v:false, v:true)
let w:bq_status_win = ''
let w:bq_status_div_win = ''

function! Dryrun() abort
  let s:msg = 'Successfully, 200 MB'
  let s:is_success = v:true
  call OpenWimDryrun()
  call timer_start(3000, {-> call(function('s:bq_write_buf'), [' OK', ' 200 MB'])})
endfunction

function! OpenWimDryrun() abort
  let w:bq_status_win = nvim_open_win(
  \  w:bq_status_buf,
  \  0,
  \  get(w:, 'bq_status_win_opts', g:bq_status_win_opts))
  call nvim_buf_set_lines(
  \  w:bq_status_div_buf,
  \  0,
  \  0,
  \  v:true,
  \  ['├' . repeat('─', 30) . '┤']
  \)
  let w:bq_status_div_win = nvim_open_win(
  \  w:bq_status_div_buf,
  \  0,
  \  get(w:, 'bq_status_div_win_opts', g:bq_status_div_win_opts))
  call nvim_win_set_option(w:bq_status_win, 'winhighlight', 'NormalFloat:Normal,FloatBorder:Normal')
  call nvim_win_set_option(w:bq_status_div_win, 'winhighlight', 'NormalFloat:Normal,FloatBorder:Normal')
endfunction

function! CloseWinDryrun() abort
  call nvim_win_close(w:bq_status_win, v:true)
  call nvim_win_close(w:bq_status_div_win, v:true)
endfunction

function! s:get_bytes(msg) abort
  let l:bytes = matchstr(a:msg, '[0-9]\+')
  if type(l:bytes) == 1
    let l:num_bytes = str2float(l:bytes)
  else
    let l:num_bytes = a:bytes
  endif
  let l:thousand = 0
  while l:num_bytes > 1000.0
    let l:num_bytes = l:num_bytes / 1000.0
    let l:thousand += 1
  endw
  let l:units = ['B', 'KB', 'MB', 'GB', 'TB', 'PB']
  return printf('%.2f %s', l:num_bytes, l:units[l:thousand])
endfunction

function! s:set_win_hl_err() abort
  if exists('w:bq_status_win') && exists('w:bq_status_div_win')
    call nvim_win_set_option(w:bq_status_win, 'winhighlight', 'NormalFloat:ErrorMsg,FloatBorder:ErrorMsg')
    call nvim_win_set_option(w:bq_status_div_win, 'winhighlight', 'NormalFloat:ErrorMsg,FloatBorder:ErrorMsg')
  endif
endfunction

function! s:set_win_hl_ok() abort
  if exists('w:bq_status_win') && exists('w:bq_status_div_win')
    hi SuccessMsg ctermfg=LightGreen guifg=LightGreen
    call nvim_win_set_option(w:bq_status_win, 'winhighlight', 'FloatBorder:SuccessMsg')
    " call nvim_win_set_option(w:bq_status_win, 'winhighlight', 'NormalFloat:SuccessMsg,FloatBorder:SuccessMsg')
    call nvim_win_set_option(w:bq_status_div_win, 'winhighlight', 'NormalFloat:SuccessMsg,FloatBorder:SuccessMsg')
  endif
endfunction

function! s:bq_write_buf(status, msg) abort
  call nvim_buf_set_lines(
  \  w:bq_status_buf,
  \  0,
  \  0,
  \  v:true,
  \  [a:status]
  \)
  call nvim_buf_set_lines(
  \  w:bq_status_buf,
  \  2,
  \  2,
  \  v:true,
  \  [a:msg]
  \)
  call s:set_win_hl_ok()
endfunction

function! Echohoge(sub) abort
  echom a:sub.stdout.read()
endfunction

function! Hoge() abort
  let l:sub = vimproc#popen2('sleep 1; echo xxx')
  let l:res = 'xxx'
  call timer_start(3000, {-> call(function('Echohoge'), [l:sub])})
endfunction

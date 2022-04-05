" Pluging Installing
" Use junegunn/vim-plug
call plug#begin()

"====================================
" Basic plugin
"====================================
" Comment / Uncomment
Plug 'tpope/vim-commentary'
" Multi Cursor
Plug 'terryma/vim-multiple-cursors'
" Git
Plug 'tpope/vim-fugitive'
" Fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" Grep
Plug 'mileszs/ack.vim'
" Asynchronous execution library for Vim
Plug 'Shougo/vimproc.vim', {'do': 'make'}
" Surround
Plug 'tpope/vim-surround'
" Git diff
Plug 'airblade/vim-gitgutter'
" Document generator for multi language
Plug 'kkoomen/vim-doge', {'do': { -> doge#install() } }
" Snippet
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Linter/Formatter
Plug 'dense-analysis/ale'
" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Powerline
Plug 'itchyny/lightline.vim'
" Auto close parentheses
Plug 'cohama/lexima.vim'

"====================================
" Language plugin
"====================================
" Plugins for each languages
" Rust
Plug 'wting/rust.vim', {'for': 'rust'}
" Ruby
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
" Go
Plug 'fatih/vim-go',  {'for': 'go'}
" Dockerfile
Plug 'ekalinin/Dockerfile.vim'
" Kubernetes
Plug 'andrewstuart/vim-kubernetes'
" Terraform
Plug 'hashivim/vim-terraform'
" Python
Plug 'python-mode/python-mode', {'for': 'python', 'branch': 'develop'}
" (La)Tex
Plug 'lervag/vimtex'
" JavaScript/JSX
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" TypeScript/TSX
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" HTML/CSS
Plug 'mattn/emmet-vim'

call plug#end()

"====================================
" General settings
"====================================
set tabstop=4
set incsearch " 検索の途中でハイライトするようにする
set number " 行数表示 
set ignorecase " ignorecase+smartcaseで検索の際に大文字小文字の区別をなくす
set smartcase
set clipboard=unnamedplus
set autoindent
set autoread
set tags=.tags
command! Reload :windo e
nnoremap <F5> :Reload<CR>
"" Indent width
if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "ファイルタイプに合わせたインデントを利用
  filetype indent on
  "sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
  autocmd FileType c,cpp,java  setlocal cindent
  autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ts          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yml        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType yaml        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scss        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sass        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript  setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascriptreact  setlocal sw=2 sts=2 ts=2 et
  autocmd FileType typescriptreact  setlocal sw=2 sts=2 ts=2 et
endif

" Window
set splitright
set splitbelow

" Color
syntax on
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight NonText ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
autocmd ColorScheme * highlight Folded ctermbg=none
autocmd ColorScheme * highlight EndOfBuffer ctermbg=none
colorscheme jellybeans
let g:jellybeans_use_lowcolor_black = 0

"====================================
" IndentLine
"====================================
let g:indentLine_char = '┊'

"====================================
" UltiSnips
"====================================
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:UltiSnipsEditSplit="vertical"

"====================================
" Showmarks setting
"====================================
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

"====================================
" Key mapping
"====================================
" ESCが押しづらいので"jj"に変更
inoremap jj <esc>

" US配置だとデフォルトがセミコロンになっているため反転
nnoremap ; :
vnoremap ; :

nnoremap s <nop>
" 画面のショートカット
nnoremap ss :<C-u>new<CR>
nnoremap sv :<C-u>vnew<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap s[ <C-w>><CR>
nnoremap s] <C-w><<CR>

" タブの操作
nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sN gT
nnoremap sc :<C-u>tabclose<CR>

" 検索の際に特殊文字の前の"\"を省略する
nnoremap / /\v
vnoremap / /\v

" 検索をした時に画面の中央に行くようにする
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Shift-A, Sで行の左右の端へ
nnoremap <S-a> ^i
nnoremap <S-s> $a

" インサートモードで移動をctl-jkhlに
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-h> <left>
inoremap <C-l> <right>

"F2でpasteモードに。pasteするときにインデントを無効化。
" <F2> to paste mode.
set pastetoggle=<F2>

"splitの移動を簡単に。ctrl押しながらhjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" <Enter> always means inserting line.
nnoremap <S-Enter> O<ESC>
nnoremap <Enter> o<ESC>

nnoremap <leader>1 yyPVr=jyypVr=
nnoremap <leader>2 yyPVr*jyypVr*
nnoremap <leader>3 yyPVr-jyypVr-
nnoremap <leader>4 yypVr=
nnoremap <leader>5 yypVr-
nnoremap <leader>6 yypVr^
nnoremap <leader>7 yypVr"

nnoremap <Leader>s" ciw""<Esc>P nnoremap <Leader>s' ciw''<Esc>P
nnoremap <Leader>s` ciw``<Esc>P
nnoremap <Leader>s( ciw()<Esc>P
nnoremap <Leader>s{ ciw{}<Esc>P
nnoremap <Leader>s[ ciw[]<Esc>P

"====================================
" lightline
"====================================
set laststatus=2

"====================================
" terraform
"====================================
let g:terraform_align=1
let g:terraform_fmt_on_save=1

"====================================
" CtrlP
"====================================
let g:ctrlp_show_hidden = 1
nnoremap <C-@> :CtrlPTag<CR>

"====================================
" pymode
"====================================
let g:pymode_rope = 1
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion_bind = '<C-p>'
set completeopt=menuone

"====================================
" vimtex
"====================================
let g:vimtex_view_method = 'zathura'
let g:vimtex_syntax_conceal_disable = 1
"" texのconcealを無効化（#^ω^）
let g:tex_conceal=''

"====================================
" vim-javascript
"====================================
let g:javascript_plugin_jsdoc = 1
if executable('typescript-language-server')
  augroup LspTypeScript
	au!
	autocmd User lsp_setup call lsp#register_server({
		  \ 'name': 'typescript-language-server',
		  \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
		  \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
		  \ 'whitelist': ['typescript', 'typescriptreact'],
		  \ })
	autocmd FileType typescript setlocal omnifunc=lsp#complete
  augroup END :echomsg "vim-lsp with `typescript-language-server` enabled"
else
  :echomsg "vim-lsp for typescript unavailable"
endif

"====================================
" vim-lsp
"====================================
let g:lsp_diagnostics_echo_cursor = 1

"====================================
" ALE
"====================================
let g:ale_completion_enabled = 1
let g:ale_linter_aliases = {'typescriptreact': 'typescript'}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'javascriptreact': ['prettier'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\}

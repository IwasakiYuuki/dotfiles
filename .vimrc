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
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
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
" Linter/Formatter Omni completion
Plug 'dense-analysis/ale'
" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Powerline
Plug 'vim-airline/vim-airline'
" Auto close parentheses
Plug 'cohama/lexima.vim'
" LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" Async Completion
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

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
" Plug 'python-mode/python-mode', {'for': 'python', 'branch': 'develop'}
" (La)Tex
Plug 'lervag/vimtex'
" JavaScript/JSX
Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
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
set clipboard+=unnamed
set autoindent
set expandtab
set tags=.tags
set backspace=indent,eol,start

" Auto Reload (long span)
set autoread
au CursorHold * checktime

command! Reload :windo e
nnoremap <F5> :Reload<CR>
"" Indent width
if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "ファイルタイプに合わせたインデントを利用
  filetype indent on
  "sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
  autocmd FileType vim         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType c,cpp,java  setlocal cindent
  autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType js          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ts          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yml        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType yaml        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType css         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType scss        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sass        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType javascript  setlocal sw=2 sts=2 ts=2 et
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
" NORMAL MODEでのESCでFZFが起動してしまう
nnoremap <esc> <nop>
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

" EmmetのLeaderが押しづらいので変更
imap ,, <C-y>,

"====================================
" terraform
"====================================
let g:terraform_align=1
let g:terraform_fmt_on_save=1

"====================================
" Fzf
"====================================
nnoremap <C-p> :Files .<CR>
nnoremap <C-]> :Files ~<CR>

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
" let g:javascript_plugin_jsdoc = 1
" if executable('typescript-language-server')
"   augroup LspTypeScript
"     au!
"     autocmd User lsp_setup call lsp#register_server({
"           \ 'name': 'typescript-language-server',
"           \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
"           \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
"           \ 'whitelist': ['typescript', 'typescriptreact'],
"           \ })
"     autocmd FileType typescript setlocal omnifunc=lsp#complete
"   augroup END :echomsg "vim-lsp with `typescript-language-server` enabled"
" else
"   :echomsg "vim-lsp for typescript unavailable"
" endif

"====================================
" vim-lsp
"====================================
let g:lsp_diagnostics_echo_cursor = 1
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"====================================
" ALE
"====================================
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

" TypeScript
let g:ale_linter_aliases = {'typescriptreact': 'typescript'}

" PHP
let g:ale_php_phpcbf_standard = 'PSR2'
let g:ale_php_phpcs_standard = 'PSR2'

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'javascriptreact': ['prettier'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'html': ['prettier'],
\   'css': ['prettier'],
\   'php': ['phpcbf'],
\}

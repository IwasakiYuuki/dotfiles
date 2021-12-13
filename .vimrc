" Use junegunn/vim-plug
call plug#begin()

" Pluging Installing
Plug 'vim-scripts/The-NERD-Commenter' " 各言語でのコメント関連 
Plug 'preservim/nerdtree' " フォルダ構造のツリー表示・操作
" Plug 'altercation/vim-colors-solarized' " エディタの色・シンタックスハイライトの設定 
Plug 'vim-scripts/Modeliner' " エディタのモードラインを更新・出力 
Plug 'tpope/vim-fugitive' " VimからGit関連のコマンドを打てる 
" Plug 'thinca/vim-quickrun' " バッファのクイックラン（Pythonなどの簡易実行）
Plug 'vim-scripts/ShowMarks' " 任意の場所にマークを付け飛ぶことが出来る 
Plug 'ctrlpvim/ctrlp.vim' " ファイル検索 
Plug 'majutsushi/tagbar' " タグバーの表示 
Plug 'mileszs/ack.vim' " ファイル内の検索 
Plug 'Shougo/vimproc.vim', {'do': 'make'} " vimの非同期実行 
Plug 'mattn/ctrlp-ghq' " 検索でghqを使えるようにする
Plug 'tpope/vim-surround' " 括弧などの囲みの変更・削除・作成など
Plug 'airblade/vim-gitgutter' " Gitの差分表示
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/sonictemplate-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-dirvish'
Plug 'plasticboy/vim-markdown'
Plug 'uarun/vim-protobuf'

Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'garbas/vim-snipmate'
"Plug 'honza/vim-snippets'

" Plugins for each languages
Plug 'puppetlabs/puppet-syntax-vim'
Plug 'wting/rust.vim', {'for': 'rust'}
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'fatih/vim-go',  {'for': 'go'}
Plug 'ekalinin/Dockerfile.vim'
Plug 'rhysd/vim-crystal', {'for': 'crystal'}
Plug 'andrewstuart/vim-kubernetes'
Plug 'hashivim/vim-terraform'
Plug 'python-mode/python-mode', {'for': 'python', 'branch': 'develop'}

" Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
" Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'cohama/lexima.vim'

call plug#end()

"================
"General settings
"================
set clipboard&
set clipboard^=unnamedplus
set autoindent
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
endif

"========
" Window
"========
set splitright
set splitbelow

"===================
" indentLine
"===================
let g:indentLine_char = '┊'

"===================
" QuickRun
"===================
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
\   'runner'    : 'vimproc',
\   'runner/vimproc/updatetime' : 60,
\   'outputter' : 'error',
\   'outputter/error/success' : 'buffer',
\   'outputter/error/error'   : 'quickfix',
\   'outputter/buffer/split'  : ':rightbelow 8sp',
\   'outputter/buffer/close_on_empty' : 1,
\}
nnoremap \r :<C-u>QuickRun<CR>

"===================
" SnipMate
"===================
" let g:snipMate = { 'snippet_version' : 1 }

"===================
" UltiSnips
"===================
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:UltiSnipsEditSplit="vertical"

"==================
" color management
"==================
" let g:solarized_termcolors=256
" let g:solarized_visibility='normal'
syntax on
"set background=dark
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight NonText ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
autocmd ColorScheme * highlight Folded ctermbg=none
autocmd ColorScheme * highlight EndOfBuffer ctermbg=none
colorscheme jellybeans
" colorscheme onedark
let g:jellybeans_use_lowcolor_black = 1

"===================
" Showmarks setting
"===================
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

"===================
" Init
"===================
set tabstop=4
set incsearch " 検索の途中でハイライトするようにする
set number " 行数表示 
set ignorecase " ignorecase+smartcaseで検索の際に大文字小文字の区別をなくす
set smartcase

"===================
" Key mappings
"===================
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

"====================
" tagbar
"====================
noremap <F8> :TagbarToggle<CR>

"==========
" lightline
"==========
set laststatus=2
"let g:lightline = {
"\ 'colorscheme': 'onedark',
"\ }


"=========
" NERDTree
"=========
noremap <F7> :NERDTreeToggle<Enter>


"=========
" deoplete
"=========
let g:deoplete#enable_at_startup = 1

"=========
"terraform
"=========
let g:terraform_align=1
let g:terraform_fmt_on_save=1

"=======================
"Python Linter&Formatter
"=======================
"function! Preserve(command)
"    " Save the last search.
"    let search = @/
"    " Save the current cursor position.
"    let cursor_position = getpos('.')
"    " Save the current window position.
"    normal! H
"    let window_position = getpos('.')
"    call setpos('.', cursor_position)
"    " Execute the command.
"    execute a:command
"    " Restore the last search.
"    let @/ = search
"    " Restore the previous window position.
"    call setpos('.', window_position)
"    normal! zt
"    " Restore the previous cursor position.
"    call setpos('.', cursor_position)
"endfunction
"
"function! Autopep8()
"    "--ignote=E501: Ignore completing the length of a line."
"    call Preserve(':silent %!autopep8 --aggressive --aggressive -')
"endfunction
"
"augroup python_auto_lint
"  autocmd!
"  autocmd BufWrite *.py :call Autopep8()
"augroup END

"=====
"CtrlP
"=====
let g:ctrlp_show_hidden = 1

"=====
"JEDI
"=====
"set completeopt=menuone                        " 補完候補を呼び出すとき常にポップアップメニューを使う
"autocmd! User jedi-vim call s:jedivim_hook()   " vim-plugの遅延ロード呼び出し
"function! s:jedivim_hook()              " jedi-vimを使うときだけ呼び出す処理を関数化
"  let g:jedi#auto_initialization    = 0 " 自動で実行される初期化処理を無効
"  let g:jedi#auto_vim_configuration = 0 " 'completeopt' オプションを上書きしない
"  let g:jedi#popup_on_dot           = 0 " ドット(.)を入力したとき自動で補完しない
"  let g:jedi#popup_select_first     = 0 " 補完候補の1番目を選択しない
"  let g:jedi#show_call_signatures   = 0 " 関数の引数表示を無効(ポップアップのバグを踏んだことがあるため)
"  autocmd FileType python setlocal omnifunc=jedi#completions   " 補完エンジンはjediを使う
"endfunction

"======
"pymode
"======
let g:pymode_rope = 1
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion_bind = '<C-p>'

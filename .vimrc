"""""""""""""""""""""""""""""""""""""""""""""""
"                    common                   "
"""""""""""""""""""""""""""""""""""""""""""""""
" TAB
scriptencoding utf8

set encoding=utf8
set fileencoding=utf-8

set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

syntax on

set laststatus=2
"set t_Co=256

" カーソル上下に表示する行数
set scrolloff=5
set noswapfile
set nowritebackup
set nobackup
" ビープ音を消す
set vb t_vb=
set novisualbell
" OSのクリップボードを使う
set clipboard+=unnamed
set clipboard=unnamed
" 行番号
set number
" 行列番号表示
set ruler
" 括弧の対を表示
set showmatch
" 括弧の対の表示秒数
set matchtime=3
" 自動改行無効
set textwidth=0
" インデント
set shiftround
" スマートケース補完
set ignorecase
set smartcase
" インクリメンタルサーチ
set incsearch
" 検索ハイライト
set hlsearch
" 履歴拡充
set history=1000
" コマンド表示
set showcmd

set ff=unix

"""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""
"                 NeoBundle                   "
"""""""""""""""""""""""""""""""""""""""""""""""

" Note: Skip initialization for vim-tiny or vim-small.
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')

call dein#add('Shougo/neobundle.vim')
call dein#add('jonathanfilip/vim-lucius')
call dein#add('scrooloose/nerdtree')
call dein#add('thinca/vim-quickrun')
call dein#add('myhere/vim-nodejs-complete')
call dein#add('pangloss/vim-javascript')
call dein#add('jelera/vim-javascript-syntax')
call dein#add('scrooloose/syntastic')
call dein#add('itchyny/lightline.vim')

" elixir
call dein#add('elixir-lang/vim-elixir')

" clojure
call dein#add('tpope/vim-fireplace')

call dein#end()

filetype plugin indent on     " required!
filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""
"                syntastic                    "
"""""""""""""""""""""""""""""""""""""""""""""""
let g:nodejs_complete_config = {
\  'js_compl_fn': 'jscomplete#CompleteJS',
\  'max_node_compl_len': 15
\}
" ファイルを開いたときはチェックしない
let g:syntastic_check_on_open=0
" 保存時にはチェック
let g:syntastic_check_on_save=1
" wqではチェックしない
let g:syntastic_check_on_wq = 0
"エラーがあったら自動でロケーションリストを開く
let g:syntastic_auto_loc_list=1
" エラー表示ウィンドウの高さ
let g:syntastic_loc_list_height=6
" エラーメッセージの書式
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint'] "ESLintを使う
let g:syntastic_mode_map = {
            \ 'mode': 'active',
            \ 'active_filetypes': ['javascript'],
            \ 'passive_filetypes': []
            \ }

"let g:quickrun_config["java"] = {
"            \ 'exec' : ['javac -J-Dfile.encoding=UTF8 %o %s', '%c -Dfile.encoding=UTF8 %s:t:r %a']
"            \}

" .vimrc

"let g:quickrun_config['vim'] = { 
"\   "hook/output_encode/enable" : 1,
"\   "hook/output_encode/encoding" : "utf-8",
"\}

"""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""
"                syntastic                    "
"""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'seoul256'
      \ }
"""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""
"                NERDTree                     "
"""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden = 1
"""""""""""""""""""""""""""""""""""""""""""""""

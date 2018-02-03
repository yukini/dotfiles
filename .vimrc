"""""""""""""""""""""""""""""""""""""""""""""""
"                    common                   "
"""""""""""""""""""""""""""""""""""""""""""""""
scriptencoding utf-8


set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set fileformats=unix,dos,mac

set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

syntax on

" カーソル上下に表示する行数
set scrolloff=5
set noswapfile
set nowritebackup
set nobackup
" ビープ音を消す
set novisualbell
set vb t_vb=
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
" lightline表示のため
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""
"                dein                         "
"""""""""""""""""""""""""""""""""""""""""""""""
if &compatible
    set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein')
    call dein#begin('~/.vim/dein')
    "call dein#add('Shougo/neocomplete.vim')
    call dein#add('scrooloose/nerdtree')
    call dein#add('thinca/vim-quickrun')
    call dein#add('myhere/vim-nodejs-complete')
    call dein#add('pangloss/vim-javascript')
    call dein#add('jelera/vim-javascript-syntax')
    call dein#add('rust-lang/rust.vim')
    call dein#add('itchyny/lightline.vim')
    call dein#add('nathanaelkane/vim-indent-guides')

    " colorscheme
    call dein#add('jonathanfilip/vim-lucius')
    call dein#add('w0ng/vim-hybrid')
    call dein#add('morhetz/gruvbox')
    call dein#add('nightsense/seabird')
    call dein#add('rakr/vim-one')
    " elixir
    call dein#add('elixir-lang/vim-elixir')
    call dein#add('slashmili/alchemist.vim')
    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

"""""""""""""""""""""""""""""""""""""""""""""""
"                                             "
"""""""""""""""""""""""""""""""""""""""""""""""
colorscheme default

"""""""""""""""""""""""""""""""""""""""""""""""
"                                             "
"""""""""""""""""""""""""""""""""""""""""""""""
let g:nodejs_complete_config = {
\  'js_compl_fn': 'jscomplete#CompleteJS',
\  'max_node_compl_len': 15
\}


"""""""""""""""""""""""""""""""""""""""""""""""
"                indent                       "
"""""""""""""""""""""""""""""""""""""""""""""""
" 起動時に機能ON
let g:indent_guides_enable_on_vim_startup=1
" 
" ガイドの幅
let g:indent_guides_guide_size = 1
"""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""
"               lightline                     "
"""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'seoul256'
      \ }
"""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""
"               quick run                     "
"""""""""""""""""""""""""""""""""""""""""""""""
"let g:quickrun_config['java'] = { 
"            \   "hook/output_encode/enable" : 1,
"            \   "hook/output_encode/encoding" : "utf-8",
"            \}
"""""""""""""""""""""""""""""""""""""""""""""""


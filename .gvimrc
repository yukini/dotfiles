set clipboard=unnamed
set encoding=utf-8

colorscheme gruvbox
set background=dark
"set nocompatible 

" ツールバーを削除 
set guioptions-=T 

" メニューを削除 
set guioptions-=m 

" スクロールバー削除
set guioptions=s

" スワップファイルを作成しない 
set noswapfile 
" バックアップファイルを作成しない 
set nobackup 
" undofile無効化 
set noundofile
" Beep無効
set vb t_vb=
" 現在行強調表示
set cursorline

" 縦幅
set lines=30
" 横幅
set columns=100

if has('unix') 
endif

if has('mac')
    set transparency=5
    "2byte文字対応
    set ambiwidth=double
endif

if has('unix') || has('mac')
endif

if has('win32') || has ('win64')
    GUIEnter * set transparency=250
"フォント
":set guifont=MeiryoKe_Gothic:h10
set guifont=consolas
set guifontwide=MS_GOTHIC
endif

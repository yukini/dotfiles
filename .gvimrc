:set clipboard=unnamed
:set encoding=utf-8

syntax enable 
colorscheme luciuse
set background=dark
set nocompatible 
set number 

" ツールバーを削除 
set guioptions-=T 

"メニューを削除 
set guioptions-=m 

"スクロールバー削除
set guioptions=s

" スワップファイルを作成しない 
:set noswapfile 
" バックアップファイルを作成しない 
:set nobackup 
" undofile無効化 
:set noundofile
"フォント
":set guifont=MeiryoKe_Gothic:h10
:set guifont=consolas
:set guifontwide=MS_GOTHIC
"Beep無効
:set vb t_vb=
"現在行強調表示
:set cursorline

autocmd GUIEnter * set transparency=250

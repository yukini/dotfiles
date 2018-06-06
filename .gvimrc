colorscheme one
set background=dark

" ツールバーを削除 
set guioptions-=T 
" メニューを削除 
set guioptions-=m 
" スクロールバー削除
set guioptions=s
" Beep無効
set vb t_vb=
" 現在行強調表示
set cursorline

" 縦幅
set lines=30
" 横幅
set columns=100

if has('mac')
    set transparency=5
    "2byte文字対応
    set ambiwidth=double
endif

if has('win32') || has ('win64')
    autocmd GUIEnter * set transparency=250
    " set guifont=Migu_1M:h12
    " set guifontwide=Migu_1M:h12
    set guifont=consolas:h11
    set guifontwide=MS_GOTHIC:h11
endif

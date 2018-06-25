colorscheme gruvbox
set background=dark

" tool bar
set guioptions-=T 
" menu bar
set guioptions-=m 
" scroll bar
set guioptions=s
set vb t_vb=

" current line
set cursorline

set lines=30
set columns=100

if has('mac')
    set transparency=5
    "2byte文字対応
    " set ambiwidth=double
endif

if has('win32') || has ('win64')
    autocmd GUIEnter * set transparency=245
    set guifont=Cica:h12
    set guifontwide=Cica:h12
    " set rop=type:directx,renmode:5
endif


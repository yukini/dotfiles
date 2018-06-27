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
    set guifont=Cica:h16
    set guifontwide=Cica:h16
endif

if has('win32')
    autocmd GUIEnter * set transparency=245
    set guifont=Cica:h12
    set guifontwide=Cica:h12
endif


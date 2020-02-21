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

set lines=60
set columns=140

if has('mac')
    set transparency=5
    set guifont=Cica:h14
    set guifontwide=Cica:h14
endif

if has('win32')
    autocmd GUIEnter * set transparency=245
    set guifont=Cica:h12
    set guifontwide=Cica:h12
endif


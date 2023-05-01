set encoding=utf-8
scriptencoding utf-8 
"
" common
" ----------------------------------------------------------------------------------
"
colorscheme default
syntax on
set fileencoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,sjis
set fileformats=unix,dos,mac
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
set completeopt=menuone,noinsert
set scrolloff=5 " カーソル上下に表示する行数
set noswapfile
set nowritebackup
set nobackup
set noundofile
set autoread
set novisualbell " ビープ音を消す
set vb t_vb=     " ビープ音を消す
set clipboard=unnamed " OSのクリップボードを使う
set number
set relativenumber " 行番号
set ruler " 行列番号表示
set showmatch " 括弧の対を表示
set matchtime=3 " 括弧の対の表示秒数
set textwidth=0 " 自動改行無効
set shiftround " インデント
set ignorecase " スマートケース補完
set smartcase " スマートケース補完
set incsearch " インクリメンタルサーチ
set hlsearch " 検索ハイライト
set history=1000 " 履歴拡充
set showcmd " コマンド表示
set laststatus=2 " lightline表示
let mapleader = "\<Space>"
set list lcs=tab:\|\  " tab indent line
set ambiwidth=double
set t_Co=256
set noequalalways " 自動ウィンドウサイズ調整無効
set shortmess=a " spf13/spf13-vim/issues/540
set cmdheight=2 " spf13/spf13-vim/issues/540

if has('nvim')
  set viminfo='100,n$HOME/.vim/files/info/viminfo
endif


"
" Plug
" ----------------------------------------------------------------------------------
"
" vim-plug auto installation https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"
" quickrun
" ----------------------------------------------------------------------------------
"
Plug 'thinca/vim-quickrun'

" 
" lightline
" ----------------------------------------------------------------------------------
"
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
let g:lightline = {
            \ 'colorscheme': 'seoul256',
            \ 'component_function': {
            \   'filetype': 'MyFiletype',
            \   'fileformat': 'MyFileformat',
            \ }
            \ }
function! s:MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! s:MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

"
" colorscheme
" ----------------------------------------------------------------------------------
"
Plug 'morhetz/gruvbox'

"
" golang
" ----------------------------------------------------------------------------------
"
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"
" startify
" ----------------------------------------------------------------------------------
"
Plug 'mhinz/vim-startify'
let g:startify_custom_header = [
	\ '     +-+-+-+-+-+-+-+-+',
	\ '     | h | j | k | l |',
	\ '     +-+-+-+-+-+-+-+-+',
	\ ]
let g:startify_bookmarks= ["~/.vimrc", "~/.gvimrc"]
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

"
" git gutter
" ----------------------------------------------------------------------------------
"
Plug 'airblade/vim-gitgutter'
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" completion of parentheses
Plug 'cohama/lexima.vim'

" outline
Plug 'junegunn/goyo.vim'

call plug#end()


"
" keybind
" ----------------------------------------------------------------------------------
"
nnoremap <silent> <leader>o :TagbarToggle<CR>
nnoremap <silent> <leader>n :NERDTreeCWD<CR>

"
" colorscheme
" ----------------------------------------------------------------------------------
"
colorscheme gruvbox
set background=dark

set encoding=utf-8
scriptencoding utf-8

"
" common
" ----------------------------------------------------------------------------------
"
colorscheme default
syntax on
set fileencoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set fileformats=unix,dos,mac
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
set completeopt=menuone
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

"
" common
" ----------------------------------------------------------------------------------
"
call plug#begin('~/.vim/plugged')
" File manager
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neoyank.vim'

" Projct root
Plug 'airblade/vim-rooter'

" nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" quickrun
Plug 'thinca/vim-quickrun'

Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'Yggdroot/indentLine'

" colorscheme
Plug 'jonathanfilip/vim-lucius'
Plug 'w0ng/vim-hybrid'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'AlessandroYorba/Alduin'
Plug 'severin-lemaignan/vim-minimap'
Plug 'cocopon/iceberg.vim'

" syntax check
Plug 'w0rp/ale'

" surround
Plug 'tpope/vim-surround'

" Rust
" Plug 'rust-lang/rust.vim'
" elixir
" Plug 'elixir-lang/vim-elixir'
" Plug 'slashmili/alchemist.vim'

" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

" Auto Completion
" Plug 'Shougo/deoplete.nvim'
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'Valloric/YouCompleteMe'

" completion with tab
Plug 'ervandew/supertab'

" startify
Plug 'mhinz/vim-startify'

" tagbar
Plug 'majutsushi/tagbar'

" gitgutter
Plug 'airblade/vim-gitgutter'

" fugitive
Plug 'tpope/vim-fugitive'

" Projectroot
Plug 'dbakker/vim-projectroot'

" completion of parentheses
Plug 'cohama/lexima.vim'
call plug#end()

" 
" indent guide
" ----------------------------------------------------------------------------------
"
let g:indent_guides_tab_guides = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar', 'unite']

" 
" indentLine
" ----------------------------------------------------------------------------------
"
let g:indentLine_faster = 1
nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>

" 
" lightline
" ----------------------------------------------------------------------------------
"
let g:lightline = {
            \ 'colorscheme': 'seoul256',
            \ 'component_function': {
            \   'filetype': 'MyFiletype',
            \   'fileformat': 'MyFileformat',
            \ }
            \ }

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
" 
" deoplete
" ----------------------------------------------------------------------------------
"
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
if has('win64')
    let g:python3_host_prog = expand('~/AppData/Local/Programs/Python/Python35/python.exe')
endif
let g:deoplete#sources#go#gocode_binary = $GOPATH . '/bin/gocode.exe'
let g:deoplete#enable_smart_case = 1               "| smarrt case有効化。 大文字が入力されるまで大文字小文字の区別を無視する
let g:deoplete#enable_camel_case_completion = 1    "| camle caseを有効化。大文字を区切りとしたワイルドカードのように振る舞う
let g:deoplete#enable_underbar_completion = 1      "| _(アンダーバー)区切りの補完を有効化

"
" ale
" ----------------------------------------------------------------------------------
"
let g:ale_lint_on_text_changed = 0
let g:airline_theme='one'
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass

"
" startify
" ----------------------------------------------------------------------------------
"
let g:startify_bookmarks= ["~/.vimrc", "~/.gvimrc"]
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

"
" supertab
" ----------------------------------------------------------------------------------
"
let g:SuperTabDefaultCompletionType = "context"

"
" vim-go
" ----------------------------------------------------------------------------------
"
let g:go_fmt_command = "goimports"
let g:go_def_mode = 'godef'
let g:go_def_mapping_enabled = 1
let g:go_fmt_autosave = 1
let g:rehash256 = 1
let g:go_auto_type_info = 1
set updatetime=100
let g:go_auto_sameids = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_function = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_functions = 1
"
" gocode
" ----------------------------------------------------------------------------------
"
let g:go_gocode_unimported_packages = 1

"
" tagbar
" ----------------------------------------------------------------------------------
"
let g:tagbar_left = 0
let g:tagbar_autofocus = 1

"
" NERDTree
" ----------------------------------------------------------------------------------
"
let g:NERDTreeChDirMode = 2

"
" vim rooter
" ----------------------------------------------------------------------------------
"
let g:rooter_change_directory_for_non_project_files = 'current'

"
" keybind
" ----------------------------------------------------------------------------------
"
if has('win64')
    nnoremap <silent> <leader>t :terminal ++rows=5 ++close bash<CR>
endif
if has('mac')
    nn <silent> <leader>t :terminal ++close<CR>
endif

nnoremap <silent> <leader>o :TagbarToggle<CR>
nnoremap <silent> <leader>q :QuickRun<CR>
nnoremap <silent> <leader>n :NERDTreeCWD<CR>

"
" ctrlP
" ----------------------------------------------------------------------------------
"
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"
" Denite
" ----------------------------------------------------------------------------------
"
nnoremap <silent> * :<C-u>DeniteCursorWord -buffer-name=search
      \ -auto-highlight -mode=normal line<CR>
nnoremap <silent> / :<C-u>Denite -buffer-name=search -auto-highlight
      \ line<CR>
nnoremap <silent> <C-k> :<C-u>Denite -mode=normal change jump<CR>
nnoremap <silent> <C-t> :<C-u>Denite
      \ -select=`tabpagenr()-1` -mode=normal deol<CR>

nnoremap <silent> <leader><Space>
      \ :<C-u>Denite -mode=normal file_mru<CR>
nnoremap <silent> <leader>m
      \ :<C-u>Denite file_rec:~/.vim/rc<CR>

nnoremap <silent> <leader>b :Denite -mode=normal buffer<CR>
nnoremap <silent> <leader>r
      \ :<C-u>Denite -buffer-name=register
      \ register neoyank<CR>
nnoremap <silent> <leader>s :<C-u>Denite file_point file_old
      \ -sorters=sorter_rank
      \ `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec'`<CR>
nnoremap <silent> <leader>f :<C-u>Denite file_rec -path=
nnoremap <silent> <leader>g :<C-u>Denite -buffer-name=search
      \ -no-empty -mode=normal grep<CR>
xnoremap <silent> <leader>r
      \ :<C-u>Denite -default-action=replace -buffer-name=register
      \ register neoyank<CR>

nnoremap <silent> ft :<C-u>Denite filetype<CR>
nnoremap <silent> n :<C-u>Denite -buffer-name=search
      \ -resume -mode=normal -refresh<CR>
" nnoremap <silent><expr> tp  &filetype == 'help' ?
"       \ ":\<C-u>pop\<CR>" : ":\<C-u>Denite -mode=normal jump\<CR>"
" nnoremap <silent><expr> tt  &filetype == 'help' ?  "g\<C-]>" :
"       \ ":\<C-u>DeniteCursorWord -buffer-name=tag -immediately
"       \  tag:include\<CR>"

"
" Auto change current directory
" ----------------------------------------------------------------------------------
"
" function! ChangeCurrentDirectoryToProjectRoot()
"     let root = denite#util#path2project_directory(expand('%'))
"     execute 'lcd' root
" endfunction
" :au BufEnter * :call ChangeCurrentDirectoryToProjectRoot()

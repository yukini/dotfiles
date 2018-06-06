set encoding=utf-8
scriptencoding utf-8

"
" common
" ----------------------------------------------------------------------------------
"
colorscheme default
syntax on
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

"
" common
" ----------------------------------------------------------------------------------
"
call plug#begin('~/.vim/plugged')
" File manager
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/denite.nvim'
Plug 'scrooloose/nerdtree'
Plug 'thinca/vim-quickrun'

Plug 'itchyny/lightline.vim'
" Plug 'nathanaelkane/vim-indent-guides'

" colorscheme
Plug 'jonathanfilip/vim-lucius'
Plug 'w0ng/vim-hybrid'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'AlessandroYorba/Alduin'
Plug 'severin-lemaignan/vim-minimap'
" syntax check
Plug 'w0rp/ale'

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
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

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
" 起動時に機能ON
let g:indent_guides_enable_on_vim_startup=1
" ガイドの幅
let g:indent_guides_guide_size = 1

" 
" lightline
" ----------------------------------------------------------------------------------
"
let g:lightline = {
      \ 'colorscheme': 'seoul256'
      \ }

" 
" golang
" ----------------------------------------------------------------------------------
"
let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 0
let g:go_fmt_autosave = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

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
" godef
" ----------------------------------------------------------------------------------
"
let g:go_def_mode = 'godef'
let g:go_def_mapping_enabled = 1

"
" startify
" ----------------------------------------------------------------------------------
"
let g:startify_bookmarks= ["~/.vimrc", "~/.gvimrc"]

"
" supertab
" ----------------------------------------------------------------------------------
"
let g:SuperTabDefaultCompletionType = "context"

"
" vim-go
" ----------------------------------------------------------------------------------
"
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1 
let g:rehash256 = 1
let g:go_auto_type_info = 1
set updatetime=100
let g:go_auto_sameids = 1

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
" terminal
" ----------------------------------------------------------------------------------
"
if has('win64')
    nn <silent> <leader>t :terminal ++rows=5 ++close bash<CR>
    nn <silent> <leader>o :TagbarToggle<CR>
endif
if has('mac')
    nn <silent> <leader>t :terminal ++close<CR>
endif

nn <silent> <leader>q :QuickRun<CR>

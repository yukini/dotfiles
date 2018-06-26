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
set t_Co=256
set noequalalways " 自動ウィンドウサイズ調整無効

"
" Plug
" ----------------------------------------------------------------------------------
"
call plug#begin('~/.vim/plugged')
" File manager
"
" ctrlP
" ----------------------------------------------------------------------------------
"
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_lazy_update=1
if executable('ag')
  let g:ctrlp_use_caching=0
  let g:ctrlp_user_command='ag %s -i --nocolor --nogroup -g ""'
endif

"
" Denite
" ----------------------------------------------------------------------------------
"
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neoyank.vim'

" key map
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
nnoremap <silent> <leader>f :<C-u>Denite file_rec<CR>
nnoremap <silent> <leader>g :<C-u>Denite -buffer-name=search
      \ -no-empty -mode=normal grep<CR>
xnoremap <silent> <leader>r
      \ :<C-u>Denite -default-action=replace -buffer-name=register
      \ register neoyank<CR>

nnoremap <silent> ft :<C-u>Denite filetype<CR>
nnoremap <silent> n :<C-u>Denite -buffer-name=search
      \ -resume -mode=normal -refresh<CR>

"
" vim rooter
" ----------------------------------------------------------------------------------
"
Plug 'airblade/vim-rooter'
let g:rooter_change_directory_for_non_project_files = 'current'

"
" NERDTree, Projectroot - project manager
" ----------------------------------------------------------------------------------
"
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'dbakker/vim-projectroot'
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowHidden = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" 
" indentLine
" ----------------------------------------------------------------------------------
"
Plug 'Yggdroot/indentLine'
let g:indentLine_faster = 1
nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>
let g:indentLine_fileTypeExclude = ['help', 'nerdtree', 'startify']

" quickrun
Plug 'thinca/vim-quickrun'
" nnoremap <silent> <leader>q :QuickRun<CR>

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

" colorscheme
Plug 'jonathanfilip/vim-lucius'
Plug 'w0ng/vim-hybrid'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'AlessandroYorba/Alduin'
Plug 'severin-lemaignan/vim-minimap'
Plug 'cocopon/iceberg.vim'

"
" ale - syntax check
" ----------------------------------------------------------------------------------
"
Plug 'w0rp/ale'
let g:ale_lint_on_text_changed = 0
let g:airline_theme='one'
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass

" surround
Plug 'tpope/vim-surround'

" comment
Plug 'tpope/vim-commentary'

"
" golang
" ----------------------------------------------------------------------------------
"
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
let g:go_gocode_unimported_packages = 1
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_build_tags = "-tags"
let g:go_fmt_command = "goimports"
let g:go_def_mode = 'godef'
let g:go_def_mapping_enabled = 1
let g:go_fmt_autosave = 1
let g:rehash256 = 1
let g:go_auto_type_info = 1
" set updatetime=100
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
" supertab - completion with tab
" ----------------------------------------------------------------------------------
"
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

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
" tagbar
" ----------------------------------------------------------------------------------
"
Plug 'majutsushi/tagbar'
let g:tagbar_left = 0
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0

"
" git gutter
" ----------------------------------------------------------------------------------
"
Plug 'airblade/vim-gitgutter'
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" fugitive
Plug 'tpope/vim-fugitive'

" completion of parentheses
Plug 'cohama/lexima.vim'

" outline
Plug 'junegunn/goyo.vim'

"
" ack.vim - ag
" ----------------------------------------------------------------------------------
"
Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'

" 
" Clojure
" ----------------------------------------------------------------------------------
"
Plug 'tpope/vim-classpath', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'tpope/vim-salve', { 'for': 'clojure' }
Plug 'tpope/vim-projectionist', { 'for': 'clojure' }
Plug 'tpope/vim-dispatch', { 'for': 'clojure' }
Plug 'kien/rainbow_parentheses.vim', { 'for': 'clojure' }
Plug 'tpope/vim-repeat'
" Evaluate Clojure buffers on load
autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry
" setup clojure rainbow highlighting
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesActivate
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadRound
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadSquare
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadBraces
autocmd BufEnter *.cljs,*.clj,*.cljs.hl setlocal iskeyword+=?,-,*,!,+,/,=,<,>,.,:

"
" emmet
" ----------------------------------------------------------------------------------
"
Plug 'mattn/emmet-vim'
autocmd FileType html,css,scss imap <buffer><expr><tab>
    \ emmet#isExpandable() ? "\<plug>(emmet-expand-abbr)" :
    \ "\<tab>"
let g:user_emmet_expandabbr_key = '<C-Space>'

"
" open browser
" ----------------------------------------------------------------------------------
"
Plug 'tyru/open-browser.vim'
command! OpenBrowserCurrent execute "OpenBrowser" expand("%:p")

" 
" deoplete
" ----------------------------------------------------------------------------------
"
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-go', { 'do': 'make'}
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
if has('win32')
    let g:python3_host_prog = expand('~/AppData/Local/Programs/Python/Python35/python.exe')
endif
let g:deoplete#sources#go#gocode_binary = $GOPATH . '/bin/gocode.exe'
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case_completion = 1
let g:deoplete#enable_underbar_completion = 1

call plug#end()



"
" keybind
" ----------------------------------------------------------------------------------
"
if has('win32')
    nnoremap <silent> <leader>t :terminal ++rows=5 ++close bash<CR>
endif
if has('mac')
    nn <silent> <leader>t :terminal ++close<CR>
endif

nnoremap <silent> <leader>o :TagbarToggle<CR>
nnoremap <silent> <leader>n :NERDTreeCWD<CR>

" Ag command on grep source
if executable('ag')
    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
    call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif
call denite#custom#option('default', 'winheight', 10)

"
" colorscheme
" ----------------------------------------------------------------------------------
"
colorscheme gruvbox
set background=dark

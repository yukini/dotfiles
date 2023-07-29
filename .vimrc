
set encoding=utf-8
scriptencoding utf-8 

if has('nvim')
  set viminfo='100,n$HOME/.vim/files/info/viminfo
endif

"
" keybind
" ----------------------------------------------------------------------------------
"
nmap <Tab> :tabnext<CR>
nmap <S-Tab> :tabprevious<CR>
nmap te :tabedit

"
" common
" ----------------------------------------------------------------------------------
"
colorscheme default
syntax on
syntax enable
filetype plugin indent on
set fileencoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,sjis
set fileformats=unix,dos,mac
set autoindent
set tabstop=4
set shiftwidth=4
set completeopt=menuone,noinsert
set scrolloff=10

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
" set ambiwidth=double " ■や※の表示が崩れるのを防ぐ → 諸々デザインが崩れるためrbtnn/vim-ambiwidth(setcellwidths)で対処済み
set t_Co=256
set noequalalways " 自動ウィンドウサイズ調整無効
set shortmess=a " spf13/spf13-vim/issues/540
set cmdheight=2 " spf13/spf13-vim/issues/540


"
" Plug
" ----------------------------------------------------------------------------------
"
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
let g:lightline = {
			\ 'active': { 
			\   'left': [
			\     ['mode', 'paste'],
			\     ['ctrlpmark', 'git', 'diagnostic', 'cocstatus', 'filename', 'method']
			\   ],
			\   'right': [ 
			\     ['lineinfo'], 
			\     ['percent'], 
			\     ['fileformat', 'fileencoding', 'filetype'],
			\     ['coc', 'coc-function'],
			\     ['git-status', 'git-blame']
			\   ]
			\ },
            \ 'colorscheme': 'gruvbox_material',
            \ 'component_function': {
            \   'coc': 'coc#status',
            \   'coc-function': 'LightlineCocFunction',
            \   'git-status': 'LightlineGitStatus',
            \   'git-blame': 'LightlineGitBlame',
            \   },
			\ 'component': {
			\   'charvaluehex': '0x%B'
			\   }
            \ }

"
" colorscheme
" ----------------------------------------------------------------------------------
"
Plug 'morhetz/gruvbox'
Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'
Plug 'AlexvZyl/nordic.nvim'

"
" golang
" ----------------------------------------------------------------------------------
"
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"
" coc
" ----------------------------------------------------------------------------------
"
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
      \'coc-actions',
      \'coc-cspell-dicts', 
      \'coc-deno', 
      \'coc-diagnostic', 
      \'coc-dictionary', 
      \'coc-eslint', 
      \'coc-floaterm', 
      \'coc-git', 
      \'coc-highlight',
      \'coc-java', 
      \'coc-jedi', 
      \'coc-json', 
      \'coc-lists', 
      \'coc-markdownlint', 
      \'coc-metals', 
      \'coc-pairs', 
      \'coc-prettier', 
      \'coc-snippets', 
      \'coc-spell-checker', 
      \'coc-tslint-plugin', 
      \'coc-tsserver', 
      \'coc-ultisnips', 
      \'coc-yaml',
      \'coc-rust-analyzer',
      \'coc-explorer',
\]
" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" coc-explorer
nmap <space>e <Cmd>CocCommand explorer<CR>

" 
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() 
								\ ? coc#pum#confirm()
								\ : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" TAB
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')


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
let g:startify_bookmarks= ["~/.vimrc", "~/.zshrc"]

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

function! LightlineCocFunction() abort
  let result = get(b:, 'coc_function', '')
  return winwidth(0) > 120 ? result : ''
endfunction

function! LightlineGitStatus() abort
  let result = get(g:, 'coc_git_status', '')
  return winwidth(0) > 120 ? result : ''
endfunction

function! LightlineGitBlame() abort
  let result = get(b:, 'coc_git_blame', '')
  return winwidth(0) > 120 ? result : ''
endfunction

"
" git gutter
" ----------------------------------------------------------------------------------
"
" Plug 'airblade/vim-gitgutter'
" let g:gitgutter_sign_added = '∙'
" let g:gitgutter_sign_modified = '∙'
" let g:gitgutter_sign_removed = '∙'
" let g:gitgutter_sign_modified_removed = '∙'

" completion of parentheses
" Plug 'cohama/lexima.vim'

" outline
Plug 'junegunn/goyo.vim'

"
" Rust
" ----------------------------------------------------------------------------------
"
Plug 'rust-lang/rust.vim'
" 保存時に自動でrustfmt
let g:rustfmt_autosave = 1

"
" Fern
" ----------------------------------------------------------------------------------
"
"ファイラ
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'lambdalisue/fern-git-status.vim'

"
" Telescope
" ----------------------------------------------------------------------------------
"
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }

Plug 'rbtnn/vim-ambiwidth'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

call plug#end()



" Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
  highlight = {
    enable = true,
  },
  ensure_installed = { 
    "c", 
    "lua", 
    "vim", 
    "vimdoc", 
    "query", 
    "java", 
    "rust", 
    "javascript", 
    "go", 
    "graphql", 
    "json", 
  },
}
EOF

"
" colorscheme
" ----------------------------------------------------------------------------------
"
let g:gruvbox_material_enable_bold=1
let g:gruvbox_material_enable_italic=1
let g:gruvbox_material_diagnostic_text_highlight=1
let g:gruvbox_material_diagnostic_line_highlig=1
let g:gruvbox_material_transparent_background=2
let g:gruvbox_material_foreground='material'
let g:gruvbox_material_ui_contrast='high'
colorscheme gruvbox-material

set termguicolors
set background=dark

" transparency in iTerm2
hi Normal ctermbg=NONE guibg=NONE

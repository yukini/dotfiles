set encoding=utf-8
scriptencoding utf-8 

if has('nvim')
	set viminfo='100,n$HOME/.vim/files/info/viminfo
endif

"
" common
" ----------------------------------------------------------------------------------
"
colorscheme default
syntax on
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
set list lcs=tab:\|\  " tab indent line
set t_Co=256
set noequalalways " 自動ウィンドウサイズ調整無効
set shortmess=a " spf13/spf13-vim/issues/540
set cmdheight=2 " spf13/spf13-vim/issues/540

let g:mapleader = "\<Space>"

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
			\'coc-explorer',
			\'coc-eslint', 
			\'coc-git', 
			\'coc-highlight',
			\'coc-java', 
			\'coc-jedi', 
			\'coc-json', 
			\'coc-lists', 
			\'coc-markdownlint', 
			\'coc-pairs', 
			\'coc-prettier', 
			\'coc-rust-analyzer',
			\'coc-snippets', 
			\'coc-spell-checker', 
			\'coc-tslint-plugin', 
			\'coc-tsserver', 
			\'coc-ultisnips', 
			\'coc-yaml',
			\]
" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

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

"
" outline
" ----------------------------------------------------------------------------------
"
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"
" Rust
" ----------------------------------------------------------------------------------
"
Plug 'rust-lang/rust.vim'
" 保存時に自動でrustfmt
let g:rustfmt_autosave = 1

"
" Telescope
" ----------------------------------------------------------------------------------
"
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'fannheyward/telescope-coc.nvim'
if !has('memo')
	echo "https://github.com/mattn/memo"
endif

"
" Treesitter
" ----------------------------------------------------------------------------------
"
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"
" Others
" ----------------------------------------------------------------------------------
"
Plug 'rbtnn/vim-ambiwidth'
Plug 'nvim-tree/nvim-web-devicons'

Plug 'glidenote/memolist.vim'
Plug 'delphinus/telescope-memo.nvim'

call plug#end()

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

"
" keybind
" ----------------------------------------------------------------------------------
"
nmap <leader><Tab> :tabnext<CR>
nmap <leader><S-Tab> :tabprevious<CR>
nmap te :tabedit

"
" keybind (COC)
" ----------------------------------------------------------------------------------
"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() 
			\ ? coc#pum#confirm()
			\ : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" TAB
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"

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

"
" keybind (Telescope)
" ----------------------------------------------------------------------------------
"
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fd <cmd>Telescope coc diagnostics<cr>

lua <<EOF
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").setup {
	pickers = {
		find_files = {
		}
	},
	extensions = {
		file_browser = {
			grouped = true,
			hijack_netrw = true,
			initial_mode = "normal",
			depth = 2,
			auto_depth = true,
			collapse_dirs = true,
		},
		coc = {
			prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
		}
	},
}
require('telescope').load_extension('file_browser')
require('telescope').load_extension('coc')
require('telescope').load_extension('memo')

-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
  "n",
  "<leader>e",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
	sync_install = false,
	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,
	highlight = {
		enable = true,
	},
	autotag = {
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
		"toml", 
		"tsx", 
		"yaml", 
		"css", 
		"html", 
	},
}
EOF

if executable('volta')
  let g:node_host_prog = trim(system("volta which neovim-node-host"))
endif

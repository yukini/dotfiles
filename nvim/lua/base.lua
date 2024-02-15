vim.cmd('autocmd!')

vim.encoding        = 'utf-8'
vim.scriptencoding  = 'utf-8'

vim.g.mapleader     = ' '

vim.wo.number       = true

vim.opt.title       = true
vim.opt.autoindent  = true
vim.opt.smartindent = true
vim.opt.hlsearch    = true
vim.opt.backup      = false
vim.opt.writebackup = false
vim.opt.showcmd     = true
vim.opt.cmdheight   = 1
vim.opt.laststatus  = 2
vim.opt.expandtab   = true
vim.opt.scrolloff   = 10
vim.opt.shell       = 'zsh'
vim.opt.inccommand  = 'split'
vim.opt.ignorecase  = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab    = true
vim.opt.breakindent = true
vim.opt.shiftwidth  = 2
vim.opt.tabstop     = 2
vim.opt.wrap        = false  -- No Wrap lines
vim.opt.updatetime  = 300
vim.opt.autochdir   = true   -- Change the current working directory automatically
vim.opt.signcolumn  = 'yes'
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.conceallevel = 1     -- 例えばJSONファイル開いたときにパラメータ名を囲うダブルクォーテーションを表示する設定。Obsidian.nvimがlevel=1を要求するため設定する。
vim.opt.mouse = ""

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd('InsertLeave', { pattern = '*', command = 'set nopaste' })

-- common key bind
vim.keymap.set('n', '<leader><Tab>', ':tabnext<CR>')
vim.keymap.set('n', '<leader><S-Tab>', ':tabprevious<CR>')
vim.keymap.set('n', 'te', ':tabedit')

-- self variables
vim.g.obsidian_vault = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/solani"

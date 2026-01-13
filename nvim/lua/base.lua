vim.cmd('autocmd!')

-- 文字コード設定
vim.encoding        = 'utf-8'
vim.scriptencoding  = 'utf-8'

-- Leaderキー設定
vim.g.mapleader     = ' '

vim.wo.number       = true   -- 行番号を表示

-- 表示・操作設定
vim.opt.title       = true   -- タイトルを表示
vim.opt.autoindent  = true   -- 自動インデント
vim.opt.smartindent = true   -- スマートインデント
vim.opt.hlsearch    = true   -- 検索結果をハイライト
vim.opt.backup      = false  -- バックアップファイルを作成しない
vim.opt.writebackup = false  -- 上書き保存時にバックアップを作成しない
vim.opt.showcmd     = true   -- 入力中のコマンドを表示
vim.opt.cmdheight   = 1      -- コマンドラインの高さ
vim.opt.laststatus  = 2      -- ステータスラインを常に表示
vim.opt.expandtab   = true   -- タブをスペースに変換
vim.opt.scrolloff   = 10     -- カーソル上下の余白行数
vim.opt.shell       = 'zsh'  -- 使用するシェル
vim.opt.inccommand  = 'split'-- 置換のプレビューを分割ウィンドウで表示
vim.opt.ignorecase  = true   -- 検索時に大文字小文字を区別しない
vim.opt.smarttab    = true   -- 行頭のタブ幅をshiftwidthに合わせる
vim.opt.breakindent = true   -- 折り返し時にインデントを維持
vim.opt.shiftwidth  = 2      -- インデント幅
vim.opt.tabstop     = 2      -- タブ幅
vim.opt.wrap        = false  -- 行を折り返さない
vim.opt.updatetime  = 300    -- 更新時間 (ms)
vim.opt.autochdir   = true   -- ファイルを開いたディレクトリにカレントディレクトリを移動
vim.opt.signcolumn  = 'yes'  -- サインカラムを常に表示
vim.opt.path:append { '**' } -- ファイル検索でサブディレクトリも検索
vim.opt.wildignore:append { '*/node_modules/*' } -- ワイルドカード展開で無視するパターン
vim.opt.conceallevel = 0     -- テキストの隠蔽レベル (Markdownなどで使用) 
-- vim.opt.mouse = ""

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd('InsertLeave', { pattern = '*', command = 'set nopaste' })

-- 共通キーバインド
vim.keymap.set('n', '<leader><Tab>', ':tabnext<CR>')      -- 次のタブへ
vim.keymap.set('n', '<leader><S-Tab>', ':tabprevious<CR>')-- 前のタブへ
vim.keymap.set('n', 'te', ':tabedit')                     -- 新しいタブを開く
vim.keymap.set('n', '<leader>s', ':ObsidianSearch<CR>')   -- Obsidian検索

-- 独自変数定義
vim.g.obsidian_vault = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/solani"

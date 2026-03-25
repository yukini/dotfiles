-- クリップボードをMacのシステムクリップボードと連携 (pbcopy/pbpaste)
vim.opt.clipboard:append { 'unnamedplus' }

-- Mac標準の内蔵英単語辞書をNeovimの補完（<C-x><C-k>など）で使えるようにする
vim.opt.dictionary:append('/usr/share/dict/words')

-- [オプション] HomebrewでインストールしたPython3のパスを明示（起動遅延やプラグインの不整合を回避）
-- ご自身の環境に合わせてコメントアウトを外してください。
-- Apple Silicon (M1/M2/M3) の場合:
-- vim.g.python3_host_prog = '/opt/homebrew/bin/python3'
-- Intel Mac の場合:
-- vim.g.python3_host_prog = '/usr/local/bin/python3'

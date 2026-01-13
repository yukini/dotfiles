return {
  {
    -- Go Plugin
    -- Go言語の基本サポート (主にバイナリ更新用として利用、LSPはgoplsを使用)
    'fatih/vim-go',
--    enabled = false, -- use lsp
    build = ':GoUpdateBinaries'
  },
  {
    -- DAP for Go
    -- Go言語用のデバッグ設定 (Delveラッパー)
    "leoluz/nvim-dap-go",
    config = function ()
      require('dap-go').setup()
    end
  }
}

return {

  {
    -- DAP for Go
    -- Go言語用のデバッグ設定 (Delveラッパー)
    "leoluz/nvim-dap-go",
    config = function ()
      require('dap-go').setup()
    end
  }
}

return {
  {
    'fatih/vim-go',
--    enabled = false, -- use lsp
    build = ':GoUpdateBinaries'
  },
  {
    "leoluz/nvim-dap-go",
    config = function ()
      require('dap-go').setup()
    end
  }
}

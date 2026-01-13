return {
  -- {
  --   'rust-lang/rust.vim',
  --   config = function()
  --     vim.g.rustfmt_autosave = 1
  --   end
  -- },
  {
    -- Rust Plugin
    -- Rust言語の強力なIDE機能 (LSP, DAP, Formattingなど) を提供
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    ft = { 'rust' },
    config = function()
      local bufnr = vim.api.nvim_get_current_buf()
      vim.keymap.set("n", "<leader>h",
        function()
          vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
          -- or vim.lsp.buf.codeAction() if you don't want grouping.
        end,
        { silent = true, buffer = bufnr }
      )
    end
  },
}

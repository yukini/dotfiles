return {
  {
    -- Formatter
    -- コードの自動整形を行う (LSPのFormat機能より強力で柔軟)
    'stevearc/conform.nvim',
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- 手動フォーマット: <leader>f
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      -- ファイルタイプごとのフォーマッタ設定
      -- ここに記述したコマンドは mason-tool-installer でインストールされる必要がある
      formatters_by_ft = {
        lua = { "stylua" },
        -- Go: goimports (import整理) -> gofumpt (厳格な整形) の順に実行
        go = { "goimports", "gofumpt" },
        -- rust = { "rustfmt" }, -- Rustaceanvimがやってくれるので不要だが、予備として
        
        -- javascript/typescript etc...
        -- javascript = { { "prettierd", "prettier" } },
      },
      -- 保存時の自動フォーマット設定
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true, -- フォーマッタがない場合はLSPを使用
      },
    },
  },
}

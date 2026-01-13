return {
  {
    -- East Asian Width Fix
    -- 全角表記させたい文字群に対して文字幅指定してくれているプラグイン
    'rbtnn/vim-ambiwidth',
    config = function()
      vim.g.ambiwidth_add_list = {
      }
    end
  },
  {
    -- Text Alignment
    -- テキストを整形・整列する (`gaip=`で=揃えなど)
    'junegunn/vim-easy-align',
    config = function()
      vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', { noremap = true })
      vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', { noremap = true })
    end
  },
  {
    -- Key Binding Helper
    -- キーバインドのサジェストを表示する
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    -- Search Highlight
    -- 検索時のハイライトを強化し、マッチ数などを表示する
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('hlslens').setup()

      local kopts = { noremap = true, silent = true }

      vim.api.nvim_set_keymap('n', 'n',
        [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'N',
        [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)
    end,
  },
  -- Smooth Cursor
  -- 行移動時のカーソルアニメーションを追加する
  {
    'gen740/SmoothCursor.nvim',
    config = function()
      require('smoothcursor').setup()
    end,
  },
  -- Indent Guides
  -- インデントラインを可視化する
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
  {
    -- Git Integration
    -- Gitの差分表示や操作を行う
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },

  {
    -- Code Outline
    -- コードのアウトライン（構造）を表示する
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      -- Your setup opts here
    },
  },
  {
    -- Utility Modules (Surround, Pairs, Comment)
    -- 括弧操作(surround)、自動括弧(pairs)、コメントアウト(comment)などの便利機能群
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
      require('mini.surround').setup()
      require('mini.pairs').setup()
      require('mini.comment').setup()
    end
  },
}

return {
  {
    -- 全角表記させたい文字群に対して文字幅指定してくれているプラグイン
    -- ambiwidth=doubleで運用していたが、
    -- cocのポップアップなど、ambiwidth=singleでないとレイアウトが崩れる機能に対して
    -- ambiwidth=single + このプラグインでdoubleにしたい文字群を指定することで解決される
    'rbtnn/vim-ambiwidth',
    config = function()
      vim.g.ambiwidth_add_list = {
      }
    end
  },

  {
    -- いい感じにテキスト整形してくれる `gaip=`で=揃え、`gaip `でスペース揃えなど
    'junegunn/vim-easy-align',
    config = function()
      vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', { noremap = true })
      vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', { noremap = true })
    end
  },
  {
    -- キーバインドのサジェスト
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
    -- 検索した際のhighlightの強化プラグイン、検索総数と何番目の検索結果かが表示される
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
  -- `gcc`でコメントアウトできる
  -- 言語ごとのコメントアウト記法を全て管理しているのすごいね
  -- https://github.com/numToStr/Comment.nvim/blob/master/lua/Comment/ft.lua
  {
    'numToStr/Comment.nvim',
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      -- add any options here
    },
    lazy = false,
  },
  -- 行移動に追従するカーソルが出てくる、それだけ
  {
    'gen740/SmoothCursor.nvim',
    config = function()
      require('smoothcursor').setup()
    end,
  },
  -- インデントをデコレーションしてくれる
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
  -- 右下にLSPの状態を表示


  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },

  {
    -- アウトライン表示、長いコード読むときに使うくらい。
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
  -- {
  --   "nvim-zh/colorful-winsep.nvim",
  --   event = { "WinNew" },
  --   config = function()
  --     require("colorful-winsep").setup({
  --       hi = {
  --         bg = "",
  --         fg = "#94985D",
  --       },
  --       smooth = false,
  --     })
  --   end
  -- },
  {
    -- カッコやクォーテーションで囲める。たまにしか使わないので、都度使い方を調べてる…
    "kylechui/nvim-surround",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
}

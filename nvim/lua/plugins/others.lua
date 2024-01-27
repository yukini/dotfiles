return {
  {
    -- 全角表記させたい文字群に対して文字幅指定してくれているプラグイン
    -- ambiwidth=doubleで運用していたが、
    -- cocのポップアップなど、ambiwidth=singleでないとレイアウトが崩れる機能に対して
    -- ambiwidth=single + このプラグインでdoubleにしたい文字群を指定することで解決される
    'rbtnn/vim-ambiwidth',
    config = function ()
      vim.g.ambiwidth_add_list = {
      }
    end
  },
  {
    -- 行番号を相対的に表示する
    'myusuf3/numbers.vim',
    config=function()
      vim.g.numbers_exclude = {
        'alpha',
        'calendar',
        'coc-explorer',
      }
    end,
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
    -- normal/insert/visualなどのモードによって行の背景色を変更できる
    -- gruvboxだとinsert時に背景が明るくなるが、これを入れると暗くなる
    'mvllow/modes.nvim',
    version= 'v0.2.0',
    -- enabled = false,
    config = function()
      require('modes').setup()
    end
  },
  {
    -- 検索した際のhighlightの強化プラグイン、検索総数と何番目の検索結果かが表示される
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('hlslens').setup()

      local kopts = {noremap = true, silent = true}

      vim.api.nvim_set_keymap('n', 'n',         [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'N',         [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', '*',         [[*<Cmd>lua require('hlslens').start()<CR>]],                                             kopts)
      vim.api.nvim_set_keymap('n', '#',         [[#<Cmd>lua require('hlslens').start()<CR>]],                                             kopts)
      vim.api.nvim_set_keymap('n', 'g*',        [[g*<Cmd>lua require('hlslens').start()<CR>]],                                            kopts)
      vim.api.nvim_set_keymap('n', 'g#',        [[g#<Cmd>lua require('hlslens').start()<CR>]],                                            kopts)
      vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>',                                                                           kopts)

    end,
  },
  -- `gcc`でコメントアウトできる
  -- 言語ごとのコメントアウト記法を全て管理しているのすごいね
  -- https://github.com/numToStr/Comment.nvim/blob/master/lua/Comment/ft.lua
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },
  -- アウトライン出してくれる
  -- ソース読むときには便利だけど、そんなにVimで読まない
  -- Telescopeとも連携していて、<leader>faでも呼び出せるが、そんなにVimで(ry
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    config = function ()
      -- Call the setup function to change the default behavior
      require("aerial").setup({
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
        -- Priority list of preferred backends for aerial.
        -- This can be a filetype map (see :help aerial-filetype-map)
        backends = { "treesitter", "lsp", "markdown", "man", "telekasten" },
        -- You probably also want to set a keymap to toggle aerial
        vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
      })
    end,
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
}

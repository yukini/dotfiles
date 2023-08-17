return {
  'rbtnn/vim-ambiwidth',
  'myusuf3/numbers.vim',
  {
    'junegunn/vim-easy-align',
    config = function()
      vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', { noremap = true })
      vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', { noremap = true })
    end
  },
  {
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
    'mvllow/modes.nvim',
    version= 'v0.2.0',
    config = function()
      require('modes').setup()
     end
   },
  {
    'kevinhwang91/nvim-hlslens',
    config = function()
      -- require('hlslens').setup()
      require("scrollbar.handlers.search").setup({
        -- hlslens config overrides
      })

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
  {
    'petertriho/nvim-scrollbar',
    dependencies = {'folke/tokyonight.nvim'},
    config = function()
      local colors = require("tokyonight.colors").setup()
      require("scrollbar").setup({
        handle = {
          color = colors.bg_highlight,
        },
        marks = {
          Search = { color = colors.orange },
          Error  = { color = colors.error },
          Warn   = { color = colors.warning },
          Info   = { color = colors.info },
          Hint   = { color = colors.hint },
          Misc   = { color = colors.purple },
        }
      })
    end,
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },

}

-- telescope, treesitter などの汎用的なツール利用プラグイン管理
return {
  {
    -- Fuzzy Finder (files, lsp, etc)
    -- 曖昧検索でファイルやバッファ、grep検索などができる強力なツール
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-telescope/telescope-frecency.nvim',
        'smartpde/telescope-recent-files',
      }
    },
    config = function(_, opts)
      require("telescope").setup {
        defaults = {
          -- wrap_results = true,
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
        },
        pickers = {
          find_files = {
            -- theme = "dropdown",
          }
        },
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          },
          file_browser = {
            -- theme = 'dropdown',
            hijack_netrw = true,
            initial_mode = 'normal',
            depth = 1,
          },
          frecency = {
          }
        },
      }
      -- require('telescope').load_extension('aerial')
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('file_browser')
      require('telescope').load_extension('frecency')
      require("telescope").load_extension("recent_files")
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader><leader>', ':Telescope frecency<CR>')
      vim.keymap.set('n', '<leader>e', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { noremap = true })
      -- vim.keymap.set('n', '<leader>fa', ':Telescope aerial<CR>', {})
      vim.keymap.set('n', '<leader>fr', ':Telescope recent_files pick<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
    end
    ,
  },
  {
    -- Syntax Highlighting
    -- 高度なシンタックスハイライトを提供する
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        sync_install = false,
        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,
        highlight = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
        ensure_installed = {
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "java",
          "rust",
          "javascript",
          "go",
          "graphql",
          "json",
          "toml",
          "tsx",
          "yaml",
          "css",
          "html",
          "markdown",
          "markdown_inline",
        },
      }
    end,
  },
  {
    -- Word highlight
    -- カーソル直下の単語と同じ単語をハイライト表示する
    'RRethy/vim-illuminate',
  },
}

return {
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.2',
    dependencies = {
      {
        'nvim-lua/plenary.nvim'
      }
    },
    config = function()
      require("telescope").setup {
        pickers = {
          find_files = {
          }
        },
        extensions = {
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
          },
          file_browser = {
            theme = 'dropdown',
            -- grouped = true,
            -- hijack_netrw = true,
            initial_mode = "normal",
            depth = 1,
            -- auto_depth = true,
            -- collapse_dirs = true,
          },
          coc = {
            prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
          }
        },
      }
      require("telescope").load_extension("aerial")
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('file_browser')
      require('telescope').load_extension('coc')
      --
      -- open file_browser with the path of the current buffer
      -- vim.api.nvim_set_keymap( "n", "<leader>e", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
      vim.keymap.set('n', '<leader>fa', ":Telescope aerial<CR>", {})
    end
    ,
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  {
    'fannheyward/telescope-coc.nvim',
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require "telescope".load_extension("frecency")
      vim.api.nvim_set_keymap("n", "<leader><leader>", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>",
      { noremap = true, silent = true })
    end,
    dependencies = { "kkharji/sqlite.lua" }
  },
}

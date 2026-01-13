local obsidian_vault = vim.g.obsidian_vault
local obsidian_vault_path = vim.fn.expand(obsidian_vault)
return {
  {
    -- Markdown Preview
    -- ブラウザでのMarkdownリアルタイムプレビュー
    'iamcco/markdown-preview.nvim',
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      -- recognized filetypes
      -- these filetypes will have MarkdownPreview... commands
      vim.g.mkdp_filetypes = { 'markdown', 'plantuml', }

      -- set default theme (dark or light)
      -- By default the theme is define according to the preferences of the system
      vim.g.mkdp_theme = 'light'
    end,
  },
  {
    -- PlantUML Syntax
    -- PlantUMLのシンタックスハイライト
    'aklt/plantuml-syntax',
  },
  {
    -- Obsidian Integration
    -- Obsidian (ノートアプリ) との連携機能
    "epwalsh/obsidian.nvim",
    version = "*",   -- recommended, use latest release instead of latest commit
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
      -- "hrsh7th/nvim-cmp", -- removed in favor of blink.cmp
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter",
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = obsidian_vault_path,
        },
      },
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "diary/daily",
      },
      ui = {
        enable = false,
        -- Define how various check-boxes are displayed
        checkboxes = {
          -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
          [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
          ["x"] = { char = "", hl_group = "ObsidianDone" },
        },
      }
    },
  },
}

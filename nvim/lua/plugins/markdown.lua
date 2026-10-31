local obsidian_vault = vim.g.obsidian_vault
local obsidian_vault_path = vim.fn.expand(obsidian_vault)
return {
  {
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
    'aklt/plantuml-syntax',
  },
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",   -- recommended, use latest release instead of latest commit
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter",
    },
    opts = {
      legacy_commands = false,
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
      }
    },
  },
}

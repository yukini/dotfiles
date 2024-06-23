local obsidian_vault = vim.g.obsidian_vault
local obsidian_vault_path = vim.fn.expand(obsidian_vault)

return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
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
          -- [">"] = { char = "", hl_group = "ObsidianRightArrow" },
          -- ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
        },
      }
    },
  },
}

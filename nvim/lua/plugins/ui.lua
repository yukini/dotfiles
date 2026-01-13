return {
  {
    -- Colorscheme
    -- メインのカラースキーム (Gruvbox Material)
    'sainnhe/gruvbox-material',
    lazy = false,    -- 起動時に即座に読み込む
    priority = 1000, -- 他のプラグインより先にロードする
    config = function()
      vim.g.gruvbox_material_enable_bold               = 1
      vim.g.gruvbox_material_enable_italic             = 1
      vim.g.gruvbox_material_diagnostic_text_highlight = 1
      vim.g.gruvbox_material_diagnostic_line_highlight = 1
      vim.g.gruvbox_material_transparent_background    = 2
      vim.g.gruvbox_material_foreground                = 'material'
      vim.g.gruvbox_material_ui_contrast               = 'high'
    end
  },
  {
    -- Statusline
    -- ステータスラインの表示をカスタマイズする
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require('lualine').setup({
        sections = {
          -- left
          lualine_a = {
            {
              'mode',
              icons_enabled = false,
              padding = { left = 0, right = 0 },
              fmt = function() return " " end
            }
          },
          lualine_b = {
            {
              'branch',
              icons_enabled = false,
              padding = {
                left = 1, right = 0 }
            },
            {
              'diff'
            },
            'diagnostics'
          },
          lualine_c = {
            {
              'filename',
              file_status = true, -- displays file status (readonly status, modified status)
              path = 2            -- 0 = just filename, 1 = relative path, 2 = absolute path
            },
          },

          -- right
          lualine_x = { { 'encoding' }, { 'fileformat', icons_enabled = false }, { 'filetype', icons_enabled = false } },
          lualine_y = { { 'progress' } },
          lualine_z = { { 'location' } }
        },
        options = {
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          theme = 'gruvbox-material',
          disabled_filetypes = {
            'alpha'
           }
        },
      })
    end,
  },
  {
    -- Modern QoL Plugin Collection
    -- Dashboard (起動画面) や Zen Mode などを提供するモダンなプラグイン集
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      dashboard = {
        enabled = true,
        sections = {
          { section = "header" },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "keys", gap = 0, padding = 1 },
          { section = "startup" },
        },
        preset = {
          header = [[
+-+-+-+-+-+-+-+-+
| h | j | k | l |
+-+-+-+-+-+-+-+-+]],
          keys = {
            { icon = " ", key = "e", desc = "New file", action = ":ene" },
            { icon = " ", key = "n", desc = "New zt note", action = ":ObsidianNew" },
            { icon = " ", key = "d", desc = "Daily note", action = ":ObsidianToday" },
            -- Dynamic paths for dashboard actions are tricky in static opts without a function wrapper,
            -- but snacks supports functions in keys.
            { icon = " ", key = "c", desc = "Go to Obsidian", action = function() vim.cmd("cd " .. vim.g.obsidian_vault) end },
            { icon = " ", key = "C", desc = "Configuration", action = ":cd ~/.config/nvim/" },
            { icon = " ", key = "u", desc = "Update plugins", action = ":Lazy sync" },
            { icon = "󰢃 ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
      zen = { enabled = true },
    },
    keys = {
      { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    }
  },
  -- LSP Progress
  -- LSPの起動状況や進捗などを右下に表示する
  {
    "j-hui/fidget.nvim",
    opts = {
      -- options
    },
  },
  {
    -- Command Line UI
    -- コマンドラインや通知メッセージをリッチなUIで表示する
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify",
    },
    config = function()
      -- require("notify").setup({
      --   background_colour = "#000",
      -- })
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          command_palette = false,      -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,           -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true,        -- add a border to hover docs and signature help
        },
      })
    end
  },
}

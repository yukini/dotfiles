return {
  {
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
    -- alpha
    -- startupのui plugin
    'goolord/alpha-nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      local hjkl_header = {
        [[+-+-+-+-+-+-+-+-+]],
        [[| h | j | k | l |]],
        [[+-+-+-+-+-+-+-+-+]],
      }
      local theta = require'alpha.themes.theta'
      local dashboard = require'alpha.themes.dashboard'
      local obsidian_vault_path = vim.g.obsidian_vault
      local buttons = {
        val = {
          { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
          { type = "padding", val = 1 },

          dashboard.button("e",     "  New file",       "<cmd>ene<CR>"),
          dashboard.button("SPC n", "  New zt note",    "<cmd>ObsidianNew<CR>"),
          dashboard.button("SPC d", "  Daily note",     "<cmd>ObsidianToday<CR>"),
          dashboard.button("SPC c", "  Go to Obsidian", "<cmd>cd " .. obsidian_vault_path ..  " <CR>"),
          dashboard.button("c",     "  Configuration",  "<cmd>cd ~/.config/nvim/ <CR>"),
          dashboard.button("u",     "  Update plugins", "<cmd>Lazy sync<CR>"),
          dashboard.button("q",     "󰢃   Quit",           "<cmd>qa<CR>"),
        },
      }

      theta.header.val  = hjkl_header
      theta.buttons.val = buttons.val
      require'alpha'.setup(theta.config)
    end
  },
  {
    -- lualine
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
    "folke/zen-mode.nvim",
    opts = {
      window = {
        options = {
          number = false, -- disable number column
        }
      },
    }
  },
}

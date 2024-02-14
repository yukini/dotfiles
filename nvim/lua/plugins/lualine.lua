return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require('lualine').setup({
        sections = {
          -- left
          lualine_a = { { 'mode', icons_enabled = false, padding = { left = 0, right = 0 }, fmt = function() return " " end } },
          lualine_b = { { 'branch', icons_enabled = false, padding = { left = 1, right = 0 } }, { 'diff' }, 'diagnostics' },
          lualine_c = { 'filename' },

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
}

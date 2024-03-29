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
}

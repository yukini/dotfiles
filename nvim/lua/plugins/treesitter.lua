return {
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
}

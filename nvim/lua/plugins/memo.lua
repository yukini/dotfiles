return {
  {
    'renerocksai/telekasten.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'renerocksai/calendar-vim',
    },
    config = function ()
      local home = vim.fn.expand('~/memo/zettelkasten')
      require('telekasten').setup({

        home = home,

        -- dir names for special notes (absolute path or subdir name)
        dailies             = home .. '/' .. 'daily',
        weeklies            = home .. '/' .. 'weekly',
        templates           = home .. '/' .. 'templates',
        template_new_note   = home .. '/' .. 'templates/new_note.md',
        template_new_daily  = home .. '/' .. 'templates/daily.md',
        template_new_weekly = home .. '/' .. 'templates/weekly.md',

        command_palette_theme = "dropdown",
        show_tags_theme       = "ivy",
      })

      -- Launch panel if nothing is typed after <leader>q
      vim.keymap.set("n", "<leader>q", "<cmd>Telekasten panel<CR>")
      vim.keymap.set("i", "[[", "<cmd>:lua require('telekasten').insert_link({ i=true })<CR>")

      vim.cmd("highlight tklink ctermfg=72 guifg=#689d6a cterm=bold,underline gui=bold,underline")
      vim.cmd("highlight tkBrackets ctermfg=gray guifg=gray")
      vim.cmd("highlight tkHighlight ctermbg=214 ctermfg=124 cterm=bold guibg=#fabd2f guifg=#9d0006 gui=bold")
      vim.cmd("highlight link CalNavi CalRuler")
      vim.cmd("highlight tkTagSep ctermfg=gray guifg=gray")
      vim.cmd("highlight tkTag ctermfg=175 guifg=#d3869B")
    end
  },
}

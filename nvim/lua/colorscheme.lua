vim.g.gruvbox_material_enable_bold               = 1
vim.g.gruvbox_material_enable_italic             = 1
vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_diagnostic_line_highlight = 1
vim.g.gruvbox_material_transparent_background    = 2
vim.g.gruvbox_material_foreground                = 'material'
vim.g.gruvbox_material_ui_contrast               = 'high'

vim.cmd('colorscheme gruvbox-material')

vim.cmd("highlight tklink ctermfg=72 guifg=#689d6a cterm=bold,underline gui=bold,underline")
vim.cmd("highlight tkBrackets ctermfg=gray guifg=gray")
vim.cmd("highlight tkHighlight ctermbg=214 ctermfg=124 cterm=bold guibg=#fabd2f guifg=#9d0006 gui=bold")
vim.cmd("highlight link CalNavi CalRuler")
vim.cmd("highlight tkTagSep ctermfg=gray guifg=gray")
vim.cmd("highlight tkTag ctermfg=175 guifg=#d3869B")


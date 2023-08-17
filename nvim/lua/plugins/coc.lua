return {
  'neoclide/coc.nvim', 
  branch = 'release',
  config = function()
    vim.g.coc_global_extensions = {
      'coc-actions',
      'coc-cspell-dicts',
      'coc-deno',
      'coc-diagnostic',
      'coc-dictionary',
      'coc-explorer',
      'coc-eslint',
      'coc-git',
      'coc-highlight',
      'coc-java',
      'coc-jedi',
      'coc-json',
      'coc-lists',
      'coc-markdownlint',
      'coc-pairs',
      'coc-prettier',
      'coc-rust-analyzer',
      'coc-snippets',
      'coc-spell-checker',
      'coc-tslint-plugin',
      'coc-tsserver',
      'coc-ultisnips',
      'coc-yaml',
    }

    -------------------------
    -- coc key maps
    -------------------------
    local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
    -- Make <CR> to accept selected completion item or notify coc.nvim to format
    -- <C-g>u breaks current undo, please make your own choice
    vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

    -- Use <c-j> to trigger snippets
    vim.keymap.set("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
    -- Use <c-space> to trigger completion
    vim.keymap.set("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

    -- Autocomplete
    function _G.check_back_space()
      local col = vim.fn.col('.') - 1
      return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
    end

    -- Use Tab for trigger completion with characters ahead and navigate
    -- NOTE: There's always a completion item selected by default, you may want to enable
    -- no select by setting `"suggest.noselect": true` in your configuration file
    -- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
    -- other plugins before putting this into your config
    local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
    vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
    vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

    -- GoTo code navigation
    vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
    vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
    vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
    vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})

    -- Use K to show documentation in preview window
    function _G.show_docs()
      local cw = vim.fn.expand('<cword>')
      if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
      elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
      else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
      end
    end

    vim.keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

    -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
    vim.api.nvim_create_augroup("CocGroup", {})
    vim.api.nvim_create_autocmd("CursorHold", {
      group = "CocGroup",
      command = "silent call CocActionAsync('highlight')",
      desc = "Highlight symbol under cursor on CursorHold"
    })
  end
}

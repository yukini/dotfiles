require('base')

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

require('highlights')
require('colorscheme')

if vim.fn.has('macunix') == 1 then
  require('os.macos')
end

local function setup_date_mappings()
  vim.keymap.set('n', '<leader>dl', ":pu=strftime('%Y/%m/%d')<CR>", {desc = 'Insert Date (yyyy/MM/dd)'})
  vim.keymap.set('n', '<leader>dt', ":pu=strftime('%Y/%m/%d %H:%M:%S')<CR>", {desc = 'Insert Date (yyyy/MM/dd hh:mm:ss)'})
end

-- マッピングを設定する関数を呼び出す
setup_date_mappings()


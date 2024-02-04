return {
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
    local buttons = {
      val = {
        { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
        { type = "padding", val = 1 },

        dashboard.button("e",     "  New file",       "<cmd>ene<CR>"),
        dashboard.button("SPC n", "  New zt note",    "<cmd>Telekasten new_note<CR>"),
        dashboard.button("SPC d", "  Daily note",     "<cmd>Telekasten goto_today<CR>"),
        dashboard.button("SPC w", "󰨴   Weekly note",    "<cmd>Telekasten goto_thisweek<CR>"),
        dashboard.button("c",     "  Configuration",  "<cmd>cd ~/.config/nvim/ <CR>"),
        dashboard.button("u",     "  Update plugins", "<cmd>Lazy sync<CR>"),
        dashboard.button("q",     "󰢃   Quit",           "<cmd>qa<CR>"),
      },
    }

    theta.header.val  = hjkl_header
    theta.buttons.val = buttons.val
    require'alpha'.setup(theta.config)
  end
};


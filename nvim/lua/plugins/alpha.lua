local hjkl_header = {
  [[+-+-+-+-+-+-+-+-+]],
  [[| h | j | k | l |]],
  [[+-+-+-+-+-+-+-+-+]],
}

local pika_header = {

    [[          ▀████▀▄▄              ▄█ ]],
    [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
    [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
    [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
    [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
    [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
    [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
    [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
    [[   █   █  █      ▄▄           ▄▀   ]],

}

return {
  'goolord/alpha-nvim',
  dependencies = { 
    'nvim-tree/nvim-web-devicons' 
  },
  config = function ()
    local theta = require'alpha.themes.theta'
    theta.header.val = hjkl_header
    require'alpha'.setup(theta.config)
  end
};


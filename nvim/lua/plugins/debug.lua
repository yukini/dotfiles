return {
  {
    -- Debug Adapter Protocol (DAP) Client
    -- デバッグ機能を提供するコアプラグイン
    "mfussenegger/nvim-dap",
    dependencies = {
      -- DAP UI
      -- デバッグ情報をリッチなUIで表示する
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require('dapui').setup()
      local function map(mode, lhs, rhs, opts)
        local options = { noremap = true }
        if opts then
          options = vim.tbl_extend("force", options, opts)
        end
        vim.api.nvim_set_keymap(mode, lhs, rhs, options)
      end

      -- Keymaps
      -- デバッグ操作のキーバインド
      map("n", "<leader>G", ":lua require'dap'.continue()<CR>", { silent = true })
      map("n", "<leader>6", ":lua require'dap'.continue()<CR>", { silent = true })
      map("n", "<leader>7", ":lua require'dap'.step_over()<CR>", { silent = true })
      map("n", "<leader>8", ":lua require'dap'.step_into()<CR>", { silent = true })
      map("n", "<leader>9", ":lua require'dap'.step_out()<CR>", { silent = true })
      map("n", "<leader>;", ":lua require'dap'.toggle_breakpoint()<CR>", { silent = true })
      map("n", "<leader>'", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
        { silent = true })
      map(
        "n",
        "<leader>i",
        ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
        { silent = true }
      )
      map("n", "<leader>D", ":lua require'dapui'.toggle()<CR>", { silent = true })
      map("n", "<leader><leader>D", ":lua require'dapui'.eval()<CR>", { silent = true })

      local dap = require('dap')
      dap.configurations.go = {
        {
          type = "go",
          name = "Debug",
          request = "launch",
          program = "${file}",
        },
        {
          type = "go",
          name = "Debug test",
          request = "launch",
          mode = "test",
          program = "${file}",
        },
        {
          type = "go",
          name = "Debug test (go.mod)",
          request = "launch",
          mode = "test",
          program = "./${relativeFileDirname}",
        }
      }
    end
  },
}

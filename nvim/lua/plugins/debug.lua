return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      -- require('dap').setup()
      require('dapui').setup()
      local function map(mode, lhs, rhs, opts)
        local options = { noremap = true }
        if opts then
          options = vim.tbl_extend("force", options, opts)
        end
        vim.api.nvim_set_keymap(mode, lhs, rhs, options)
      end

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
      map("n", "<leader>d", ":lua require'dapui'.toggle()<CR>", { silent = true })
      map("n", "<leader><leader>d", ":lua require'dapui'.eval()<CR>", { silent = true })
    end
  },
}

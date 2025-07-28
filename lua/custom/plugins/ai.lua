return {
  -- {
  --   'Exafunction/windsurf.nvim',
  --   event = 'BufReadPre',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --   },
  --   config = function()
  --     require('codeium').setup {
  --       enable_cmp_source = false,
  --       virtual_text = {
  --         enabled = true,
  --       },
  --     }
  --   end,
  -- },
  -- {
  'monkoose/neocodeium',
  event = 'VeryLazy',
  keys = {
    { '<leader>cai', '<cmd>NeoCodeium toggle_buffer<cr>', desc = '[c]ode [a]i' },
  },
  config = function()
    local neocodeium = require 'neocodeium'
    neocodeium.setup {
      show_label = false,
    }
    vim.keymap.set('i', '<A-f>', neocodeium.accept)
    vim.keymap.set('i', '<A-w>', neocodeium.accept_word)
    vim.keymap.set('i', '<A-a>', neocodeium.accept_line)
    vim.keymap.set('i', '<A-e>', function()
      require('neocodeium').cycle_or_complete()
    end)
    vim.keymap.set('i', '<A-r>', function()
      require('neocodeium').cycle_or_complete(-1)
    end)
  end,

  -- {
  --   'supermaven-inc/supermaven-nvim',
  --   config = function()
  --     require('supermaven-nvim').setup {}
  --   end,
  -- },
}

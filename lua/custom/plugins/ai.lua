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
  config = function()
    local neocodeium = require 'neocodeium'
    neocodeium.setup()
    vim.keymap.set('i', '<A-f>', neocodeium.accept)
  end,

  -- {
  --   'supermaven-inc/supermaven-nvim',
  --   config = function()
  --     require('supermaven-nvim').setup {}
  --   end,
  -- },
}

return {
  {
    'Exafunction/windsurf.nvim',
    event = 'BufReadPre',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('codeium').setup {
        enable_cmp_source = false,
        virtual_text = {
          enabled = true,
        },
      }
    end,
  },

  -- {
  --   'supermaven-inc/supermaven-nvim',
  --   config = function()
  --     require('supermaven-nvim').setup {}
  --   end,
  -- },
}

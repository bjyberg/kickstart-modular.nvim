return {
  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      require('nvim-tmux-navigation').setup {
        disable_when_zoomed = true, -- defaults to false
        keybindings = {
          left = '<C-h>',
          down = '<C-j>',
          up = '<C-k>',
          right = '<C-l>',
          last_active = '<C-\\>',
          next = '<C-Space>',
        },
      }
    end,
  },
  {
    'm4xshen/hardtime.nvim',
    lazy = false,
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = {},
  },
  -- 'tris203/precognition.nvim',
  -- lazy = false,
  -- -- event = 'VeryLazy',
  -- opts = {
  --   startVisible = true,
  --   showBlankVirtLine = true,
  --   highlightColor = { link = 'Comment' },
  --   hints = {
  --     Caret = { text = '^', prio = 2 },
  --     Dollar = { text = '$', prio = 1 },
  --     MatchingPair = { text = '%', prio = 5 },
  --     Zero = { text = '0', prio = 1 },
  --     w = { text = 'w', prio = 10 },
  --     b = { text = 'b', prio = 9 },
  --     e = { text = 'e', prio = 8 },
  --     W = { text = 'W', prio = 7 },
  --     B = { text = 'B', prio = 6 },
  --     E = { text = 'E', prio = 5 },
  --   },
  --   gutterHints = {
  --     G = { text = 'G', prio = 10 },
  --     gg = { text = 'gg', prio = 9 },
  --     PrevParagraph = { text = '{', prio = 8 },
  --     NextParagraph = { text = '}', prio = 8 },
  --   },
  --   disabled_fts = {
  --     'startify',
  --   },
  -- },
}

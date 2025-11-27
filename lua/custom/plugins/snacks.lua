return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = false },
      explorer = { enabled = true },
      gh = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = {
        enabled = true,
        -- layout = {
        --   layout = {
        --     backdrop = false,
        --   },
        -- },
      },
      lazygit = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = {
        enabled = true,
        left = { 'fold', 'sign' },
        right = { 'mark', 'git' },
      },
      toggle = { enabled = true },
      words = { enabled = true },
      zen = { enabled = true },
    },
    keys = {

      -- Picker
      {
        '<leader>pp',
        function()
          Snacks.picker()
        end,
        desc = '[p]ick',
      },

      -- Lazygit
      {
        '<leader>gl',
        function()
          Snacks.lazygit.open()
        end,
        desc = '[g]it [l]azy',
      },

      -- Explorer
      {
        '<leader>e',
        function()
          Snacks.explorer()
        end,
        desc = '[q]ick [f]ile',
      },

      -- Zen
      {
        '<leader>z',
        function()
          Snacks.zen()
        end,
        desc = '[z]en',
      },

      -- GitHub CLI
      {
        '<leader>ghi',
        function()
          Snacks.picker.gh_issue()
        end,
        desc = '[G]it[H]ub Issues (open)',
      },
      {
        '<leader>ghI',
        function()
          Snacks.picker.gh_issue { state = 'all' }
        end,
        desc = '[G]it[H]ub Issues (all)',
      },
      {
        '<leader>ghp',
        function()
          Snacks.picker.gh_pr()
        end,
        desc = '[G]it[H]ub Pull Requests (open)',
      },
      {
        '<leader>ghP',
        function()
          Snacks.picker.gh_pr { state = 'all' }
        end,
        desc = '[G]it[H]ub Pull Requests (all)',
      },
    },
  },
}

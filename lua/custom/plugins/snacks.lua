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
      {
        '<leader>ph',
        function()
          Snacks.picker.help()
        end,
        desc = '[p]ick [h]elp',
      },
      {
        '<leader>pk',
        function()
          Snacks.picker.keymaps()
        end,
        desc = '[p]ick [k]eymaps',
      },
      {
        '<leader>pf',
        function()
          Snacks.picker.files()
        end,
        desc = '[p]ick [f]iles',
      },
      {
        '<leader>ps',
        function()
          Snacks.picker.smart()
        end,
        desc = '[p]ick [s]mart',
      },
      {
        '<leader>pw',
        function()
          Snacks.picker.grep_word()
        end,
        desc = '[p]ick current [w]ord',
      },
      {
        '<leader>pg',
        function()
          Snacks.picker.grep()
        end,
        desc = '[p]ick by [g]rep',
      },
      {
        '<leader>pd',
        function()
          Snacks.picker.diagnostics()
        end,
        desc = '[p]ick [d]iagnostics',
      },
      {
        '<leader>pr',
        function()
          Snacks.picker.resume()
        end,
        desc = '[p]ick [r]esume',
      },
      {
        '<leader>p.',
        function()
          Snacks.picker.recent()
        end,
        desc = '[p]ick recent files ("." for repeat)',
      },
      {
        '<leader>pb',
        function()
          Snacks.picker.buffers()
        end,
        desc = '[p]ick [b]uffers',
      },
      {
        '<leader>pc',
        function()
          Snacks.picker.colorschemes()
        end,
        desc = '[p]ick [c]olorscheme',
      },
      {
        '<leader>pz',
        function()
          Snacks.picker.lines()
        end,
        desc = '[p]ick fu[z]zy find in current buffer',
      },
      {
        '<leader>pm',
        function()
          Snacks.picker.marks()
        end,
        desc = '[p]ick [m]arks',
      },
      {
        '<leader>pn',
        function()
          Snacks.picker.notifications()
        end,
        desc = '[p]ick [n]otifications',
      },
      {
        '<leader>pGb',
        function()
          Snacks.picker.git_branches()
        end,
        desc = '[p]ick [G]it [b]ranches',
      },
      {
        '<leader>pGc',
        function()
          Snacks.picker.git_log()
        end,
        desc = '[p]ick [G]it [c]ommits',
      },
      {
        '<leader>pGs',
        function()
          Snacks.picker.git_status()
        end,
        desc = '[p]ick [G]it [s]tatus',
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

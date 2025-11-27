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
    opts = {
      disabled_keys = {
        ['<Up>'] = false,
        ['<Down>'] = false,
        ['<Left>'] = false,
        ['<Right>'] = false,
      },
      disable_mouse = false,
    },
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
  {
    'monaqa/dial.nvim',
    -- https://www.lazyvim.org/extras/editor/dial
    config = function()
      local augend = require 'dial.augend'
      require('dial.config').augends:register_group {
        default = {
          augend.constant.alias.bool,
          augend.constant.new {
            elements = { '&&', '||' },
            word = false,
            cyclic = true,
          },
          augend.constant.new {
            elements = { '==', '!=' },
            word = false,
            cyclic = true,
          },
          augend.constant.new {
            elements = { 'TRUE', 'FALSE' },
            preserve_case = true,
          },
          augend.constant.new {
            elements = { '[ ]', '[x]', '[-]', '[o]' },
            word = false,
            cyclic = true,
          },
          augend.case.new {
            types = { 'camelCase', 'PascalCase', 'snake_case', 'SCREAMING_SNAKE_CASE' },
            cyclic = true,
          },

          augend.integer.alias.decimal_int,
          augend.date.alias['%d.%m.%Y'],
        },
      }
      vim.keymap.set('n', '<C-a>', require('dial.map').inc_normal(), { noremap = true })
      vim.keymap.set('n', '<C-x>', require('dial.map').dec_normal(), { noremap = true })
    end,
  },
  {
    'folke/trouble.nvim',
    opts = {},
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xd',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = '[d]iagnostics',
      },
      {
        '<leader>xD',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer [D]iagnostics',
      },
      {
        '<leader>xs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = '[s]ymbols',
      },
      {
        '<leader>xl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = '[l]sp definitions/references',
      },
      -- {
      --   '<leader>xL',
      --   '<cmd>Trouble loclist toggle<cr>',
      --   desc = 'Location List (Trouble)',
      -- },
      -- {
      --   '<leader>xq',
      --   '<cmd>Trouble qflist toggle<cr>',
      --   desc = '[q]uickfix List (Trouble)',
      -- },
      {
        '<leader>xt',
        '<cmd>Trouble todo toggle<cr>',
        desc = '[t]odo List (Trouble)',
      },
    },
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {
      modes = {
        search = {
          enabled = true,
        },
      },
    },
    keys = {
      {
        's',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash',
      },
      {
        'S',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Flash Treesitter',
      },
      {
        'r',
        mode = 'o',
        function()
          require('flash').remote()
        end,
        desc = 'Remote Flash',
      },
      {
        'R',
        mode = { 'o', 'x' },
        function()
          require('flash').treesitter_search()
        end,
        desc = 'Treesitter Search',
      },
      {
        '<c-s>',
        mode = { 'c' },
        function()
          require('flash').toggle()
        end,
        desc = 'Toggle Flash Search',
      },
    },
  },
}

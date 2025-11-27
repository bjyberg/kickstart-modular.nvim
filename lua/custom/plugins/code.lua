return {
  {
    'jpalardy/vim-slime',
    -- lazy = false,
    ft = { 'r', 'python', 'quarto', 'md', 'julia', 'rust' },
    -- keys = {
    --   { '<C-CR>', '<Plug>SlimeParagraphSend', desc = 'Slime Send Paragraph', mode = { 'n', 'i' } },
    --   { '<C-CR>', '<Plug>SlimeRegionSend', desc = 'Slime Send Selection', mode = 'x' },
    -- },
    config = function()
      vim.g.slime_target = 'tmux'
      vim.g.slime_default_config = { socket_name = 'default', target_pane = '{last}' }
      vim.g.slime_cell_delimiter = '# %%'
      vim.g.slime_bracketed_paste = 1
    end,
  },
  {
    'catgoose/nvim-colorizer.lua',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {},
    -- event = 'VeryLazy',
    -- opts = {
    --   lazy_load = true,
    -- },
  },
  {
    'danymat/neogen',
    config = true,
  },
  -- {
  --   'ray-x/lsp_signature.nvim',
  --   event = 'InsertEnter',
  --   opts = {
  --     floating_window = false,
  --     hint_prefix = '',
  --     bind = true,
  --   },
  -- },
  -- {
  --     'R-nvim/R.nvim',
  --     -- dependencies = {
  --     --   -- 'hrsh7th/nvim-cmp',
  --     --   'R-nvim/cmp-r',
  --     -- }, -- Only required if you also set defaults.lazy = true
  --     lazy = false,
  --     config = function()
  --       vim.g.R_assign = 0 -- disable `_ <- _` mapping
  --       vim.g.R_space_maps = 0 -- disable default <Space> mappings
  --       vim.g.R_external_term = 'tmux split-window -vf'
  --
  --       -- Helper function to map keys
  --       local function map(mode, lhs, rhs, desc)
  --         vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
  --       end
  --
  --       -- Normal mode mappings
  --       map('n', '<leader>rs', '<Plug>RStart', 'Start R')
  --       map('n', '<leader>rr', '<Plug>RSendLine', 'Send current line')
  --       map('n', '<leader>rb', '<Plug>RSendBlock', 'Send block')
  --       map('n', '<leader>rf', '<Plug>RSendFile', 'Send file')
  --       map('n', '<leader>rq', '<Plug>RQuit', 'Quit R')
  --
  --       -- Visual mode mapping for selection
  --       map('v', '<leader>rv', '<Plug>RSendSelection', 'Send visual selection')
  --     end,
  --   },
  {
    'R-nvim/R.nvim',
    opts = {
      R_args = { '--quiet', '--no-save' },
      auto_quit = true,
      user_maps_only = true,
      external_term = 'tmux split-window -h -l 20',
      hook = {
        on_filetype = function()
          local opts = { buffer = true }

          -- General and Startup
          vim.keymap.set('n', '<LocalLeader>rr', '<Plug>RStart', { buffer = true, desc = 'Start [r]' })
          vim.keymap.set('n', '<LocalLeader>rc', '<Plug>RCustomStart', { buffer = true, desc = '[c]ustom r start' })
          vim.keymap.set('n', '<LocalLeader>rip', '<Plug>RPackages', { buffer = true, desc = '[i]nstall missing [p]ackages' })

          -- Insert
          vim.keymap.set('i', '<M-,>', '<Plug>RInsertAssign', { buffer = true, desc = 'Insert <-' })
          vim.keymap.set('i', '<M-.>', '<Plug>RInsertPipe', { buffer = true, desc = 'Insert Pipe' })

          -- Send
          vim.keymap.set('n', '<c-Enter>', '<Plug>RDSendLine', opts)
          vim.keymap.set('x', '<C-Enter>', '<Plug>RSendSelection', opts)
          vim.keymap.set('i', '<C-Enter>', '<Esc><Plug>RSendLine', opts)

          -- Other Useful Commands
          vim.keymap.set('n', '<LocalLeader>rwd', '<Plug>RSetwd', { buffer = true, desc = 'Set [w]orking [d]irectory' })
          vim.keymap.set('n', '<LocalLeader>rdd', '<Plug>RDebug', { buffer = true, desc = '[d]ebug' })
          vim.keymap.set('n', '<LocalLeader>rdu', '<Plug>RUndebug', { buffer = true, desc = '[u]ndebug' })
          vim.keymap.set('n', '<LocalLeader>rs', '<Plug>RSummary', { buffer = true, desc = '[s]ummary()' })
          vim.keymap.set('n', '<LocalLeader>rP', '<Plug>RPlot', { buffer = true, desc = '[p]lot()' })
          vim.keymap.set('n', '<LocalLeader>rp', '<Plug>RObjectPr', { buffer = true, desc = '[p]rint object' })
          vim.keymap.set('n', '<LocalLeader>rl', '<Plug>RClearConsole', { buffer = true, desc = 'clear console' })
          vim.keymap.set('n', '<LocalLeader>ro', '<Plug>ROBToggle', { buffer = true, desc = '[o]bject browser' })
          vim.keymap.set({ 'n', 'v' }, '<LocalLeader>rh', '<Plug>RHelp', { buffer = true, desc = '[h]elp for object' })
          vim.keymap.set('n', '<LocalLeader>rx', '<Cmd>ROxygenize<CR>', { buffer = true, desc = 'ro[x]ygenize' })

          local wk = require 'which-key'
          wk.add {
            buffer = true,
            mode = { 'n', 'x' },
            { '<localleader>r', group = '[r] tools' },
          }
        end,
      },
    },
    config = function(_, opts)
      vim.g.rout_follow_colorscheme = true
      require('r').setup(opts)
    end,
  },
}

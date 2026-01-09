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
  },
  {
    'danymat/neogen',
    config = true,
  },
  {
    'R-nvim/R.nvim',
    opts = {
      R_args = { '--quiet', '--no-save' },
      auto_quit = true,
      user_maps_only = true,
      external_term = 'tmux split-window -h -l 20',
      hook = {
        on_filetype = function()
          -- General and Startup
          vim.keymap.set('n', '<LocalLeader>rr', '<Plug>RStart', { buffer = true, desc = 'Start [r]' })
          vim.keymap.set('n', '<LocalLeader>rc', '<Plug>RCustomStart', { buffer = true, desc = '[c]ustom r start' })
          vim.keymap.set('n', '<LocalLeader>rip', '<Plug>RPackages', { buffer = true, desc = '[i]nstall missing [p]ackages' })

          -- Insert
          vim.keymap.set('i', '<M-,>', '<Plug>RInsertAssign', { buffer = true, desc = 'Insert <-' })
          vim.keymap.set('i', '<M-.>', '<Plug>RInsertPipe', { buffer = true, desc = 'Insert Pipe' })

          -- Send
          vim.keymap.set('n', '<M-Enter>', '<Plug>RDSendLine', { buffer = true })
          vim.keymap.set('v', '<M-Enter>', '<Plug>RSendSelection', { buffer = true })
          vim.keymap.set('i', '<M-CR>', '<C-o><Plug>RDSendLine', { buffer = true })

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
  {
    'jake-stewart/multicursor.nvim',
    branch = '1.0',
    config = function()
      local mc = require 'multicursor-nvim'
      mc.setup()

      local set = vim.keymap.set

      -- Add or skip cursor above/below the main cursor.
      set({ 'n', 'x' }, '<C-Up>', function()
        mc.lineAddCursor(-1)
      end)
      set({ 'n', 'x' }, '<C-Down>', function()
        mc.lineAddCursor(1)
      end)
      set({ 'n', 'x' }, '<S-Up>', function()
        mc.lineSkipCursor(-1)
      end)
      set({ 'n', 'x' }, '<S-Down>', function()
        mc.lineSkipCursor(1)
      end)

      -- Add and remove cursors with control + left click.
      set('n', '<c-leftmouse>', mc.handleMouse)
      set('n', '<c-leftdrag>', mc.handleMouseDrag)
      set('n', '<c-leftrelease>', mc.handleMouseRelease)

      -- Disable and enable cursors.
      set({ 'n', 'x' }, '<c-q>', mc.toggleCursor)

      -- Mappings defined in a keymap layer only apply when there are
      -- multiple cursors. This lets you have overlapping mappings.
      mc.addKeymapLayer(function(layerSet)
        -- Select a different cursor as the main one.
        layerSet({ 'n', 'x' }, '<left>', mc.prevCursor)
        layerSet({ 'n', 'x' }, '<right>', mc.nextCursor)

        -- Delete the main cursor.
        layerSet({ 'n', 'x' }, '<leader>x', mc.deleteCursor)

        -- Enable and clear cursors using escape.
        layerSet('n', '<esc>', function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end)
      end)
    end,
  },
}

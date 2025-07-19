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
}

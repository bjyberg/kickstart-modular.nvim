return {
  -- {
  --   'kdheepak/lazygit.nvim',
  --   lazy = true,
  --   cmd = {
  --     'LazyGit',
  --     'LazyGitConfig',
  --     'LazyGitCurrentFile',
  --     'LazyGitFilter',
  --     'LazyGitFilterCurrentFile',
  --   },
  --   -- optional for floating window border decoration
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --   },
  --   -- setting the keybinding for LazyGit with 'keys' is recommended in
  --   -- order to load the plugin when the command is run for the first time
  --   keys = {
  --     { '<leader>gl', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
  --   },
  -- },
  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      -- OR 'ibhagwan/fzf-lua',
      -- OR 'folke/snacks.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      { '<leader>goo', '<cmd>Octo actions<CR>', desc = '[g]it [o]cto [o]pen' },
      { '<leader>goi', '<cmd>Octo issue list<CR>', desc = '[g]it [o]cto [i]ssues' },
      { '<leader>gor', '<cmd>Octo repo list<CR>', desc = '[g]it [o]cto [r]epos' },
      { '<leader>gop', '<cmd>Octo pr list<CR>', desc = '[g]it [o]cto [p]ull requests' },
      { '<leader>goc', '<cmd>Octo discussion list<CR>', desc = '[g]it [o]cto [d]iscussions' },
      { '<leader>goI', '<cmd>Octo issue create<CR>', desc = '[g]it [o]cto open [I]ssue' },
      { '<leader>goP', '<cmd>Octo pr create<CR>', desc = '[g]it [o]cto open [P]ull request' },
    },
    config = function()
      require('octo').setup()
    end,
  },
}

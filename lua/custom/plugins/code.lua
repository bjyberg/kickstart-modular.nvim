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
}

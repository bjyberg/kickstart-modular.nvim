return {
  {
    'hedyhli/outline.nvim',
    cmd = 'Outline',
    keys = {
      { '<leader>o', ':Outline<cr>', desc = 'toggle [o]utline' },
    },
    opts = {
      providers = {
        priority = { 'markdown', 'lsp', 'norg' },
        lsp = {
          -- Lsp client names to ignore
          blacklist_clients = {},
        },
        markdown = {
          filetypes = { 'markdown', 'quarto' },
        },
      },
    },
  },
  { -- highlight occurences of current word
    'RRethy/vim-illuminate',
    enabled = true,
  },
  -- {
  --   'folke/zen-mode.nvim',
  --   --HACK: https://github.com/folke/zen-mode.nvim/issues/184
  --   -- This can be simplified when resolved (window border issue)
  --   opts = {
  --     window = {
  --       backdrop = 1,
  --       width = 120,
  --       options = {
  --         number = true,
  --         relativenumber = true,
  --       },
  --     },
  --     on_close = function()
  --       vim.o.winborder = 'rounded'
  --     end,
  --     plugins = {
  --       kitty = {
  --         enabled = true,
  --         font = '+3',
  --       },
  --       todo = { enabled = true },
  --     },
  --   },
  --   keys = {
  --     {
  --       '<leader>Z',
  --       function()
  --         vim.o.winborder = 'none'
  --         require('zen-mode').toggle()
  --       end,
  --       desc = '[Z]en mode',
  --       noremap = true,
  --       silent = true,
  --     },
  --   },
  -- },
  {
    'hat0uma/csvview.nvim',
    config = function()
      require('csvview').setup {
        display_mode = 'border',
      }
    end,
  },
  {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        '<leader>-',
        '<cmd>Yazi<yr>',
        desc = 'Open yazi at the current file',
      },
      {
        -- Open in the current working directory
        '<leader>yw',
        '<cmd>Yazi cwd<cr>',
        desc = "Open the file manager in nvim's working directory",
      },
      {
        '<c-up>',
        '<cmd>Yazi toggle<cr>',
        desc = 'Resume the last yazi session',
      },
    },
    ---@type YaziConfig
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = '<f1>',
      },
    },
  },
}

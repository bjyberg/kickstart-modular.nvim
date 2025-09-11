return {

  { -- highlight occurences of current word
    'RRethy/vim-illuminate',
    enabled = true,
  },
  -- { 'lukas-reineke/virt-column.nvim', opts = {} },
  { -- filetree
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    enabled = true,
    keys = {
      { '<leader>e', ':NvimTreeToggle<cr>', desc = 'toggle nvim-tree' },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup {
        disable_netrw = true,
        update_focused_file = {
          enable = true,
        },
        git = {
          enable = true,
          ignore = false,
          timeout = 500,
        },
        diagnostics = {
          enable = true,
        },
      }
    end,
  },
  {
    'folke/zen-mode.nvim',
    --HACK: https://github.com/folke/zen-mode.nvim/issues/184
    -- This can be simplified when resolved (window border issue)
    opts = {
      window = {
        backdrop = 1,
        width = 120,
        options = {
          number = true,
          relativenumber = true,
        },
      },
      on_close = function()
        vim.o.winborder = 'rounded'
      end,
      plugins = {
        kitty = {
          enabled = true,
          font = '+3',
        },
        todo = { enabled = true },
      },
    },
    keys = {
      {
        '<leader>z',
        function()
          vim.o.winborder = 'none'
          require('zen-mode').toggle()
        end,
        desc = '[Z]en mode',
        noremap = true,
        silent = true,
      },
    },
  },
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

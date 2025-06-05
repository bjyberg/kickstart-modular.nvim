return {

  { -- highlight occurences of current word
    'RRethy/vim-illuminate',
    enabled = true,
  },
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

  { -- show tree of symbols in the current file
    'hedyhli/outline.nvim',
    cmd = 'Outline',
    keys = {
      { '<leader>lo', ':Outline<cr>', desc = 'symbols outline' },
    },
    opts = {
      providers = {
        priority = { 'markdown', 'lsp', 'norg' },
        -- Configuration for each provider (3rd party providers are supported)
        lsp = {
          -- Lsp client names to ignore
          blacklist_clients = {},
        },
        markdown = {
          -- List of supported ft's to use the markdown provider
          filetypes = { 'markdown', 'quarto' },
        },
      },
    },
  },

  { -- or show symbols in the current file as breadcrumbs
    'Bekaboo/dropbar.nvim',
    enabled = function()
      return vim.fn.has 'nvim-0.10' == 1
    end,
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
    },
    config = function()
      -- turn off global option for windowline
      vim.opt.winbar = nil
      vim.keymap.set('n', '<leader>ls', require('dropbar.api').pick, { desc = '[s]ymbols' })
    end,
  },

  -- { -- highlight markdown headings and code blocks etc.
  --   'lukas-reineke/headlines.nvim',
  --   enabled = true,
  --   dependencies = 'nvim-treesitter/nvim-treesitter',
  --   config = function()
  --     require('headlines').setup {
  --       quarto = {
  --         query = vim.treesitter.query.parse(
  --           'markdown',
  --           [[
  --               (fenced_code_block) @codeblock
  --               ]]
  --         ),
  --         codeblock_highlight = 'CodeBlock',
  --         treesitter_language = 'markdown',
  --       },
  --       markdown = {
  --         query = vim.treesitter.query.parse(
  --           'markdown',
  --           [[
  --               (fenced_code_block) @codeblock
  --               ]]
  --         ),
  --         codeblock_highlight = 'CodeBlock',
  --       },
  --     }
  --   end,
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

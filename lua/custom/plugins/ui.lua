return {

  { -- highlight occurences of current word
    'RRethy/vim-illuminate',
    enabled = false,
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

  { -- highlight markdown headings and code blocks etc.
    'lukas-reineke/headlines.nvim',
    enabled = false,
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('headlines').setup {
        quarto = {
          query = vim.treesitter.query.parse(
            'markdown',
            [[
                (fenced_code_block) @codeblock
                ]]
          ),
          codeblock_highlight = 'CodeBlock',
          treesitter_language = 'markdown',
        },
        markdown = {
          query = vim.treesitter.query.parse(
            'markdown',
            [[
                (fenced_code_block) @codeblock
                ]]
          ),
          codeblock_highlight = 'CodeBlock',
        },
      }
    end,
  },
  {
    'hat0uma/csvview.nvim',
    config = function()
      require('csvview').setup {
        display_mode = 'border',
      }
    end,
  },
  -- {
  --   "uga-rosa/ccc.nvim",
  --   lazy = false,
  --   config = function ()
  --     require("ccc").setup()
  --   end
  -- },
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
        -- NOTE: this requires a version of yazi that includes
        -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
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
  -- {
  --   "tris203/precognition.nvim",
  --   --event = "VeryLazy",
  --   opts = {
  --   -- startVisible = true,
  --   -- showBlankVirtLine = true,
  --   -- highlightColor = { link = "Comment" },
  --   -- hints = {
  --   --      Caret = { text = "^", prio = 2 },
  --   --      Dollar = { text = "$", prio = 1 },
  --   --      MatchingPair = { text = "%", prio = 5 },
  --   --      Zero = { text = "0", prio = 1 },
  --   --      w = { text = "w", prio = 10 },
  --   --      b = { text = "b", prio = 9 },
  --   --      e = { text = "e", prio = 8 },
  --   --      W = { text = "W", prio = 7 },
  --   --      B = { text = "B", prio = 6 },
  --   --      E = { text = "E", prio = 5 },
  --   -- },
  --   -- gutterHints = {
  --   --     G = { text = "G", prio = 10 },
  --   --     gg = { text = "gg", prio = 9 },
  --   --     PrevParagraph = { text = "{", prio = 8 },
  --   --     NextParagraph = { text = "}", prio = 8 },
  --   -- },
  --   -- disabled_fts = {
  --   --     "startify",
  --   -- },
  --   },
  -- }
}

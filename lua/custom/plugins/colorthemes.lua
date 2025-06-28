return {
  -- NOTE: Not really a theme, but changes the colour with darkman
  { 'vimpostor/vim-lumen', lazy = false },
  --NOTE: THEMES
  -- {
  --   'ferdinandrau/lavish.nvim',
  --   config = function()
  --       require('lavish').apply()
  --   end
  -- },
  {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require('everforest').setup {
        background = 'soft',
        sign_column_background = 'none',
        italics = true,
        disable_italic_comments = false,
        transparent_background_level = 2,
        -- on_highlights = function(hl, palette)
        --   hl.ColorColumn = { bg = palette.grey1 }
        -- end,
      }
      require('everforest').load()
      -- vim.cmd [[colorscheme everforest]]
    end,
  },
  {
    'EdenEast/nightfox.nvim',
    config = function()
      require('nightfox').setup {
        options = {
          transparent = true,
        },
      }
    end,
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    config = function()
      require('nordic').setup {
        -- Enable bold keywords.
        bold_keywords = true,
        -- Enable italic comments.
        italic_comments = true,
        -- Enable general editor background transparency.
        transparent = true,
      }
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },
      }
    end,
  },
}

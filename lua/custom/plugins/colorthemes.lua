return {
  -- NOTE: Not really a theme, but changes the colour with darkman
  { 'vimpostor/vim-lumen', lazy = false }, -- Obselete now
  {
    'folke/twilight.nvim',
    opts = {
      dimming = {
        color = { 'Normal', '#ffffff' },
        -- term_bg = '#7f7f7f',
        term_bg = '#b3b3b3',
        alpha = 0.6,
      },
      context = 10,
    },
    config = function(_, opts)
      require('twilight').setup(opts)
      --HACK: Set the color dynamic with light/darkmode based on a hl group

      -- 2️⃣ Function to pick your preferred highlight
      local function update_twilight_color()
        local ln = vim.api.nvim_get_hl(0, { name = 'LineNr' }).fg
        if ln then
          vim.api.nvim_set_hl(0, 'Twilight', { fg = string.format('#%06x', ln) })
        end
      end

      vim.api.nvim_create_autocmd('OptionSet', {
        pattern = 'background',
        callback = function()
          update_twilight_color()
        end,
      })
    end,
  },
  {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    -- priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require('everforest').setup {
        background = 'soft',
        sign_column_background = 'none',
        italics = true,
        disable_italic_comments = false,
        transparent_background_level = 2,
      }
      require('everforest').load()
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

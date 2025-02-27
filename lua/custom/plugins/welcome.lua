return {
  -- dashboard to greet
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      --       dashboard.section.header.val = {
      --
      -- "       ,.,      ",
      -- "      MMMM_    ,..,     ",
      -- "        \"_ \"__\"MMMMM          ,...,,",
      -- " ,..., __.\" --\"    ,.,     _-\"MMMMMMM",
      -- "MMMMMM\"___ \"_._   MMM\"_.\"\" _ \"\"\"\"\"",
      -- " \"\"\"\"\"    \"\" , \\_.   \"_. .\"",
      -- "        ,., _\"__ \\__./ .\"",
      -- "       MMMMM_\"  \"_    ./",
      -- "        ''''      (    )",
      -- " ._______________.-'____\"---._.",
      -- "  \\                          /",
      -- "   \\________________________/",
      -- "   (_)                    (_) ",
      --       }

      dashboard.section.buttons.val = {
        dashboard.button('e', '  > New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('f', '󰈞  > Find file', ':Telescope find_files<CR>'),
        dashboard.button('r', '  > Recent', ':Telescope oldfiles<CR>'),
        dashboard.button('y', '  > Yazi', ':Yazi cwd<cr>'),
        dashboard.button('s', '  > Settings', ':e $MYVIMRC | :cd %:p:h<cr>'),
        dashboard.button('q', '󰅚  > Quit NVIM', ':qa<CR>'),
      }
      -- Send config to alpha
      alpha.setup(dashboard.opts)
    end,
  },
}

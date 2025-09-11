return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'r' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
  -- {
  --   'nvim-treesitter/nvim-treesitter-context',
  --   opts = { enable = true },
  -- },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    lazy = true,
    config = function()
      require('nvim-treesitter.configs').setup {
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@comment.outer',
              ['ic'] = '@comment.outer',
              ['aC'] = '@class.outer',
              ['iC'] = '@class.outer',
              ['aa'] = '@parameter.outer', -- a for ARG
              ['ia'] = '@parameter.inner',
              ['ai'] = '@conditional.outer',
              ['ii'] = '@conditional.inner',
              ['as'] = '@statement.outer',
              ['is'] = '@statement.inner',
              ['av'] = '@assignment.outer', -- v for var assign
              ['iv'] = '@assignment.inner',
              ['ab'] = '@block.outer',
              ['ib'] = '@block.inner',
              ['aF'] = '@call.outer',
              ['iF'] = '@call.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              [']f'] = '@function.outer',
              [']/'] = '@comment.outer',
              [']p'] = '@parameter.inner',
              [']v'] = '@assignment.outer',
            },
            goto_next_end = {
              [']F'] = '@function.outer',
              [']P'] = '@parameter.inner',
              [']V'] = '@assignment.outer',
            },
            goto_previous_start = {
              ['[f'] = '@function.outer',
              ['[/'] = '@comment.outer',
              ['[p'] = '@parameter.inner',
              ['[v'] = '@assignment.outer',
            },
            goto_previous_end = {
              ['[F'] = '@function.outer',
              ['[P'] = '@parameter.inner',
              ['[V'] = '@assignment.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>ca'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>cA'] = '@parameter.inner',
            },
          },
        },
      }

      local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'

      -- Repeat movement with ; and ,
      -- ensure ; goes forward and , goes backward regardless of the last direction
      vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
      vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)

      -- vim way: ; goes to the direction you were moving.
      -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
      -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

      -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
      vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et

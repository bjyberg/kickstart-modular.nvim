return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          -- local ft = vim.bo.filetype
          -- if ft == 'r' then
          --   require('conform').format { formatters = { 'air' }, async = true }
          -- else
          require('conform').format { async = true, lsp_format = 'fallback' }
          -- end
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
      {
        '<leader>cf',
        -- R styler is slow but Air doesn't support ' to " and = to <- yet
        -- Keep as a manual formatter for now
        function()
          local ft = vim.bo.filetype
          if ft == 'r' then
            require('conform').format { formatters = { 'air', 'styler' }, async = true }
          else
            require('conform').format { async = true, lsp_format = 'fallback' }
          end
        end,
        mode = '',
        desc = '[C]ode [F]ormat',
      },
    },
    opts = {
      log_level = vim.log.levels.DEBUG,
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 1500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        ojs = { 'biome' },
        r = { 'air', 'jarl' },
        -- r = { 'air', 'styler' },
        javascript = { 'biome' },
        quarto = { 'injected', 'deno_qmd' },
        markdown = { 'injected', 'deno_fmt' },
        python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
        typescript = { 'biome' },
        toml = { 'tombi' },
        astro = { 'deno_fmt', 'biome' },
        sql = { 'sqruff' },
        -- julia = { 'runic' }, -- see: https://github.com/fredrikekre/Runic.jl?tab=readme-ov-file#editor-integration
        -- typst = { 'tinymist', 'typstyle' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
      formatters = {
        deno_qmd = {
          command = 'deno',
          args = { 'fmt', '--ext', 'md', '-' },
          stdin = true,
        },
        jarl = {
          command = 'jarl',
          args = { 'check', '--fix', '--allow-no-vcs', '$FILENAME' },
          stdin = false,
        },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et

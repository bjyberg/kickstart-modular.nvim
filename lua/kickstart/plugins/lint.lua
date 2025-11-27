return {

  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'

      -- Getting this through LSP instead.
      -- lint.linters.jarl = {
      --   cmd = 'jarl',
      --   args = { 'check' },
      --   stdin = false,
      --   ignore_exitcode = true,
      --
      --   parser = function(output, bufnr)
      --     local diagnostics = {}
      --
      --     for severity, code, file, line, col, snippet, help in
      --       output:gmatch '(%w+):%s*(%S+)%s*\n%s*%-%->%s*([^:]+):(%d+):(%d+)[^\n]*\n[^\n]*`(.-)`[^\n]*\n%s*=%s*help:%s*(.-)\n'
      --     do
      --       table.insert(diagnostics, {
      --         bufnr = bufnr,
      --         lnum = tonumber(line) - 1,
      --         col = tonumber(col) - 1,
      --         message = snippet .. ' — ' .. help,
      --         severity = severity == 'error' and vim.diagnostic.severity.ERROR or vim.diagnostic.severity.WARN,
      --         source = 'jarl',
      --         code = code,
      --       })
      --     end
      --     return diagnostics
      --   end,
      -- }

      lint.linters_by_ft = {
        markdown = { 'markdownlint' }, -- Vale a cool addition for writing
        -- see https://github.com/mfussenegger/nvim-lint/issues/528
        -- run ~/.local/share/nvim/mason/packages/vale/vale --config=$HOME/.config/vale/.vale.ini sync
        quarto = { 'markdownlint' },

        -- r = { 'jarl' },
      }

      -- To allow other plugins to add linters to require('lint').linters_by_ft,
      -- instead set linters_by_ft like this:
      -- lint.linters_by_ft = lint.linters_by_ft or {}
      -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
      --
      -- However, note that this will enable a set of default linters,
      -- which will cause errors unless these tools are available:
      -- {
      --   clojure = { "clj-kondo" },
      --   dockerfile = { "hadolint" },
      --   inko = { "inko" },
      --   janet = { "janet" },
      --   json = { "jsonlint" },
      --   markdown = { "vale" },
      --   rst = { "vale" },
      --   ruby = { "ruby" },
      --   terraform = { "tflint" },
      --   text = { "vale" }
      -- }
      --
      -- You can disable the default linters by setting their filetypes to nil:
      -- lint.linters_by_ft['clojure'] = nil
      -- lint.linters_by_ft['dockerfile'] = nil
      -- lint.linters_by_ft['inko'] = nil
      -- lint.linters_by_ft['janet'] = nil
      -- lint.linters_by_ft['json'] = nil
      -- lint.linters_by_ft['markdown'] = nil
      -- lint.linters_by_ft['rst'] = nil
      -- lint.linters_by_ft['ruby'] = nil
      -- lint.linters_by_ft['terraform'] = nil
      -- lint.linters_by_ft['text'] = nil

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          -- Only run the linter in buffers that you can modify in order to
          -- avoid superfluous noise, notably within the handy LSP pop-ups that
          -- describe the hovered symbol using Markdown.
          if vim.bo.modifiable then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}

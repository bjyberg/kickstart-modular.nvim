return {
  { -- requires plugins in lua/plugins/treesitter.lua and lua/plugins/lsp.lua
    -- for complete functionality (language features)
    'quarto-dev/quarto-nvim',
    ft = { 'quarto' },
    dev = false,
    opts = {
      -- lspFeatures = {
      -- enabled = true,
      -- chunks = 'curly',
      -- languages = { 'r', 'python', 'julia', 'bash', 'html', 'markdown', 'lua', 'javascript', 'typescript', 'ojs' },
      -- },
      codeRunner = {
        enabled = true,
        default_method = 'slime',
      },
    },
    dependencies = {
      'jmbuhr/otter.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
  },
}

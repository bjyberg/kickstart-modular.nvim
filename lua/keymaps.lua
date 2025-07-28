-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- [[ Custom Autocommands ]]
-- insert code blocks
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'markdown', 'quarto' },
  callback = function()
    vim.keymap.set('n', '<leader>ci', 'o```\n\n```<esc>kkA', { noremap = true, silent = true, desc = 'Insert [C]ode block' })
  end,
})

-- [[ Custom Basic ]]
-- Delete to black hole register by default
vim.keymap.set('n', 'd', '"_d', { noremap = true, desc = 'Delete (black hole)' })
vim.keymap.set('v', 'd', '"_d', { noremap = true, desc = 'Delete (black hole)' })

-- Map 'x' to 'cut' (delete into default register)
vim.keymap.set('n', 'x', 'd', { noremap = true, desc = 'Cut' })
vim.keymap.set('v', 'x', 'd', { noremap = true, desc = 'Cut' })

-- Remap 'm' to original 'x' (delete single character)
vim.keymap.set('n', 'xx', '"_x', { noremap = true, desc = 'Delete char (no register)' })
vim.keymap.set('v', 'xx', '"_x', { noremap = true, desc = 'Delete char (no register)' })

-- Paste and overwrite by default
vim.keymap.set('v', 'p', '_dP', { noremap = true, desc = 'Paste (overwrite)' })

-- Ctrl-S to save
vim.keymap.set({ 'n', 'i', 'v', 'x', 's' }, '<C-s>', function()
  vim.cmd 'write'
end, { desc = 'Save file', silent = true })

-- [[ Custom - LSP / Diagnostics ]]

vim.keymap.set('n', '<leader>ld', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = '[l]sp [d]iagnostics' })

vim.keymap.set('n', '<leader>lgd', vim.lsp.buf.definition, { desc = '[l]sp [g]o definition' })
vim.keymap.set('n', '<leader>lgD', vim.lsp.buf.declaration, { desc = '[l]sp [g]o declaration' })
vim.keymap.set('n', '<leader>lgr', vim.lsp.buf.references, { desc = '[l]sp [g]o references' })
vim.keymap.set('n', '<leader>lgi', vim.lsp.buf.implementation, { desc = '[l]sp [g]o implementation' })
vim.keymap.set('n', '<leader>lgt', vim.lsp.buf.type_definition, { desc = '[l]sp [g]o type definition' })

vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = '[l]sp [r]ename symbol' })
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { desc = '[l]sp code [a]ction' })

-- [[ Custom - Spell ]]
vim.keymap.set('n', '<leader>ss', function()
  vim.opt.spell = not (vim.opt.spell:get())
end, { desc = '[s]pell check [t]oggle' })

-- Next and previous spelling error
vim.keymap.set('n', '<leader>sn', ']s', { desc = '[s]pelling error [n]ext' })
vim.keymap.set('n', '<leader>sp', '[s', { desc = '[s]pelling error [p]revious' })

-- Add word to spellfile
vim.keymap.set('n', '<leader>sa', 'zg', { desc = '[s]pell: [a]dd word to dictionary' })

-- Mark word as incorrect
vim.keymap.set('n', '<leader>sw', 'zw', { desc = '[s]pell: Mark word as [w]rong' })

-- Show spelling suggestions
vim.keymap.set('n', '<leader>ss', 'z=', { desc = '[s]pelling [s]uggestions' })

-- [[ Custom - VIM ]]
vim.keymap.set('n', '<leader>vc', '<cmd>edit $MYVIMRC<CR>', { desc = 'neo[v]im [c]onfig' })
vim.keymap.set('n', '<leader>vr', '<cmd>source $MYVIMRC<CR>', { desc = 'neo[v]im [r]eload' })
vim.keymap.set('n', '<leader>vm', '<cmd>Mason<CR>', { desc = 'neo[v]im: Open [m]ason' })
vim.keymap.set('n', '<leader>vl', '<cmd>Lazy<CR>', { desc = 'neo[v]im: Open [l]azy' })
vim.keymap.set('n', '<leader>vh', '<cmd>checkhealth<CR>', { desc = 'neo[v]im: Check [h]ealth' })
vim.keymap.set('n', '<leader>vp', '<cmd>Lazy profile<CR>', { desc = 'neo[v]im: [p]rofile startup time' })

-- [[ Custom - code ]]
vim.keymap.set('n', '<leader>cc', 'gcc', { remap = true, desc = '[c]ode [c]omment line' })
vim.keymap.set('v', '<leader>cc', 'gc', { remap = true, desc = '[c]ode [c]omment block' })
vim.keymap.set('n', '<leader>cs', function()
  local cs = vim.bo.commentstring:gsub('%%s', '')
  local text = cs .. '---   ---'
  vim.api.nvim_put({ text }, 'l', true, true)
  local row = vim.api.nvim_win_get_cursor(0)[1] - 1
  local col = #cs + 5 -- #cs (comment string) + 3 (dashes) + 1 (space)
  vim.api.nvim_win_set_cursor(0, { row, col - 1 })
end, { desc = '[c]ode [s]ection' })

-- vim.keymap.set('n', '<leader>ctd')

-- vim: ts=2 sts=2 sw=2 et

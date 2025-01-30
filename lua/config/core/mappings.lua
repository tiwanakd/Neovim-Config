-- For conciseness
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.api.nvim_set_keymap('i', '<A-h>', '<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-j>', '<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-k>', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-l>', '<Right>', { noremap = true, silent = true })

vim.keymap.set("n", "<space>e", "<cmd>Oil<CR>")

-- Diagnostic keymaps
vim.keymap.set('n', ']d', function()
  opts = { count = 1, float = true }
  vim.diagnostic.jump(opts)
end, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', '[d', function()
  opts = { count = -1, float = true }
  vim.diagnostic.jump(opts)
end, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

vim.keymap.set('n', '<Tab>', ':tabn<CR>', opts) --  go to next tab
vim.keymap.set('n', '<S-Tab>', ':tabp<CR>', opts)

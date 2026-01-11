-- For conciseness
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("i", "jk", "<Esc>", opts)
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Use Alt key to navigate in insert mode
vim.api.nvim_set_keymap('i', '<A-h>', '<Left>', opts)
vim.api.nvim_set_keymap('i', '<A-j>', '<Down>', opts)
vim.api.nvim_set_keymap('i', '<A-k>', '<Up>', opts)
vim.api.nvim_set_keymap('i', '<A-l>', '<Right>', opts)

-- To open Oil
vim.keymap.set("n", "<space>e", "<cmd>Oil<CR>")

-- Map Space + w to save
vim.api.nvim_set_keymap('n', '<Space>w', ':w<CR>', opts)

-- Map Space + q to quit
vim.api.nvim_set_keymap('n', '<leader>Q', ':q<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fq', ':q!<CR>', opts)

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

-- buffer Navigations
vim.api.nvim_set_keymap('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
vim.api.nvim_set_keymap('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)

vim.api.nvim_set_keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

vim.api.nvim_set_keymap('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
vim.api.nvim_set_keymap('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

vim.api.nvim_set_keymap('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

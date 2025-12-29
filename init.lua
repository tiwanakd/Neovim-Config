require("config.lazy")
require("config.core.mappings")

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.laststatus = 3

local set = vim.opt_local

set.shiftwidth = 2
set.number = true
set.relativenumber = true

vim.diagnostic.config({
  virtual_text = true,      -- Show diagnostics as inline text
  signs = true,             -- Show diagnostics in the sign column
  underline = true,         -- Underline problematic lines
  update_in_insert = false, -- Update diagnostics only in normal mode
  severity_sort = true,     -- Sort diagnostics by severity
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

local job_id = 0
vim.keymap.set("n", "<space>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)

  job_id = vim.bo.channel
end)

--use to send commands to terminal exmples below
vim.keymap.set("n", "<space>exp", function()
  --make
  --go build, go test ./abc
  vim.fn.chansend(job_id, { "ls -al\r\n" })
end)

--set border around lsp hover using K
vim.keymap.set("n", "K", function()
  vim.lsp.buf.hover({
    border = "rounded"
  })
end)

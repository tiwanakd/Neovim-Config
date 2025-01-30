vim.cmd [[
  anoremenu PopUp.References  <cmd>Telescope lsp_references<CR>
  anoremenu PopUp.Inspect     <cmd>Inspect<CR>
  amenu PopUp.-1-             <NOP>
  nnoremenu PopUp.Back        <C-t>
  amenu PopUp.-2-             <NOP>
]]

local group = vim.api.nvim_create_augroup("nvim_popupmenu", { clear = true })
vim.api.nvim_create_autocmd("MenuPopup", {
  pattern = "*",
  group = group,
  desc = "Custom PopUp Setup",
  callback = function()
    vim.cmd [[
      amenu disable PopUp.References
    ]]

    if vim.lsp.get_clients({ bufnr = 0 })[1] then
      vim.cmd [[
        amenu enable PopUp.References
      ]]
    end
  end,
})

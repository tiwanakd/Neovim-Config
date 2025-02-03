return {
  -- { "folke/tokyonight.nvim", config = function() vim.cmd.colorscheme "tokyonight" end },
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup {
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        }
      }
    }
    vim.cmd.colorscheme "catppuccin"
  end
}

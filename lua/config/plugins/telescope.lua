return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      local actions = require("telescope.actions")
      require('telescope').setup {
        pickers = {
          find_files = {
            theme = "ivy"
          },
          buffers = {
            attach_mappings = function(_, map)
              -- delete buffer and keep telescope open
              map("n", "d", actions.delete_buffer)

              -- quit telescope
              map("n", "q", actions.close)

              return true
            end,
          },
        },
        extensions = {
          fzf = {}
        }
      }

      require('telescope').load_extension('fzf')

      local builtin = require('telescope.builtin')

      vim.keymap.set("n", "<space>ff", builtin.find_files)
      vim.keymap.set("n", "<space>fh", builtin.help_tags)
      vim.keymap.set("n", "<space>en", function()
        builtin.find_files {
          cwd = vim.fn.stdpath("config")
        }
      end)
      vim.keymap.set("n", "<space>ep", function()
        builtin.find_files {
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
        }
      end)
      vim.keymap.set("n", "<space>h", "<cmd>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal<cr>")

      require "config.telescope.multigrep".setup()
    end
  },
}

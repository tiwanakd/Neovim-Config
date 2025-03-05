return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim"
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "gopls", "bashls", "terraformls" },
        automatic_installation = true
      })

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      require("lspconfig").lua_ls.setup { capabilities = capabilities }
      require("lspconfig").gopls.setup({
        capabilities = capabilities, -- Add capabilities for autocompletion
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = require("lspconfig").util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true,
            gofumpt = true,
          },
        },
      })

      require("lspconfig").bashls.setup({
        filetypes = { "sh", "bash" },
        cmd = { "bash-language-server", "start" },
        capabilities = capabilities
      })

      require("lspconfig").terraformls.setup({
        filetypes = { "terraform", "terraform-vars", "hcl", "tf" },
        capabilities = capabilities,
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.name == "gopls" then
            vim.api.nvim_create_autocmd('BufWritePre', {
              pattern = "*.go",
              callback = function()
                -- Organize Imports
                local params = vim.lsp.util.make_range_params()
                params.context = { only = { "source.organizeImports" } }

                -- Request code actions for organizing imports
                local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
                for cid, res in pairs(result or {}) do
                  for _, r in pairs(res.result or {}) do
                    if r.edit then
                      local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                      vim.lsp.util.apply_workspace_edit(r.edit, enc)
                    end
                  end
                end

                -- Format the file
                vim.lsp.buf.format({ async = false })
              end,
            })
          end

          if client:supports_method('textDocument/formatting') then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })
    end,
  }
}

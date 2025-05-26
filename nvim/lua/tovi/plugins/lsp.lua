return {
  -- Mason & LSP Auto Installer
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason").setup()

      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup {
        ensure_installed = { "lua_ls", "pyright", "bashls", "html", "cssls" },
        automatic_installation = true,
      }

      -- Automatic setup - loops through all installed servers
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Get all installed servers and set them up automatically
      vim.api.nvim_create_autocmd("User", {
        pattern = "MasonToolsUpdateCompleted",
        callback = function()
          for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
            if not lspconfig[server_name] then
              goto continue
            end

            local server_config = { capabilities = capabilities }

            -- Special configuration for lua_ls
            if server_name == "lua_ls" then
              server_config.settings = {
                Lua = {
                  diagnostics = { globals = { "vim" } },
                  workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                },
              }
            end

            lspconfig[server_name].setup(server_config)
            ::continue::
          end
        end,
      })

      -- Trigger initial setup after a short delay
      vim.defer_fn(function()
        vim.api.nvim_exec_autocmds("User", { pattern = "MasonToolsUpdateCompleted" })
      end, 100)
    end,
  },
  -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup {
        mapping = cmp.mapping.preset.insert({
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'path' },
          { name = 'buffer' },
        }),
      }
    end
  },
  -- Treesitter for advanced syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "python", "lua", "bash", "html", "css" },
        highlight = { enable = true },
        indent = { enable = true },
      }
    end
  },
  -- GitHub Copilot
}

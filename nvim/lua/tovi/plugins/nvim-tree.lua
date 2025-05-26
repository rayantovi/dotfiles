return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- 🔥 GLOBAL TOGGLE MAPPING
    vim.keymap.set('n', '<Leader>ef', require("nvim-tree.api").tree.toggle, { desc = 'Toggle NvimTree' })

    local function my_on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- optional extra mappings inside the tree buffer
      vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
      vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    end

    require("nvim-tree").setup({
      on_attach = my_on_attach,
      update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {},
      },
    })
  end,
}


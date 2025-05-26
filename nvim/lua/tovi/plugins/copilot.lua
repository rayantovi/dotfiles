-- For the Lua-native plugin (recommended for Neovim 0.8+)
return {
  "zbirenbaum/copilot.lua",
  config = function()
    require("copilot").setup({})
  end,
}

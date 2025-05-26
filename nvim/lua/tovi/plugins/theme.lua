return {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
        require("onedarkpro").setup({
            highlights = {
                MyNewHighlightGroup = { fg = "${red}" }
            },
            options = {
                transparency = true,
            },
        })
    end,

}


function ColorMyPencils(color)
	color = color or "onedark_dark"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end
return {
    "olimorris/onedarkpro.nvim",
    name = "onedarkpro",
    priority = 1000, -- Ensure it loads first
    config = function()
    require("onedarkpro").setup({
            options = {
                transparency = true
  }

})
        vim.cmd("colorscheme onedark")
        ColorMyPencils()
    end
}


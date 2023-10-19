vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#0f0f0f", fg= "#F0FFFF" })

require("cmp").setup({
    window = {
        completion = {
            border = "rounded",
            winhighlight = "Normal:CmpNormal",
        }
    }
})


-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }
    ----------------------------------------------------------
    use {
        use("nvim-treesitter/nvim-treesitter-context");

        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        use("nvim-treesitter/nvim-treesitter-context");
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    ----------------------------------------------------------
    use {
        'abecodes/tabout.nvim',
        config = function()
            require('tabout').setup {
                tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
                backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
                act_as_tab = true, -- shift content if tab out is not possible
                act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
                default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
                default_shift_tab = '<C-d>', -- reverse shift default action,
                enable_backwards = true, -- well ...
                completion = true, -- if the tabkey is used in a completion pum
                tabouts = {
                    {open = "'", close = "'"},
                    {open = '"', close = '"'},
                    {open = '`', close = '`'},
                    {open = '(', close = ')'},
                    {open = '[', close = ']'},
                    {open = '{', close = '}'}
                },
                ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
                exclude = {} -- tabout will ignore these filetypes
            }
        end,
        wants = {'nvim-treesitter'}, -- or require if not used so far
        after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
    }
    ----------------------------------------------------------
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    ----------------------------------------------------------
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}
    ----------------------------------------------------------
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    ----------------------------------------------------------
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    ----------------------------------------------------------
    use ('williamboman/mason.nvim')
    use ("olimorris/onedarkpro.nvim")
    use ('hrsh7th/nvim-cmp')
    use ('ThePrimeagen/harpoon')
    use ('tpope/vim-surround')
    use ({ 'mrjones2014/smart-splits.nvim', tag = 'v1.0.0' })
    use ('marko-cerovac/material.nvim')
    use ('nvim-treesitter/nvim-treesitter', {run =  ':TSUpdate'})
    use ("nvim-treesitter/playground")
    use ("mbbill/undotree")
    use ("tpope/vim-fugitive")
    use ('christoomey/vim-tmux-navigator')
    use ("mg979/vim-visual-multi")
    use ('norcalli/nvim-colorizer.lua')
    use ('junegunn/fzf.vim')
end)

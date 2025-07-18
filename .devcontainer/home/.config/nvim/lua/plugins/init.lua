return {
    -- https://github.com/ofirgall/open.nvim
    { 'ofirgall/open.nvim', dependencies = 'nvim-lua/plenary.nvim' },
    -- https://github.com/windwp/nvim-autopairs
    { 'windwp/nvim-autopairs', event = "InsertEnter", config = true },
    -- https://github.com/numToStr/Comment.nvim
    { 'numToStr/Comment.nvim', config = true },
    -- https://github.com/ray-x/lsp_signature.nvim
    { 'ray-x/lsp_signature.nvim', event = 'InsertEnter', config = true },
    -- https://github.com/NMAC427/guess-indent.nvim
    { 'nmac427/guess-indent.nvim', config = true },
    -- https://github.com/Pocco81/auto-save.nvim
    { 'Pocco81/auto-save.nvim' },
    -- https://github.com/nvim-telescope/telescope.nvim
    { 'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' } },
}


return {
    'VonHeikemen/lsp-zero.nvim',

    dependencies = {
        --- Uncomment the two plugins below if you want to manage the language servers from neovim
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        {'neovim/nvim-lspconfig'},
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'L3MON4D3/LuaSnip'},
    },

    config = function()
        require('mason').setup({})

        local lsp = require('lsp-zero')
        lsp.preset('recommended')

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({buffer = bufnr})
        end)

        require('lspconfig').clangd.setup({})

        local cmp = require('cmp')

        cmp.setup({
            sources = {
                {name = 'nvim_lsp'},
            },
            mapping = {
                ['<Enter>'] = cmp.mapping.confirm({select = false}),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
                ['<Tab>'] = cmp.mapping.select_next_item({behavior = 'select'}),
                ['<C-p>'] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_prev_item({behavior = 'insert'})
                    else
                        cmp.complete()
                    end
                end),
                ['<C-n>'] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_next_item({behavior = 'insert'})
                    else
                        cmp.complete()
                    end
                end),
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
        })

        lsp.setup()
    end
}

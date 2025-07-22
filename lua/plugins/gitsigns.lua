return {
    'lewis6991/gitsigns.nvim',

    config = function()
        require('gitsigns').setup({
            signs = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '┃' },
                untracked    = { text = '┆' },
            },
            signs_staged = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '┃' },
                untracked    = { text = '┆' },
            },
            numhl = true,
            linehl = false,
            word_diff = false,
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text_pos = 'eol',
                delay = 1000,
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                map('n', '<leader>hp', gs.preview_hunk)
                map('n', '<leader>hi', gs.preview_hunk_inline)
            end,
        })
    end
}

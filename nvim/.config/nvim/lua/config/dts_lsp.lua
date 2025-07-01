-- Need to manually install the LSP : `cargo install dts-lsp`
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = { "*.dts", "*.dtsi" },
    callback = function(_)
        vim.lsp.start({
            name = 'dts-lsp',
            cmd = { 'dts-lsp' },
            root_dir = vim.fs.dirname(vim.fs.find({ '.git' }, { upward = true })[1]),
        })
    end
})

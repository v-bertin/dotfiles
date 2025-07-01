require("nvim-treesitter.configs").setup({
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "devicetree",
        "kconfig",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "yaml",
    },

    -- List of parsers to ignore installing (or "all")
    ignore_install = {},

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = false,

    highlight = {
        enable = true,
    },

    modules = {},
})

vim.filetype.add({
    extension = {
        vspec = 'yaml',
    },
})

require("nvim-treesitter.configs").setup({
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = {
        "bash",
        "bitbake",
        "c",
        "cmake",
        "devicetree",
        "kconfig",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "proto",
        "python",
        "rust",
        "strictdoc",
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

-- Need to manually copy the queries to $HOME/.local/share/nvim/lazy/nvim-treesitter/queries/strictdoc/ ...
-- See <https://github.com/nvim-treesitter/nvim-treesitter/tree/master#adding-parsers>
local parsers = require("nvim-treesitter.parsers").get_parser_configs()
parsers.strictdoc = {
    install_info = {
        url = "~/Projects/externals/tree-sitter-strictdoc",
        files = { "src/parser.c" },

        generate_requires_npm = false,
        requires_generate_from_grammar = false,
    },
    filetype = { "sdoc", "sgra" },
}
vim.treesitter.language.register('strictdoc', { "sdoc", "sgra" })

vim.filetype.add({
    extension = {
        inc = 'bitbake',
        network = 'systemd',
        service = 'systemd',
        spec = 'python',
        vspec = 'yaml',
        sdoc = 'strictdoc',
        sgra = 'strictdoc',
    },
    pattern = {
        [".*/%.github/workflows/.*%.ya?ml"] = "yaml.ghactions",
    },
})

return {
    {
        -- Provides basic configurations for various LSP servers
        'neovim/nvim-lspconfig',

        dependencies = {
            -- Automatically install LSPs and linters, add the installation path
            -- to stdpath and provides an interface to browse existing tools
            {
                'mason-org/mason.nvim',
                opts = {},
            },

            -- Bridges mason with nvim-lspconfig
            'mason-org/mason-lspconfig.nvim',

            -- Provides a ensure_installed for linters, similarly to what mason-lspconfig
            -- provides for LSPs
            'WhoIsSethDaniel/mason-tool-installer.nvim',

            -- Useful status updates for LSP
            {
                'j-hui/fidget.nvim',
                opts = {}
            },
        },
    },
    {
        -- Plugin to configure LuaLS (Lua Language Server) for writing a Neovim config
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
        dependencies = {
            { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
        },
    },
    -- Enhance yamlls and jsonlsp by validating common files against their associated schemas
    "b0o/schemastore.nvim",
    -- Manage linters installed through Mason
    { "stevearc/conform.nvim", opts = {} },
}

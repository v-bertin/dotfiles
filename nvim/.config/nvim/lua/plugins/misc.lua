return {
    -- emacs-like cursors
    { 'mg979/vim-visual-multi' },
    -- comment a specific amount of words, of blocks, of lines
    {
        'numToStr/Comment.nvim',
        opts = {}
    },
    -- kitty config syntax highlighting
    { 'fladson/vim-kitty' },
    -- improved rust_analyzer experience
    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false, -- This plugin is already lazy
    },
    -- autocomplete for Cargo.toml files
    {
        'saecki/crates.nvim',
        tag = 'stable',
    },
    -- simili emacs compilation mode
    {
        "ej-shafran/compile-mode.nvim",
        branch = "latest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- if you want to enable coloring of ANSI escape codes in
            -- compilation output, add:
            -- { "m00qek/baleia.nvim", tag = "v1.3.0" },
        },
        config = function()
            vim.g.compile_mode = {
                -- to add ANSI escape code support, add:
                -- baleia_setup = true,
            }
        end
    },
    -- coerce from a case to another
    -- crs - coerce to snake_case
    -- crm - coerce to MixedCase
    -- crc - coerce to camelCase
    -- cru - coerce to UPPER_CASE
    { "tpope/vim-abolish" },
}

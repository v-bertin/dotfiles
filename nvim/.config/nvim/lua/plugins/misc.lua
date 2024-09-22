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
}

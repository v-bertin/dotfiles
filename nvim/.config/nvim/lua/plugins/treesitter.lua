return {
    "nvim-treesitter/nvim-treesitter",
    -- main branch is still experimental
    branch = "master",
    -- plugin does not support lazy loading
    lazy = false,
    build = ":TSUpdate",
}

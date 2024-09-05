-- Plugin manager
require("config.lazy")

-- Mason settings
LSPs = {
    "lua_ls",               -- Lua
    "clangd",               -- C/C++
    "neocmake",             -- CMake 
    "rust_analyzer",        -- Rust
    "bashls",               -- Bash
    "ruff",                 -- Python : lint and format code
    "jedi_language_server", -- Python : autocomplete
}

-- Plugin related configs
require("config.telescope")
require("config.gitsigns")
require("config.mason")
require("config.nvim-cmp")
require("config.keymaps")

-- Neovim related configs

-- Sync OS and Neovim clipboards
vim.o.clipboard = 'unnamedplus'

-- Save undo history
vim.o.undofile = true

-- Print line numbers in the status column
vim.wo.number = true
vim.wo.relativenumber = true

-- Manage the tab key
vim.o.tabstop = 4      -- Insert 4 spaces for a tab
vim.o.shiftwidth = 4   -- Change the number of spaces characters inserted for indentation
vim.o.expandtab = true -- Converts tabs to spaces

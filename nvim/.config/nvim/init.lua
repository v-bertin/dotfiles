-- Plugin manager
require("config.lazy")

-- TODO LSP servers
-- 1. Pass parameters :
-- see [kickstart.nvim](https://github.com/v-bertin/kickstart.nvim/blob/3ce3251296265582893e66770c5e3be84d7a24a7/init.lua#L572)
-- 2. Specify dependencies (for ex, rust_analyzer depends on webapi-vim)

-- Mason settings
LSPs = {
    "lua_ls",               -- Lua
    "clangd",               -- C/C++
    "neocmake",             -- CMake 
    "bashls",               -- Bash
    "ruff",                 -- Python : lint and format code
    "pyright",              -- Python : autocomplete
    "typos_lsp",            -- Spelling checker
    "jsonls",               -- JSON file validation
    "yamlls",               -- YAML file validation
}

-- Plugin related configs
require("config.telescope")
require("config.git")
require("config.mason")
require("config.autocomplete")
require("config.keymaps")
require("config.notes")
require("config.aesthetic")

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

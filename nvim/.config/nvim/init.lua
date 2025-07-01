-- Plugin manager
require("config.lazy")

-- LSP settings
LSPs = {
    lua_ls = {},    -- Lua
    clangd = {},    -- C/C++
    neocmake = {},  -- CMake
    bashls = {},    -- Bash
    ruff = {},      -- Python : lint and format code
    pyright = {},   -- Python : autocomplete
    typos_lsp = {}, -- Spelling checker
    jsonls = {},    -- JSON file validation
    yamlls = {},    -- YAML file validation
    ts_ls = {},     -- Typescript
}

-- Linter settings
Linters = {
    gersemi = {},   -- CMake formatter
    cmakelang = {}, -- CMake linter
    yamlfmt = {},   -- YAML formatter
    prettier = {},  -- Markdown formatter
    stylua = {},    -- Lua formatter
    taplo = {},     -- TOML formatter
}

Linters["oelint-adv"] = {} -- Bitbake linter

-- Plugin related configs

require("config.aesthetic")
require("config.autocomplete")
require("config.conform")
require("config.git")
require("config.hex")
require("config.keymaps")
require("config.mason")
require("config.notes")
require("config.telescope")
require("config.treesitter")
require("config.dts_lsp")

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

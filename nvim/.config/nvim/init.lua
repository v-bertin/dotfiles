require("config.lazy")
require("config.telescope")
require("config.keymaps")

-- Neovim related configs

-- Sync OS and Neovim clipboards
vim.o.clipboard = 'unnamedplus'

-- Save undo history
vim.o.undofile = true

-- Print line numbers in the status column
vim.wo.number = true
vim.wo.relativenumber = true

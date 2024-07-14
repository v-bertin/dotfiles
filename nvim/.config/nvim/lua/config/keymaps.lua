local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Telescope
keymap("n", "<leader><leader>", "<cmd> Telescope buffers<cr>", opts)
keymap("n", "<leader>sf", "<cmd> Telescope find_files<cr>", opts)
keymap("n", "<leader>sg", "<cmd> Telescope live_grep<cr>", opts)

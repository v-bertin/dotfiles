local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Telescope
keymap("n", "<leader><leader>", "<cmd> Telescope buffers<cr>", opts)
keymap("n", "<leader>sf", "<cmd> Telescope find_files<cr>", opts)
keymap("n", "<leader>sg", "<cmd> Telescope live_grep<cr>", opts)
keymap("n", "<leader>f", "<cmd> Telescope file_browser path=%:p:h select_buffer=true<cr>", opts)

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

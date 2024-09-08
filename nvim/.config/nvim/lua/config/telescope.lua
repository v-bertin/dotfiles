local telescope = require("telescope")

local builtin = require('telescope.builtin')
local actions = require("telescope.actions")
local fb_actions = require("telescope._extensions.file_browser.actions")

telescope.setup {
    extensions = {
        file_browser = {
            theme = "ivy",
            -- starts in normal mode instead of insert mode
            initial_mode = "normal",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["n"] = {
                    ["h"] = fb_actions.goto_parent_dir,
                    ["j"] = actions.move_selection_worse,
                    ["k"] = actions.move_selection_better,
                    ["l"] = actions.select_default,
                    ["<left>"] = fb_actions.goto_parent_dir,
                    ["<down>"] = actions.move_selection_worse,
                    ["<up>"] = actions.move_selection_better,
                    ["<right>"] = actions.select_default,
                }
            },
        },
    },
}

telescope.load_extension("file_browser")

vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Open buffer list' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Find a file' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Look for a regular expression in the current directory' })
vim.keymap.set('n', '<space>f', function()
    -- Get path to the file in the current buffer
    local current_buffer_path = vim.api.nvim_buf_get_name(0)
    -- Remove file name from file path
    local folder_path = vim.fn.fnamemodify(current_buffer_path, ':p:h')
    telescope.extensions.file_browser.file_browser({
        cwd = folder_path,
    })
end, { desc = 'Open the file browser' })

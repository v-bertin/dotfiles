local actions = require("telescope.actions")
local fb_actions = require("telescope._extensions.file_browser.actions")

require("telescope").setup {
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

require("telescope").load_extension "file_browser"

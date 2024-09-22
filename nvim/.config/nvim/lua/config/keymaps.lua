vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

local split_whitespace = function(content)
    local lines = {}
    for line in string.gmatch(content, "[^\n]+") do
        table.insert(lines, line)
    end
    return lines
end

-- Run a bash command and place its output inside a newl created buffer
vim.api.nvim_create_user_command(
    'Run',
    function(args)
        if #args.fargs == 0 then
            print("No command provided")
            return
        end

        local my_cmd = args.fargs[1]
        local my_args = { unpack(args.fargs, 2, #args.fargs) }

        local buf = vim.api.nvim_create_buf(false, true);
        if buf == 0 then
            print("Failed to spawn new buffer")
            return
        end

        for _, handle in ipairs(vim.api.nvim_list_bufs()) do
            local name = vim.api.nvim_buf_get_name(handle)
            if string.match(name, my_cmd) ~= nil then
                vim.api.nvim_buf_delete(handle, { force = true })
                break
            end
        end
        vim.api.nvim_buf_set_name(buf, my_cmd)

        local win = vim.api.nvim_open_win(buf, true, {
            split = 'above',
            win = 0
        })
        if win == 0 then
            print("Failed to open new buffer")
        end

        local stdout = vim.uv.new_pipe()
        local stderr = vim.uv.new_pipe()

        -- handle, pid
        local _, _ = vim.uv.spawn(my_cmd,
            {
                args = my_args,
                stdio = { nil, stdout, stderr },
            },
            -- code, signal
            function(_, _) end
        )

        local write_to_buffer = function(err, data)
            vim.schedule(function()
                if err ~= nil then
                    print(err)
                    return
                end
                if data == nil then
                    return
                end

                local lines = split_whitespace(data)
                vim.api.nvim_put(lines, "l", true, true)
                -- Put the cursor at the beginning of the buffer
                -- vim.api.nvim_win_set_cursor(win, {0, 0})
            end)
        end

        vim.uv.read_start(stdout, function(err, data)
            write_to_buffer(err, data)
        end)
        vim.uv.read_start(stderr, function(err, data)
            write_to_buffer(err, data)
        end)
    end,
    { nargs = '*' }
)

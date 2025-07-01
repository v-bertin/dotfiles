local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        cmake = { "cmakelang", "gersemi" },
        lua = { "stylua" },
        yaml = { "yamlfmt" },
        markdown = { "prettier" },
        toml = { "taplo" },
        bitbake = { "oelint" },
    },
})

conform.formatters.cmakelang = {
    inherit = true,
    -- See <https://github.com/mason-org/mason.nvim/discussions/33>
    command = vim.fn.expand("$MASON/bin/cmake-format"),
    args = function()
        local args = { "$FILENAME" }

        local is_config_file = function(name, _)
            return name:match('^%.?cmake%-format%.yaml$') ~= nil
        end
        local root = vim.fs.root(0, is_config_file)

        if root ~= nil then
            local configs = vim.fs.find(is_config_file, { path = root, type = 'file' })
            table.insert(args, "-c")
            table.insert(args, configs[1])
        end

        return args
    end,
}

conform.formatters.oelint = {
    command = vim.fn.expand("$MASON/bin/oelint-adv"),
    args = { "--fix", "--nobackup", "--jobs=1", "--quiet", "$FILENAME" },
    stdin = false,
    exit_codes = { 0, 1 },
}

-- See <https://github.com/facebookexperimental/semcode>
return {
	name = "semcode-lsp",
	cmd = { "semcode-lsp" },
	filetypes = { "c", "cpp", "cc", "h", "hpp" },
	root_dir = vim.fs.dirname(vim.fs.find({ ".semcode.db", ".git" }, { upward = true })[1]),
	settings = {},
}

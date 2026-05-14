return {
	cmd = { "language-server-bitbake", "--stdio" },
	filetypes = { "bitbake" },
	root_dir = vim.fs.root(0, { "sources", "layers" }),
}

packages = bash bash-completion bin fonts ghostty git kitty nvim rmtrash

install:
	stow $(packages)
	fc-cache ~/.local/share/fonts

uninstall:
	stow -D $(packages)
	fc-cache --really-force

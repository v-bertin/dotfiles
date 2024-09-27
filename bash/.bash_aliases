# Safety measure because what you think already happened to me
alias rm='rmtrash'
alias rmdir='rmdirtrash'
alias _rm='/usr/bin/rm'
alias _rmdir='/usr/bin/rmdir'

# Sooo convenient
alias pwd='pwd | tee >(tr --delete "\n" | xclip -sel clip)'
alias _pwd='/usr/bin/pwd'

# Blazingly fast search
alias fd='fdfind'
alias bat='batcat'

# Before I switch to lsd ...
alias ll='ls --almost-all --human-readable -l'
alias la='ls --almost-all'

# Life in color
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff -u --color'

# Rust
alias x='cargo xtask'

# Kitty
alias icat='kitty +kitten icat --align=left'

# Explore archives
alias treezip='unzip -l'
alias treetar='tar jtf'

# fzf magic to fuzzy find a command in the history
alias fzfstory='history | cut --delimiter=" " --field=1,2,3 --complement | sort --unique | fzf --exact | xclip -sel clip'

# Others
addpath() {
	if ! [ -d "$1" ]; then
		echo "Given invalid directory"
		return
	fi

	export PATH="$PATH:$1"
}

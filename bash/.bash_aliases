# Safety measure because what you think already happened to me
alias rm='rmtrash'
alias rmdir='rmdirtrash'

force-rm() {
	echo "Are you sure you want to delete $* (Y/n) ?"
	read -r answer
	case ${answer:0:1} in
		Y )	/usr/bin/rm -rf "${@}";;
		* )	;;
	esac
}

# Sooo convenient
alias pwd='pwd | tee >(tr -d "\n" | xclip -sel clip)'

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

# Others
addpath() {
	if ! [ -d "$1" ]; then
		echo "Given invalid directory"
		return
	fi

	export PATH="$PATH:$1"
}

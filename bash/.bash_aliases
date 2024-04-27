alias rm='rmtrash'
alias rmdir='rmdirtrash'
alias sudo='sudo '
alias pwd='pwd | tee >(tr -d "\n" | xclip -sel clip)'
alias fd='fdfind'
alias bat='batcat'
alias diff='diff -u'

force-rm() {
	echo "Are you sure you want to delete $* (Y/n) ?"
	read -r answer
	case ${answer:0:1} in
		Y )	/usr/bin/rm -rf "${@}";;
		* )	;;
	esac
}

addpath() {
	if ! [ -d "$1" ]; then
		echo "Given invalid directory"
		return
	fi

	export PATH="$PATH:$1"
}

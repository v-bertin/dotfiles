alias rm='rmtrash'
alias rmdir='rmdirtrash'
alias sudo='sudo '
alias pwd='pwd | tee >(tr -d '\n' | xclip -sel clip)'

force-rm() {
	echo "Are you sure you want to delete ${@} (Y/n) ?"
	read answer
	case ${answer:0:1} in
		Y )	/usr/bin/rm -rf ${@};;
		* )	;;
	esac
}

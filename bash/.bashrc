# ~/.bashrc
# See /usr/share/doc/bash/examples
# See `man 1 bash`

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# History settings

# append to the history file, don't overwrite it
shopt -s histappend
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

HISTFILE="$HOME/.bash_history"
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# history length
HISTSIZE=5000
HISTFILESIZE=10000


# Handy colors

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# Aliases

if [ -f ~/.bash_aliases ]; then
    . "$HOME/.bash_aliases"
fi


# Completion

# Add local directory to store bash completion scripts
export BASH_COMPLETION_COMPAT_DIR="$HOME/.local/share/bash_completion.d"
# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Setup env

export PATH="$PATH:$HOME/.local/bin:/usr/local/bin"

# Rust
# shellcheck source=/dev/null
. "$HOME/.cargo/env"

# Tell ranger to use nvim as the default editor
export VISUAL=nvim
export EDITOR=nvim

# Set bash in vim mode
set -o vi

# fnm: manage node versions
FNM_PATH="/home/victor/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --use-on-cd --shell bash)"
fi

# go
GO_PATH="$HOME/go/bin/"
if [ -d "$GO_PATH" ]; then
    export PATH="$GO_PATH:$PATH"
fi


# Prompt

# Limit the length of the path in the prompt to three levels
export PROMPT_DIRTRIM=3
# show repo state : uncommitted changes, untracked files, etc
export GIT_PS1_SHOWDIRTYSTATE=1
# custom bash prompt : see https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
# shellcheck source=/dev/null
. "$HOME/.git-prompt.sh"
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'
PS1=' \[\e[38;5;22;1m\]\w\[\e[0;2m\]${PS1_CMD1}\[\e[0m\] > '

# autocomplete
complete -C "$(which aws_completer)" aws

# direnv
eval "$(direnv hook bash)"

# misc

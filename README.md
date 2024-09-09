# dotfiles

## Setup

Assuming the common Rust toolchain is already installed :

```
$ sudo apt update
$ sudo apt install \
    trash-cli \
    virtualenv \
    python3-venv \
    g++ \
    npm \
    ranger \
    python3-pynvim \
    shellcheck
$ rustup component add rust-analyzer

$ git clone https://github.com/v-bertin/dotfiles.git
$ git submodule update --init --recursive
```

> pynvim can also be installed using pip.

## Install

```
$ mv ~/.bashrc ~/.bashrc.bak
$ mv ~/.gitignore ~/.gitignore.bak

$ stow bash bin git nvim ranger rmtrash
$ fc-cache ~/.local/share/fonts/
```

## Uninstall

```
$ stow -D bash bin git nvim ranger rmtrash
```

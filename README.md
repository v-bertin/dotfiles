# dotfiles

## Setup

Assuming the common Rust toolchain is already installed :

```
sudo apt update
sudo apt install \
    trash-cli \
    virtualenv \
    python3-venv \
    g++ \
    npm \
    python3-pynvim \
    shellcheck
rustup component add rust-analyzer

git clone https://github.com/v-bertin/dotfiles.git
git submodule update --init --recursive
./scripts/kitty-installer.sh dest=kitty/.local launch=n
```

> pynvim can also be installed using pip.

## Install

```bash
mv ~/.bashrc ~/.bashrc.bak
mv ~/.gitignore ~/.gitignore.bak

stow bash bash-completion bin fonts git kitty nvim rmtrash
fc-cache ~/.local/share/fonts/
```

## Uninstall

```bash
stow -D bash bash-completion bin fonts git kitty nvim rmtrash
```

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

## Deploy

```bash
make install
# To undo the deployment
make uninstall
```

## AI

### Kernel development

```bash
git clone https://github.com/masoncl/review-prompts
./setup.sh opencode kernel
```

The provided skills are to be used in combination with:
- [semcode](https://github.com/facebookexperimental/semcode),
- [sparse](https://git.kernel.org/pub/scm/devel/sparse/sparse.git).

### PDF skill

```bash
git clone https://github.com/anthropics/skills
```

For now, I manually copy the skills folder I need to the correct location on the filesystem. Best practice is to follow the [Agent Skills standard](https://agentskills.io) (followed by Mistral Vibe and Opencode).

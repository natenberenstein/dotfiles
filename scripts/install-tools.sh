#!/usr/bin/env bash
# install-tools.sh — reinstall all CLI dev tools from scratch
# Run this on a fresh machine after cloning the dotfiles repo.

set -euo pipefail

echo "==> Installing CLI dev tools"

# ── Package manager prerequisites ──────────────────────────────────────────
sudo apt-get update -qq

# ── uv (Python package/project manager, replaces pip/poetry/pyenv for most uses) ──
curl -LsSf https://astral.sh/uv/install.sh | sh
# uv is placed in ~/.local/bin by default

# ── pyenv (Python version manager) ─────────────────────────────────────────
curl https://pyenv.run | bash
# Add to shell via setup.sh / .bashrc:
#   export PYENV_ROOT="$HOME/.pyenv"
#   [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
#   eval "$(pyenv init -)"
#   eval "$(pyenv virtualenv-init -)"

# ── nvm (Node version manager) ─────────────────────────────────────────────
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
# Usage: nvm install --lts

# ── starship (shell prompt) ─────────────────────────────────────────────────
curl -sS https://starship.rs/install.sh | sh

# ── fzf (fuzzy finder) ──────────────────────────────────────────────────────
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# ── zoxide (smarter cd) ─────────────────────────────────────────────────────
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# ── eza (modern ls replacement) ─────────────────────────────────────────────
# Via cargo or prebuilt binary — using the cargo approach:
# cargo install eza
# Or via apt if on Ubuntu 24.04+:
sudo apt-get install -y eza 2>/dev/null || cargo install eza

# ── bat (cat with syntax highlighting) ──────────────────────────────────────
sudo apt-get install -y bat 2>/dev/null || cargo install bat
# On Ubuntu the binary may be named batcat; symlink if needed:
# mkdir -p ~/.local/bin && ln -s /usr/bin/batcat ~/.local/bin/bat

# ── delta (git diff pager) ──────────────────────────────────────────────────
cargo install git-delta
# Or download from: https://github.com/dandavison/delta/releases

# ── fd (faster find) ────────────────────────────────────────────────────────
sudo apt-get install -y fd-find 2>/dev/null || cargo install fd-find
# On Ubuntu the binary may be named fdfind; symlink if needed:
# ln -s /usr/bin/fdfind ~/.local/bin/fd

# ── btop (system monitor) ───────────────────────────────────────────────────
sudo apt-get install -y btop 2>/dev/null || snap install btop

# ── yq (YAML/JSON processor) ────────────────────────────────────────────────
# Via uv (after installing uv above):
uv tool install yq
# Or: sudo snap install yq

# ── direnv (per-directory environment variables) ──────────────────────────
curl -sfL https://direnv.net/install.sh | bin_path=~/.local/bin bash
# Add to shell via .bashrc: eval "$(direnv hook bash)"

# ── xh (modern HTTP client, httpie-compatible) ────────────────────────────
XH_VERSION="0.25.3"  # update as needed
curl -sLo /tmp/xh.tar.gz "https://github.com/ducaale/xh/releases/download/v${XH_VERSION}/xh-v${XH_VERSION}-x86_64-unknown-linux-musl.tar.gz"
tar xzf /tmp/xh.tar.gz -C /tmp
install -m 755 "/tmp/xh-v${XH_VERSION}-x86_64-unknown-linux-musl/xh" ~/.local/bin/xh
rm -rf /tmp/xh.tar.gz "/tmp/xh-v${XH_VERSION}-x86_64-unknown-linux-musl"

# ── Neovim (latest stable AppImage / binary release) ────────────────────────
NVIM_VERSION="v0.11.0"  # update as needed
sudo mkdir -p /opt
curl -LO "https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-linux-x86_64.tar.gz"
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz
# Ensure /opt/nvim-linux-x86_64/bin is in PATH (already set in .bashrc)

echo ""
echo "==> Done. Open a new shell or run: source ~/.bashrc"
echo "    Then set up Python versions with: pyenv install <version>"
echo "    And Node versions with:           nvm install --lts"

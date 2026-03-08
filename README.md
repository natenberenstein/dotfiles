# dotfiles

Personal development environment configuration for Ubuntu/Debian. Covers the shell, terminal multiplexer, editor, prompt, and AI tooling.

## Structure

```
dotfiles/
├── bash/
│   └── .bashrc               # Shell config, aliases, PATH, tool init
├── nvim/                     # Neovim config (lazy.nvim) — see nvim/README.md
├── opencode/
│   └── oh-my-opencode.jsonc  # oh-my-opencode agent/model routing config
├── starship/
│   └── starship.toml         # Starship prompt config
├── tmux/
│   └── .tmux.conf            # tmux config with vim-tmux-navigator
├── scripts/
│   ├── install-tools.sh      # Install all CLI tools on a fresh machine
│   └── setup.sh              # Symlink configs to their expected locations
└── cli-cheatsheet.md         # Personal command reference
```

## Fresh machine setup

```bash
git clone <repo-url> ~/dotfiles
cd ~/dotfiles

# 1. Install CLI tools
bash scripts/install-tools.sh

# 2. Symlink configs
bash scripts/setup.sh

# 3. Reload shell
source ~/.bashrc
```

`setup.sh` backs up any existing files before overwriting (e.g. `~/.bashrc` → `~/.bashrc.bak`).

---

## Configs

### Bash (`bash/.bashrc`)

Key customizations on top of the Ubuntu default:

| What | Detail |
|------|--------|
| Prompt | Starship (`eval "$(starship init bash)"`) |
| `ls` | Replaced with `eza` |
| `cat` | Replaced with `bat` |
| `vim` | Aliased to `nvim` |
| `cd` | Enhanced with `zoxide` |
| Fuzzy search | `fzf` sourced from `~/.fzf.bash` |
| Python versions | `pyenv` + `pyenv-virtualenv` |
| Node versions | `nvm` |
| Python tooling | `uv` (with shell completion) |
| Neovim binary | `/opt/nvim-linux-x86_64/bin` on PATH |
| ROS | `colcon_cd`, `ROS_DOMAIN_ID=0` |

### Neovim (`nvim/`)

Full Neovim config using [lazy.nvim](https://github.com/folke/lazy.nvim). See [`nvim/README.md`](nvim/README.md) for the complete plugin list, keymaps, LSP servers, and Mason tools.

**Highlights:** snacks.nvim (file explorer + picker), blink-cmp, LSP via mason-lspconfig, conform.nvim formatting, nvim-lint, nvim-dap, neotest, treesitter, catppuccin theme, vim-tmux-navigator.

### Starship (`starship/starship.toml`)

Full-featured prompt showing: OS icon, user, host, directory, git branch/status/metrics, active language runtimes, cloud context (AWS/GCP/Azure/k8s), command duration, time (right prompt), and battery.

### tmux (`tmux/.tmux.conf`)

| Binding | Action |
|---------|--------|
| `prefix + \|` | Split horizontal |
| `prefix + -` | Split vertical |
| `prefix + r` | Reload config |
| `prefix + h/j/k/l` | Resize pane |
| `prefix + m` | Toggle pane zoom |
| `C-h/j/k/l` | Navigate panes (vim-tmux-navigator) |
| `v` / `y` (copy mode) | Begin selection / copy |

Plugins: [tpm](https://github.com/tmux-plugins/tpm), [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator), [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect), [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum), catppuccin theme.

Sessions auto-saved and restored via tmux-continuum.

### OpenCode (`opencode/oh-my-opencode.jsonc`)

[oh-my-opencode](https://github.com/code-yeongyu/oh-my-opencode) agent routing config with a tiered multi-agent setup:

| Tier | Agents | Purpose |
|------|--------|---------|
| 1 — Orchestrators | `sisyphus`, `atlas` | Top-level coordination |
| 2 — Planning | `prometheus`, `metis`, `momus` | Structured planning + validation |
| 2 — Execution | `hephaestus`, `oracle` | Implementation + debugging |
| 3 — Specialists | `sisyphus-junior`, `librarian`, `explore`, `multimodal-looker` | Fast execution, research, vision |

---

## CLI tools

Documented and reinstallable via `scripts/install-tools.sh`.

| Tool | Purpose | Install method |
|------|---------|----------------|
| [uv](https://github.com/astral-sh/uv) | Python package/project manager | `curl astral.sh/uv` |
| [pyenv](https://github.com/pyenv/pyenv) | Python version manager | `curl pyenv.run` |
| [nvm](https://github.com/nvm-sh/nvm) | Node version manager | `curl nvm install script` |
| [starship](https://starship.rs) | Shell prompt | `curl starship.rs/install.sh` |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder | `git clone + install` |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter `cd` | `curl install.sh` |
| [eza](https://github.com/eza-community/eza) | Modern `ls` | `apt` / `cargo` |
| [bat](https://github.com/sharkdp/bat) | `cat` with syntax highlighting | `apt` / `cargo` |
| [delta](https://github.com/dandavison/delta) | Git diff pager | `cargo install git-delta` |
| [fd](https://github.com/sharkdp/fd) | Faster `find` | `apt` / `cargo` |
| [btop](https://github.com/aristocratos/btop) | System monitor | `apt` / `snap` |
| [yq](https://github.com/mikefarah/yq) | YAML/JSON processor | `uv tool install yq` |
| [Neovim](https://neovim.io) | Editor | GitHub release tarball → `/opt/` |

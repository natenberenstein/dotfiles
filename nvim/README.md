# Neovim Configuration

Personal Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

**Leader key:** `Space`

## Core Keymaps

| Key | Mode | Description |
|-----|------|-------------|
| `jk` | Insert | Exit insert mode |
| `<leader>nh` | Normal | Clear search highlights |
| `<leader>+` | Normal | Increment number |
| `<leader>-` | Normal | Decrement number |

### Window Management

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>sv` | Normal | Split window vertically |
| `<leader>sh` | Normal | Split window horizontally |
| `<leader>se` | Normal | Make splits equal size |
| `<leader>sx` | Normal | Close current split |

### Tab Management

| Key | Mode | Description |
|-----|------|-------------|
| `<leader><Tab>o` | Normal | Open new tab |
| `<leader><Tab>x` | Normal | Close current tab |
| `<leader><Tab>n` | Normal | Go to next tab |
| `<leader><Tab>p` | Normal | Go to previous tab |
| `<leader><Tab>f` | Normal | Open current buffer in new tab |

---

## Plugins

### File Navigation — [snacks.nvim](https://github.com/folke/snacks.nvim)

Unified plugin for file exploration, picker, dashboard, notifications, and more.

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>ee` | Normal | Toggle file explorer |
| `<leader>ef` | Normal | Explorer focused on current file |
| `<leader>ff` | Normal | Find files |
| `<leader>fr` | Normal | Recent files |
| `<leader>fs` | Normal | Grep string in cwd |
| `<leader>fc` | Normal, Visual | Grep word under cursor |
| `<leader>ft` | Normal | Find todos |
| `<leader>fb` | Normal | Find buffers |
| `<leader><space>` | Normal | Smart find files |
| `<leader>sh` | Normal | Search help pages |
| `<leader>sk` | Normal | Search keymaps |
| `<leader>sd` | Normal | Search diagnostics |
| `<leader>su` | Normal | Search undo history |
| `<leader>gl` | Normal | Git log |
| `<leader>gs` | Normal | Git status |
| `<leader>gd` | Normal | Git diff |
| `<leader>lg` | Normal | Open lazygit |
| `<leader>z` | Normal | Toggle zen mode |

### LSP — [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

Language server protocol support. Keymaps are active when an LSP is attached to a buffer.

**Configured servers:** ts_ls, html, cssls, svelte, graphql, emmet_ls, eslint, pyright, lua_ls

| Key | Mode | Description |
|-----|------|-------------|
| `gR` | Normal | Show references |
| `gD` | Normal | Go to declaration |
| `gd` | Normal | Show definitions |
| `gi` | Normal | Show implementations |
| `gt` | Normal | Show type definitions |
| `<leader>ca` | Normal, Visual | Code actions |
| `<leader>rn` | Normal | Smart rename |
| `<leader>D` | Normal | Buffer diagnostics |
| `<leader>d` | Normal | Line diagnostics (float) |
| `[d` | Normal | Previous diagnostic |
| `]d` | Normal | Next diagnostic |
| `K` | Normal | Hover documentation |
| `<leader>rs` | Normal | Restart LSP |

### Autocompletion — [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

Completion engine with LSP, snippet, buffer, and path sources. Uses [LuaSnip](https://github.com/L3MON4D3/LuaSnip) for snippets and [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) for a VS Code snippet library.

| Key | Mode | Description |
|-----|------|-------------|
| `<C-j>` | Insert | Next completion item |
| `<C-k>` | Insert | Previous completion item |
| `<C-b>` | Insert | Scroll docs up |
| `<C-f>` | Insert | Scroll docs down |
| `<C-Space>` | Insert | Show completions |
| `<C-e>` | Insert | Close completion menu |
| `<CR>` | Insert | Confirm completion |

### Formatting — [conform.nvim](https://github.com/stevearc/conform.nvim)

Auto-formats on save. Formatters: **prettier** (JS/TS/HTML/CSS/JSON/YAML/Markdown/GraphQL), **stylua** (Lua), **black** (Python).

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>mp` | Normal, Visual | Format file or selection |

### Linting — [nvim-lint](https://github.com/mfussenegger/nvim-lint)

Runs on BufEnter, BufWritePost, and InsertLeave. Linters: **eslint_d** (JS/TS/JSX/TSX/Svelte), **ruff** (Python).

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>l` | Normal | Trigger linting |

### Debugging — [nvim-dap](https://github.com/mfussenegger/nvim-dap)

Debug adapter protocol with [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) and [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text). Debug adapters are auto-configured via [mason-nvim-dap](https://github.com/jay-babu/mason-nvim-dap.nvim).

**Debug adapters (via Mason):** js-debug-adapter, debugpy, delve

JS/TS has pre-configured launch configs for "Launch file" (pwa-node) and "Attach to process".

| Key | Mode | Description |
|-----|------|-------------|
| `<F5>` | Normal | Continue / start debugging |
| `<F10>` | Normal | Step over |
| `<F11>` | Normal | Step into |
| `<F12>` | Normal | Step out |
| `<leader>db` | Normal | Toggle breakpoint |
| `<leader>dB` | Normal | Set conditional breakpoint |
| `<leader>dr` | Normal | Toggle REPL |
| `<leader>du` | Normal | Toggle DAP UI |

### Testing — [neotest](https://github.com/nvim-neotest/neotest)

Test runner with [neotest-jest](https://github.com/nvim-neotest/neotest-jest) and [neotest-vitest](https://github.com/marilari88/neotest-vitest) adapters.

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>tt` | Normal | Run nearest test |
| `<leader>tf` | Normal | Run tests in file |
| `<leader>ts` | Normal | Toggle test summary |
| `<leader>to` | Normal | Show test output |

### Git — [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

Git signs in the gutter with hunk staging, resetting, and blame.

| Key | Mode | Description |
|-----|------|-------------|
| `]h` | Normal | Next hunk |
| `[h` | Normal | Previous hunk |
| `<leader>hs` | Normal, Visual | Stage hunk |
| `<leader>hr` | Normal, Visual | Reset hunk |
| `<leader>hS` | Normal | Stage buffer |
| `<leader>hR` | Normal | Reset buffer |
| `<leader>hu` | Normal | Undo stage hunk |
| `<leader>hp` | Normal | Preview hunk |
| `<leader>hb` | Normal | Blame line |
| `<leader>hB` | Normal | Toggle line blame |
| `<leader>hd` | Normal | Diff this (vs index) |
| `<leader>hD` | Normal | Diff this (vs HEAD) |
| `ih` | Operator, Visual | Select hunk (text object) |

### Diagnostics — [trouble.nvim](https://github.com/folke/trouble.nvim)

Pretty diagnostics list with [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) integration.

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>xw` | Normal | Workspace diagnostics |
| `<leader>xd` | Normal | Document diagnostics |
| `<leader>xq` | Normal | Quickfix list |
| `<leader>xl` | Normal | Location list |
| `<leader>xt` | Normal | Todo comments |
| `]t` | Normal | Next todo comment |
| `[t` | Normal | Previous todo comment |

### Folding — [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)

Modern folding powered by LSP with indent as fallback.

| Key | Mode | Description |
|-----|------|-------------|
| `zR` | Normal | Open all folds |
| `zM` | Normal | Close all folds |
| `zr` | Normal | Open folds by level |
| `zm` | Normal | Close folds by level |
| `zK` | Normal | Peek fold under cursor |

### Motion — [leap.nvim](https://codeberg.org/andyg/leap.nvim)

Fast cursor movement by searching for 2-character sequences.

| Key | Mode | Description |
|-----|------|-------------|
| `s` | Normal, Visual, Operator | Leap forward |
| `S` | Normal | Leap from window |

### Treesitter Text Objects — [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)

Syntax-aware text objects, selections, swaps, and movements.

**Selection (Visual/Operator):**

| Key | Description |
|-----|-------------|
| `a=` / `i=` / `l=` / `r=` | Assignment (outer / inner / lhs / rhs) |
| `a:` / `i:` / `l:` / `r:` | Object property (outer / inner / lhs / rhs) |
| `aa` / `ia` | Parameter/argument (outer / inner) |
| `ai` / `ii` | Conditional (outer / inner) |
| `al` / `il` | Loop (outer / inner) |
| `af` / `if` | Function call (outer / inner) |
| `am` / `im` | Method/function definition (outer / inner) |
| `ac` / `ic` | Class (outer / inner) |

**Swap:**

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>na` | Normal | Swap parameter with next |
| `<leader>n:` | Normal | Swap property with next |
| `<leader>nm` | Normal | Swap function with next |
| `<leader>pa` | Normal | Swap parameter with previous |
| `<leader>p:` | Normal | Swap property with previous |
| `<leader>pm` | Normal | Swap function with previous |

**Move (next/previous):**

| Key | Description |
|-----|-------------|
| `]f` / `[f` | Function call start |
| `]m` / `[m` | Method/function def start |
| `]c` / `[c` | Class start |
| `]i` / `[i` | Conditional start |
| `]l` / `[l` | Loop start |
| `]F` / `[F` | Function call end |
| `]M` / `[M` | Method/function def end |
| `]C` / `[C` | Class end |
| `]I` / `[I` | Conditional end |
| `]L` / `[L` | Loop end |
| `]s` / `[s` | Scope |
| `]z` / `[z` | Fold |
| `;` / `,` | Repeat last move / opposite direction |

### Surround — [nvim-surround](https://github.com/kylechui/nvim-surround)

Add, change, and delete surrounding pairs.

| Key | Mode | Description |
|-----|------|-------------|
| `ys{motion}{char}` | Normal | Add surrounding |
| `ds{char}` | Normal | Delete surrounding |
| `cs{old}{new}` | Normal | Change surrounding |

### Multi-Cursor — [vim-visual-multi](https://github.com/mg979/vim-visual-multi)

Multiple cursor editing (uses plugin defaults).

| Key | Mode | Description |
|-----|------|-------------|
| `<C-n>` | Normal | Select word / add next occurrence |
| `<C-Up/Down>` | Normal | Add cursor above/below |

### Commenting — [Comment.nvim](https://github.com/numToStr/Comment.nvim)

Context-aware commenting with treesitter support for JSX/TSX/Svelte/HTML.

| Key | Mode | Description |
|-----|------|-------------|
| `gcc` | Normal | Toggle line comment |
| `gbc` | Normal | Toggle block comment |
| `gc` | Visual | Toggle line comment on selection |
| `gb` | Visual | Toggle block comment on selection |

### Auto Pairs — [nvim-autopairs](https://github.com/windwp/nvim-autopairs)

Automatically closes brackets, quotes, and other pairs. Treesitter-aware, integrated with nvim-cmp.

### Auto Tag — [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)

Automatically closes and renames HTML/JSX tags using treesitter.

### Color Preview — [nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua)

Displays inline color previews for CSS colors, hex codes, and Tailwind classes. Enabled for all filetypes with `names = false` to avoid false positives.

### Statusline — [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

Custom statusline with mode-dependent colors showing encoding, file format, filetype, and lazy.nvim plugin update status.

### Theme — [catppuccin](https://github.com/catppuccin/nvim)

Catppuccin color scheme (dark mode).

### Which-Key — [which-key.nvim](https://github.com/folke/which-key.nvim)

Displays available keybindings in a popup after pressing a key prefix. Timeout: 500ms.

### Navigation — [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)

Seamless navigation between Neovim splits and tmux panes using `<C-h/j/k/l>`.

---

## Mason — Installed Tools

Managed by [mason.nvim](https://github.com/mason-org/mason.nvim) with auto-install via [mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim).

| Tool | Purpose |
|------|---------|
| prettier | JS/TS/HTML/CSS/JSON/YAML/Markdown formatter |
| stylua | Lua formatter |
| isort | Python import sorter |
| black | Python formatter |
| pylint | Python linter |
| eslint_d | JS/TS linter (daemon) |
| ruff | Python linter |
| js-debug-adapter | JS/TS debug adapter |
| debugpy | Python debug adapter |
| delve | Go debug adapter |

LSP servers are managed separately via [mason-lspconfig](https://github.com/mason-org/mason-lspconfig.nvim).

## Treesitter Parsers

Auto-installed: json, javascript, typescript, tsx, yaml, html, css, graphql, svelte, liquid, prisma, dockerfile, gitignore, markdown, markdown_inline, bash, lua, vim, vimdoc, query, c.

## Structure

```
lua/nathan/
  core/
    init.lua          -- Loads core modules
    keymaps.lua       -- Global keymaps
    options.lua       -- Editor options
  plugins/
    autotag.lua       -- nvim-ts-autotag
    autopairs.lua     -- nvim-autopairs
    colorizer.lua     -- nvim-colorizer
    colorscheme.lua   -- catppuccin theme
    comment.lua       -- Comment.nvim
    dap.lua           -- nvim-dap + dap-ui
    formatting.lua    -- conform.nvim
    gitsigns.lua      -- gitsigns.nvim
    leap.lua          -- leap.nvim
    linting.lua       -- nvim-lint
    lualine.lua       -- lualine.nvim
    neotest.lua       -- neotest
    nvim-cmp.lua      -- nvim-cmp + LuaSnip
    nvim-surround.lua -- nvim-surround
    nvim-ufo.lua      -- nvim-ufo
    snacks.lua        -- snacks.nvim
    todo-comments.lua -- todo-comments.nvim
    treesitter.lua    -- nvim-treesitter
    trouble.lua       -- trouble.nvim
    vim-visual-multi.lua -- vim-visual-multi
    which-key.lua     -- which-key.nvim
    lsp/
      lspconfig.lua   -- nvim-lspconfig
      mason.lua       -- mason.nvim + mason-tool-installer
      mason-lspconfig.lua -- mason-lspconfig
```

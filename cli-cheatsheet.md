# CLI Tools Cheatsheet

## eza - Modern `ls` replacement

```bash
# Basic listing (aliased to ls)
ls                          # List files with color
ls -l                       # Long format with details
ls -la                      # Long format including hidden files
ls -T                       # Tree view
ls -T -L 2                  # Tree view, max depth 2
ls --icons                  # Show file type icons
ls -l --git                 # Show git status per file
ls -l --header              # Show column headers
ls -l -s size               # Sort by size
ls -l -s modified           # Sort by modification time
ls -l --no-user --no-time   # Compact long listing
ls --group-directories-first  # Directories first
```

## bat - Modern `cat` replacement

```bash
bat file.txt                # Display file with syntax highlighting
bat -n file.txt             # Show line numbers only (no decorations)
bat -p file.txt             # Plain output (no line numbers or header)
bat -l python script        # Force a specific language
bat --diff file.txt         # Show only lines that differ from git index
bat -r 10:20 file.txt       # Show only lines 10-20
bat file1.txt file2.txt     # Concatenate multiple files
bat --list-themes           # List available color themes
command | bat -l json        # Pipe output with syntax highlighting
```

## fd - Modern `find` replacement

```bash
fd pattern                  # Find files matching pattern (recursive)
fd -e py                    # Find all .py files
fd -e py function           # Find .py files with "function" in the name
fd -H pattern               # Include hidden files
fd -t f pattern             # Files only
fd -t d pattern             # Directories only
fd -x command {}            # Execute command on each result
fd -e log -E node_modules   # Exclude directories
fd -d 2 pattern             # Limit depth to 2 levels
fd -S +1m                   # Files larger than 1MB
fd --changed-within 1d      # Files changed in the last day
```

## rg (ripgrep) - Modern `grep` replacement

```bash
rg pattern                  # Search file contents recursively
rg -i pattern               # Case-insensitive search
rg -w pattern               # Match whole words only
rg -l pattern               # List files with matches only
rg -c pattern               # Count matches per file
rg -t py pattern            # Search only in Python files
rg -T js pattern            # Exclude JavaScript files
rg -g '*.toml' pattern      # Search files matching glob
rg -A 3 -B 3 pattern        # Show 3 lines of context around matches
rg -e pattern1 -e pattern2  # Search multiple patterns (OR)
rg --replace new old        # Preview replacements
rg -F 'literal.string'      # Fixed string (no regex)
rg --json pattern           # Output as JSON
```

## fzf - Fuzzy finder

```bash
fzf                         # Interactive file finder
command | fzf               # Pipe any list into fuzzy finder
fzf --preview 'bat {}'      # Preview files while selecting
fzf -m                      # Multi-select (Tab to select)
fzf -q "query"              # Start with a query
rg -l pattern | fzf --preview 'bat {}'  # Search then browse results

# Useful combos
cd $(fd -t d | fzf)         # Fuzzy cd into directory
nvim $(fzf)                 # Fuzzy open file in neovim
kill -9 $(ps aux | fzf | awk '{print $2}')  # Fuzzy kill process

# Keybindings (if configured)
# Ctrl+T  - Paste selected file path
# Ctrl+R  - Search command history
# Alt+C   - cd into selected directory
```

## zoxide - Smarter `cd`

```bash
z dirname                   # Jump to best matching directory
z foo bar                   # Jump to dir matching both "foo" and "bar"
zi                          # Interactive selection with fzf
z -                         # Jump to previous directory
zoxide query dirname        # Show what z would resolve to
zoxide query -l             # List all tracked directories by rank
zoxide edit                 # Open the database for editing
```

## delta - Git diff viewer

delta is configured as a git pager automatically.

```bash
diff file1 file2 | delta    # Pretty diff of two files
git diff                    # Automatically uses delta
git log -p                  # Commit diffs with delta
git show HEAD               # Show last commit with delta
delta --side-by-side        # Side-by-side diff
```

## lazygit - Terminal UI for git

```bash
lazygit                     # Open interactive git UI
lazygit -f /path/to/repo    # Open for a specific repo
lazygit log                 # Open directly to log view
```

Key navigation inside lazygit:
- `1-5` - Switch panels (Status, Files, Branches, Commits, Stash)
- `Space` - Stage/unstage file
- `c` - Commit
- `p` - Push
- `P` - Pull
- `?` - Help

## gh - GitHub CLI

```bash
# Repos
gh repo clone owner/repo    # Clone a repository
gh repo view                # View repo details
gh browse                   # Open repo in browser

# Pull requests
gh pr create                # Create a pull request
gh pr list                  # List open PRs
gh pr view 123              # View PR details
gh pr checkout 123          # Checkout a PR locally
gh pr merge 123             # Merge a PR
gh pr diff 123              # View PR diff
gh pr checks 123            # View CI status

# Issues
gh issue create             # Create an issue
gh issue list               # List open issues
gh issue view 123           # View issue details

# Actions
gh run list                 # List recent workflow runs
gh run view 12345           # View run details
gh run watch 12345          # Watch a run in progress
```

## jq - JSON processor

```bash
cat data.json | jq '.'              # Pretty-print JSON
jq '.key' file.json                 # Extract a key
jq '.items[]' file.json             # Iterate array elements
jq '.items[] | .name' file.json     # Extract field from each element
jq '.items | length' file.json      # Count array elements
jq 'select(.age > 30)' file.json    # Filter objects
jq -r '.name' file.json             # Raw output (no quotes)
jq -s '.' file1.json file2.json     # Slurp multiple files into array
jq '.key = "value"' file.json       # Set a key
jq 'keys' file.json                 # List object keys
```

## yq - YAML/XML/TOML processor

```bash
yq '.' file.yaml                    # Pretty-print YAML
yq '.key' file.yaml                 # Extract a key
yq '.items[0].name' file.yaml       # Nested access
yq -o json file.yaml                # Convert YAML to JSON
yq -p json -o yaml file.json        # Convert JSON to YAML
yq '.key = "value"' -i file.yaml    # Edit in place
```

## tmux - Terminal multiplexer

```bash
tmux                        # Start new session
tmux new -s name            # Start named session
tmux ls                     # List sessions
tmux a -t name              # Attach to named session
tmux kill-session -t name   # Kill a session
```

Key bindings (default prefix: `Ctrl+b`):
- `c` - New window
- `n` / `p` - Next/previous window
- `%` - Vertical split
- `"` - Horizontal split
- Arrow keys - Navigate panes
- `d` - Detach
- `[` - Scroll mode (q to exit)
- `z` - Toggle pane zoom
- `x` - Kill pane

## btop - System monitor

```bash
btop                        # Launch system monitor
```

Navigation inside btop:
- `1` - CPU, `2` - Memory, `3` - Network, `4` - Processes
- `f` - Filter processes
- `k` - Kill selected process
- `Esc` - Back/menu

## nvim - Neovim

```bash
nvim file.txt               # Open a file
nvim +42 file.txt           # Open at line 42
nvim +/pattern file.txt     # Open and search for pattern
nvim -d file1 file2         # Diff mode
nvim -R file.txt            # Read-only mode
```

## starship - Shell prompt

Starship is your prompt theme. Configure it via `~/.config/starship.toml`.

```bash
starship preset             # List available presets
starship explain            # Explain current prompt modules
starship timings            # Show module render times
```

## Useful Combinations

```bash
# Find and edit files matching a pattern
nvim $(fd -e py | fzf --preview 'bat --color=always {}')

# Search contents, browse matches, open in editor
rg -l pattern | fzf --preview 'rg --color=always pattern {}' | xargs nvim

# Interactive git log with diff preview
git log --oneline | fzf --preview 'git show {1} | delta'

# Find large files
fd -t f -S +10m -x ls -lh {}

# Pretty-print any JSON API response
curl -s https://api.example.com/data | jq '.' | bat -l json

# Monitor file changes in a project
fd -e py --changed-within 5m
```

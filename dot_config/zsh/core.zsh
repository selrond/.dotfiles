# Core shell helpers and shortcuts.

# Reload zsh config in the current shell.
# Example: reloadzsh
reloadzsh() {
  source ~/.zshrc && echo "zsh config reloaded"
}

# Create a directory and enter it.
# Example: mkcd ~/code/scratch
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Alias-like helper to create and enter a directory.
# Example: take ~/tmp/demo
take() {
  mkdir -p "$1" && cd "$1"
}

# Change directory to the parent of a file path.
# Example: cdf ~/.config/zsh/core.zsh
cdf() {
  cd "$(dirname "$1")"
}

# Copy a file's content to clipboard.
# Example: copyfile ~/.ssh/id_ed25519.pub
copyfile() {
  pbcopy < "$1"
}

# Write clipboard content into a file.
# Example: pastefile /tmp/clipboard.txt
pastefile() {
  pbpaste > "$1"
}

# Go up one directory.
alias ..='cd ..'
# Go up two directories.
alias ...='cd ../..'
# Clear terminal screen.
alias c='clear'

# Reload shell configuration function shortcut.
alias rz='reloadzsh'
# Alternative reload shell shortcut.
alias reload='reloadzsh'

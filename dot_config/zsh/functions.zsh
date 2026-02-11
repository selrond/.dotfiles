# User shell functions
# Loaded from ~/.zshrc before aliases

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
# Example: cdf ~/.config/zsh/functions.zsh
cdf() {
  cd "$(dirname "$1")"
}

# Show processes using a specific port.
# Example: port 3000
port() {
  lsof -nP -i :"$1"
}

# Gracefully kill process bound to a TCP port.
# Example: fkillport 3000
fkillport() {
  local pid
  pid="$(lsof -ti tcp:"$1")"
  if [[ -n "$pid" ]]; then
    kill "$pid"
  fi
}

# Print local LAN IP from common interfaces.
# Example: iplocal
iplocal() {
  ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null
}

# Flush macOS DNS caches.
# Example: flushdns
flushdns() {
  sudo dscacheutil -flushcache
  sudo killall -HUP mDNSResponder
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

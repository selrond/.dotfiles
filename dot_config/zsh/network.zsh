# Network helpers.

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

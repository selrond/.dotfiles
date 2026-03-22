# Docker aliases and helpers.

# Base Docker command shortcuts.
alias d='docker'
alias dc='docker compose'
alias dps='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"'
alias dpa='docker ps -a --format "table {{.Names}}\t{{.Image}}\t{{.Status}}"'
alias di='docker images'
alias dlog='docker logs -f'
alias dex='docker exec -it'
alias dinspect='docker inspect'
alias drm='docker rm'
alias drmi='docker rmi'
alias dstop='docker stop'
alias dstart='docker start'

# Docker Compose shortcuts.
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dcb='docker compose build'
alias dcl='docker compose logs -f'
alias dcr='docker compose restart'
alias dcps='docker compose ps'

# Cleanup helpers.
alias dprune='docker system prune'
alias dprunea='docker system prune -a --volumes'

# Exec into a container with a shell fallback.
# Example: dsh app
dsh() {
  docker exec -it "$1" sh -lc 'command -v bash >/dev/null && exec bash || exec sh'
}

# Tail recent logs from a container.
# Example: dlf app
dlf() {
  docker logs -f --tail=200 "$1"
}

# Remove all stopped containers.
# Example: drmc
drmc() {
  docker container prune -f
}

# Remove dangling images.
# Example: drmd
drmd() {
  docker image prune -f
}

# Stop and remove all containers.
# Example: dnuke
dnuke() {
  docker ps -aq | xargs -r docker rm -f
}

# Print a container IP.
# Example: dip app
dip() {
  docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$1"
}

# Open a shell in the first container matching a name fragment.
# Example: dssh web
dssh() {
  local container
  container="$(docker ps --format '{{.Names}}' | grep "$1" | head -n1)"
  [[ -n "$container" ]] && dsh "$container"
}

# Follow compose logs for one service.
# Example: dclf web
dclf() {
  docker compose logs -f --tail=200 "$1"
}

if command -v eza >/dev/null 2>&1; then
  # Use eza as the default ls replacement.
  alias ls='eza --group-directories-first --icons=auto'
  # List one entry per line.
  alias l='ls -1'
  # Long listing with sizes and git status.
  alias ll='ls -lh --git'
  # Include hidden files in long listing.
  alias la='ls -la'
  # Show a shallow tree view.
  alias lt='ls --tree --level=2'
  # Show a deeper tree view including hidden files.
  alias lta='ls --tree --level=3 -a'
else
  # Fallback long listing when eza is unavailable.
  alias ll='ls -lah'
  # Fallback listing including hidden files.
  alias la='ls -A'
fi

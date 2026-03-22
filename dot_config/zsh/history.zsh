# Keep 50k history entries in memory.
HISTSIZE=50000
# Persist up to 50k history entries on disk.
SAVEHIST=50000
# Store history in XDG state path.
HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"

# Append history instead of overwriting file on shell exit.
setopt APPEND_HISTORY
# Write each command to history immediately.
setopt INC_APPEND_HISTORY
# Keep newest duplicate and drop older duplicates.
setopt HIST_IGNORE_ALL_DUPS
# Skip commands that start with a space.
setopt HIST_IGNORE_SPACE
# Collapse extra whitespace in saved history commands.
setopt HIST_REDUCE_BLANKS
# Use safer file locking for shared history writes.
setopt HIST_FCNTL_LOCK

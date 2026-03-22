# Prevent accidental overwrite with plain ">" redirection.
setopt NO_CLOBBER
# Make pipelines fail if any command in the pipeline fails.
setopt PIPE_FAIL
# Allow entering a directory name to cd into it.
setopt AUTO_CD

# Use interactive menu selection for completions.
zstyle ':completion:*' menu select
# Make completion matching case-insensitive.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

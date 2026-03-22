# Activate mise shims and environment variables for the current shell.
eval "$(mise activate zsh)"

# Enable zoxide smart directory jumping.
eval "$(zoxide init zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

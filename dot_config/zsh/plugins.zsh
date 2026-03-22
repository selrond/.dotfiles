# Load the Antidote plugin manager installed by Homebrew.
source "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"

# Load plugins listed in `${ZDOTDIR:-~}/.zsh_plugins.txt`.
antidote load

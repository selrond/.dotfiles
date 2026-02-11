# User aliases loader
# Loaded from ~/.zshrc

# Source domain files in a stable explicit order.
_zsh_aliases_dir="${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliases.d"
source "$_zsh_aliases_dir/core.zsh"
source "$_zsh_aliases_dir/ls.zsh"
source "$_zsh_aliases_dir/git.zsh"
source "$_zsh_aliases_dir/editor.zsh"
source "$_zsh_aliases_dir/macos.zsh"
source "$_zsh_aliases_dir/homebrew.zsh"
source "$_zsh_aliases_dir/network.zsh"
unset _zsh_aliases_dir

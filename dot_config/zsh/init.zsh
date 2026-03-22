# Resolve the XDG zsh config directory once for explicit ordered loading.
_zsh_config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

# Load prompt setup first for instant prompt support.
source "${_zsh_config_dir}/prompt.zsh"
# Load plugin manager and plugin list.
source "${_zsh_config_dir}/plugins.zsh"
# Load runtime integrations such as mise and zoxide.
source "${_zsh_config_dir}/runtime.zsh"
# Load shell history settings.
source "${_zsh_config_dir}/history.zsh"
# Load shell options and completion behavior.
source "${_zsh_config_dir}/completion.zsh"
# Load CLI-specific aliases and helpers.
source "${_zsh_config_dir}/claude.zsh"
source "${_zsh_config_dir}/codex.zsh"
source "${_zsh_config_dir}/core.zsh"
source "${_zsh_config_dir}/docker.zsh"
source "${_zsh_config_dir}/editor.zsh"
source "${_zsh_config_dir}/git.zsh"
source "${_zsh_config_dir}/homebrew.zsh"
source "${_zsh_config_dir}/ls.zsh"
source "${_zsh_config_dir}/network.zsh"
unset _zsh_config_dir

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# [[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion

# Tell zsh to use "standard" path delimiters when moving across strigs
autoload -Uz compinit
compinit
autoload -Uz select-word-style
select-word-style bash

# nvm() {
#     unset -f nvm
#     export NVM_DIR=~/.nvm
#     [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#     nvm "$@"
# }

# node() {
#     unset -f node
#     export NVM_DIR=~/.nvm
#     [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#     node "$@"
# }

# npm() {
#     unset -f npm
#     export NVM_DIR=~/.nvm
#     [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#     npm "$@"
# }

# declare -a NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)

# NODE_GLOBALS+=("node")
# NODE_GLOBALS+=("nvm")

# load_nvm () {
#     export NVM_DIR=~/.nvm
#     [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# }

# for cmd in "${NODE_GLOBALS[@]}"; do
#     eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@ }"
# done

# # place this after nvm initialization!
# # Auto load correct node version based on `.nvmrc`
# autoload -U add-zsh-hook
# load-nvmrc() {
#   local node_version="$(nvm version)"
#   local nvmrc_path="$(nvm_find_nvmrc)"

#   if [ -n "$nvmrc_path" ]; then
#     local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

#     if [ "$nvmrc_node_version" = "N/A" ]; then
#       nvm install
#     elif [ "$nvmrc_node_version" != "$node_version" ]; then
#       nvm use
#     fi
#   elif [ "$node_version" != "$(nvm version default)" ]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc

source <(antibody init)

antibody bundle romkatv/powerlevel10k
antibody bundle zsh-users/zsh-completions
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zdharma/fast-syntax-highlighting
antibody bundle zsh-users/zsh-history-substring-search

export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true
# export NVM_NO_USE=true
export NVM_AUTO_USE=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('code', 'c', 'code-insiders', 'ci', 'subl', 'gittower', 'zoxide')
antibody bundle lukechilds/zsh-nvm

antibody bundle lukechilds/zsh-better-npm-completion
antibody bundle buonomo/yarn-completion
antibody bundle MichaelAquilina/zsh-you-should-use
antibody bundle docker/cli path:contrib/completion/zsh kind:fpath
antibody bundle docker/compose path:contrib/completion/zsh kind:fpath
antibody bundle docker/machine path:contrib/completion/zsh kind:fpath
compinit
antibody bundle "
  robbyrussell/oh-my-zsh path:plugins/git
  robbyrussell/oh-my-zsh path:plugins/github
  robbyrussell/oh-my-zsh path:plugins/wp-cli
"

HOMEBREW_NO_INSTALL_CLEANUP=true

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# zsh-completions https://github.com/zsh-users/zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTORY_IGNORE=('g commit *')

setopt hist_ignore_space
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell

setopt auto_cd # cd by typing directory name if it's not a command
# setopt correct_all # autocorrect commands

setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

eval "$(zoxide init zsh)"

export BAT_CONFIG_PATH=~/.batrc

source /Users/selrond/Library/Preferences/org.dystroy.broot/launcher/bash/br

export PATH="/usr/local/sbin:$PATH"

source ~/.aliases
source ~/.functions

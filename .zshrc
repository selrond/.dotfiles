# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Homebrew completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

autoload -Uz compinit && compinit
# Tell zsh to use "standard" path delimiters when moving across strigs
autoload -Uz select-word-style
select-word-style bash

export ANTIDOTE_HOME=~/.antidote

source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load

# source ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# zsh-completions https://github.com/zsh-users/zsh-completions
# fpath=(~/.zsh/plugins/zsh-completions/src $fpath)
# source ~/.zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
# source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


HOMEBREW_NO_INSTALL_CLEANUP=true

# [Schniz/fnm: 🚀 Fast and simple Node.js version manager, built in Rust](https://github.com/Schniz/fnm "Schniz/fnm: 🚀 Fast and simple Node.js version manager, built in Rust")
eval "$(fnm env --use-on-cd)"

# compinit -i

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

# setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

# zstyle ':completion:*' menu select # select completions with arrow keys
# zstyle ':completion:*' group-name '' # group results by category
# zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

# Bind vertical arrows for history substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

eval "$(zoxide init zsh)"

export BAT_CONFIG_PATH=~/.batrc

# export PATH="/usr/local/sbin:$PATH"

# [Terminal Shell Integration in Visual Studio Code](https://code.visualstudio.com/docs/terminal/shell-integration#_manual-installation "Terminal Shell Integration in Visual Studio Code")
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

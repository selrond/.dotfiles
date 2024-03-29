#!/bin/bash

# General

alias python="/opt/homebrew/bin/python3"
alias pip="/opt/homebrew/bin/pip3"

alias vim="nvim"
alias vi="nvim"
alias v="nvim"

alias l='exa --long --header --all --git --icons --group-directories-first'
alias lt='l --tree --level=2'

alias cat="bat --theme="TwoDark" --map-syntax='js:jsx'"

alias d='cd ~/Desktop'

alias reload='. ~/.zshrc'

# Updating

## Update brew
alias brewup="brew update; brew upgrade; brew cleanup; brew doctor"

alias brew-backup="brew bundle dump --force --file=\"~/.dotfiles/Brewfile\""

## Update global npm packages
alias npmup="fnm use system && npm update -g"

## Update zsh plugins
alias update-zsh-plugins="antidote update"

alias allup="update-zsh-plugins && echo 'Zsh plgins updated' || 'Updating zsh plugins failed...'; brewup && echo 'Updating homebrew done!' || echo 'Updating homebrew failed...'; npmup && echo 'Updating npm done!' || echo 'Updating npm failed...'"

# Network
## Restart Wi-Fi
alias wifirestart="sudo ifconfig en0 down && sudo ifconfig en0 up"
## View MAC address
alias macview="ifconfig en0 | grep ether"
## Set random MAC address and restart Wi-Fi
alias macrandom="openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//' | xargs sudo ifconfig en0 ether && wifirestart"
## Your MAC Address resets aoutomatically upon restart. You can reset it manually though:
## alias macreset="sudo ifconfig en0 ether <your-original-mac-address>"

# youtube-dl
## Download individual YouTube video / videos
alias ydv="youtube-dl --output '%(title)s-%(id)s-%(resolution)s.%(ext)s' --format bestvideo+bestaudio"
## Download numbered YouTube video playlist
alias ydvp="youtube-dl --output '%(playlist_index)s-%(title)s-%(id)s-%(resolution)s.%(ext)s' --format 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 --ignore-errors"
## Download & convert individual YouTube video / videos to mp3 file / files
alias yda="youtube-dl --output '%(title)s-%(id)s-%(abr)dKBpS.%(ext)s' -x --audio-format=mp3 --add-metadata --audio-quality 0 --embed-thumbnail"
## Download & convert YouTube video to numbered mp3 playlist
alias ydap="youtube-dl --output '%(autonumber)s - %(title)s-%(id)s-%(abr)dKBpS.%(ext)s' --ignore-errors -x --audio-format=mp3 --add-metadata --audio-quality 0 --embed-thumbnail"

alias git="hub"

alias g="git"
alias gsub="git submodule"
alias lg="lazygit"

# Docker
alias dc="docker-compose"
alias dcrr="docker-compose run --rm"

# Development
alias ci="code-insiders"
alias c="code"

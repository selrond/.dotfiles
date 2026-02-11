if command -v nvim >/dev/null 2>&1; then
  # Open Neovim quickly.
  alias v='nvim'
  # Make vi open Neovim.
  alias vi='nvim'
  # Make vim open Neovim.
  alias vim='nvim'
  # Alternate shortcut for Neovim.
  alias nv='nvim'
  # Edit Neovim main config.
  alias nvc='nvim ~/.config/nvim/init.lua'
  # Jump to Neovim config directory.
  alias nvd='cd ~/.config/nvim'
else
  # Fallback vi shortcut.
  alias v='vim'
  # Keep vi usable without Neovim.
  alias vi='vim'
  # Fallback alternate shortcut.
  alias nv='vim'
fi

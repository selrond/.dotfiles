# .dotfiles

## Prerequisites

Required for shell startup:

- `zsh`
- Homebrew at `/opt/homebrew/bin/brew`
- `antidote`
- `mise`
- `zoxide`
- `fzf`

Installed plugins are defined in `~/.zsh_plugins.txt` and loaded through Antidote.

## Install

Base dependencies on macOS:

```sh
brew install antidote mise zoxide fzf
```

Shared zsh configuration is loaded from `~/.config/zsh/init.zsh`.

`~/.zshrc` should stay minimal and source the shared entrypoint:

```zsh
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/init.zsh"
```

Machine-specific additions can stay below that line in `~/.zshrc`.

## Apply

After applying with chezmoi, restart the shell:

```sh
exec zsh
```


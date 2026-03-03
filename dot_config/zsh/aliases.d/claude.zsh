# Claude Code aliases.
# `cc` enables the permission-bypass option, but does not auto-activate it.
alias cc='claude --allow-dangerously-skip-permissions'

# Safe interactive fallback without the bypass option.
alias ccs='claude'

# Continue the most recent conversation in the current directory.
alias ccc='cc -c'

# Print mode / one-shot queries.
alias ccp='cc -p'

# Script-friendly JSON output.
alias ccj='cc -p --output-format json'

# Resume a specific session by ID or name.
alias ccr='cc -r'

# Start in a git worktree session.
alias ccw='cc -w'

# CLI maintenance and account helpers.
alias ccu='claude update'
alias ccas='claude auth status'
alias ccal='claude auth login'
alias ccao='claude auth logout'
alias ccv='claude -v'

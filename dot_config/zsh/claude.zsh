# Claude Code aliases.

# Everyday interactive driver. `--allow-dangerously-skip-permissions` adds
# bypassPermissions to the Shift+Tab cycle but starts in the default mode,
# so the bypass is available without being active.
alias cc='claude --allow-dangerously-skip-permissions'

# Safe interactive fallback, without the bypass option in the cycle.
alias ccs='claude'

# Continue the most recent conversation in the current directory.
alias ccc='cc -c'

# Resume a specific session by ID/name, or open the interactive picker.
alias ccr='cc -r'

# Start in an isolated git worktree session.
alias ccw='cc -w'

# Print mode / one-shot queries. Headless has no Shift+Tab cycle, so the
# bypass flag from `cc` would be a no-op here and is intentionally omitted.
alias ccp='claude -p'

# Script-friendly JSON result for a one-shot query.
alias ccj='claude -p --output-format json'

# Full permission bypass (Claude's "yolo"; parity with codex `cxy`).
# `--dangerously-skip-permissions` == `--permission-mode bypassPermissions`.
# Compose with `-p` for autonomous headless runs: `ccy -p "..."`.
alias ccy='claude --dangerously-skip-permissions'

# CLI maintenance and account helpers.
alias ccu='claude update'
alias ccal='claude auth login'
alias ccas='claude auth status'
alias ccao='claude auth logout'
alias ccv='claude -v'

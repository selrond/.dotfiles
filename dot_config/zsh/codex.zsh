# Codex aliases.

# Default interactive run, low-friction local work.
# `--full-auto` was removed from the base command; the recommended combo is
# `--sandbox workspace-write` + `--ask-for-approval on-request`.
alias cx='codex --sandbox workspace-write --ask-for-approval on-request'

# Safe fallback with no preset automation flags.
alias cxs='codex'

# Interactive with live web search.
# `--search` = live web search instead of cached (a global flag, so it rides on `cx`).
alias cxw='cx --search'

# Non-interactive execute. `exec` does not accept `--ask-for-approval`, and
# global flags must follow the subcommand, so this can't reuse `cx`.
alias cxx='codex exec --sandbox workspace-write'

# Script-friendly JSON event stream.
# `--json` = newline-delimited JSON events for automation.
alias cxxj='codex exec --sandbox workspace-write --json'

# Resume interactive sessions (global flags follow the subcommand).
alias cxr='codex resume --sandbox workspace-write --ask-for-approval on-request'
# `--last` = resume the most recent session in the current directory.
alias cxrl='codex resume --last --sandbox workspace-write --ask-for-approval on-request'

# Authentication helpers.
alias cxl='codex login'
# `login status` exits 0 when authenticated.
alias cxls='codex login status'

# Dangerous shortcut.
# `--yolo` = bypass approvals and sandbox entirely.
alias cxy='codex --yolo'

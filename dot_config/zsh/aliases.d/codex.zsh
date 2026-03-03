# Codex aliases.

# Default interactive run.
# `--full-auto` = `--ask-for-approval on-request` + `--sandbox workspace-write`.
alias cx='codex --full-auto'

# Safe fallback with no preset automation flags.
alias cxs='codex'

# Interactive with live web search.
# `--search` = live web search instead of cached.
alias cxw='cx --search'

# Non-interactive execute (inherits `--full-auto` from `cx`).
alias cxx='cx exec'

# Script-friendly JSON event stream.
# `--json` = newline-delimited JSON events for automation.
alias cxxj='cx exec --json'

# Resume interactive sessions.
alias cxr='cx resume'
# `--last` = resume the most recent session in the current directory.
alias cxrl='cx resume --last'

# Authentication helpers.
alias cxl='codex login'
# `login status` exits 0 when authenticated.
alias cxls='codex login status'

# Dangerous shortcut.
# `--yolo` = bypass approvals and sandbox entirely.
alias cxy='codex --yolo'

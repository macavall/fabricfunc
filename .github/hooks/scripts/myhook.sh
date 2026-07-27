#!/usr/bin/env bash
# myhook - sessionStart hook
#
# Runs when a Copilot agent session starts. It logs the event and injects the
# current git branch into the session as additionalContext.
#
# Contract:
#   stdin : JSON payload describing the sessionStart event
#   stdout: JSON with an "additionalContext" field (injected into the session)
#   exit 0: success (non-zero would signal hook failure)
set -euo pipefail

# Read the event payload (unused here, but available for customization).
payload="$(cat || true)"

log_dir="./.github/hooks/logs"
mkdir -p "$log_dir"
printf '%s myhook: session started\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)" >> "$log_dir/myhook.log"

# Determine the current git branch, if this is a git repository.
branch="unknown"
if command -v git >/dev/null 2>&1 && git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo unknown)"
fi

# Emit context that Copilot injects into the session conversation.
printf '{"additionalContext":"Current git branch: %s"}\n' "$branch"

exit 0

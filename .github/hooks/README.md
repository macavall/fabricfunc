---
name: 'myhook'
description: 'sessionStart hook that logs the session and injects the current git branch as context'
tags: ['logging', 'session', 'context']
---

# myhook

A starter [GitHub Copilot hook](https://docs.github.com/en/copilot/how-tos/use-copilot-agents/coding-agent/use-hooks) that runs on the `sessionStart` event.

On each session start it:

1. Appends a timestamped line to `.github/hooks/logs/myhook.log`.
2. Injects the current git branch into the session via `additionalContext`.

## Files

| File | Purpose |
| ---- | ------- |
| `myhook.json` | Hook configuration (event + command mapping). |
| `scripts/myhook.sh` | Bash implementation (Unix / macOS / Git Bash). |
| `scripts/myhook.ps1` | PowerShell implementation (Windows). |

## Customize

- **Change the event**: edit the key under `hooks` in [myhook.json](myhook.json) — supported events include
  `sessionStart`, `sessionEnd`, `userPromptSubmitted`, `preToolUse`, `postToolUse`.
- **Change the behavior**: edit the scripts under [scripts/](scripts). The event payload is available on `stdin`.
- Only `sessionStart`, `userPromptSubmitted`, and `preToolUse` parse `stdout` — for other events, remove the
  `additionalContext` output.

## Enable

On Unix-like systems, make the script executable and commit it:

```bash
chmod +x .github/hooks/scripts/myhook.sh
```

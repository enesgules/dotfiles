#!/bin/sh
# Symlink this repo into place. Safe to re-run.
set -e
D="$(cd "$(dirname "$0")" && pwd)"
GHOSTTY="$HOME/Library/Application Support/com.mitchellh.ghostty"
mkdir -p ~/.claude/skills ~/.codex ~/.agents "$GHOSTTY"

ln -sfn "$D/AGENTS.md" ~/.claude/CLAUDE.md
ln -sfn "$D/AGENTS.md" ~/.codex/AGENTS.md
for s in "$D"/skills/*/; do
  s="${s%/}"; rm -rf ~/.claude/skills/"$(basename "$s")"; ln -sfn "$s" ~/.claude/skills/
done
ln -sfn "$D/skill-lock.json" ~/.agents/.skill-lock.json
ln -sfn "$D/ghostty/config" "$GHOSTTY/config"

# third-party skills are not vendored; restore them from the lock file
command -v npx >/dev/null && npx -y skills install >/dev/null 2>&1 || true

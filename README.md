# dotfiles

AI agent config and terminal config, symlinked into place.

    git clone https://github.com/enesgules/dotfiles ~/dotfiles && ~/dotfiles/install.sh

- `AGENTS.md` — global rules, linked as `~/.claude/CLAUDE.md` and `~/.codex/AGENTS.md`
- `rules/` — Claude Code rules
- `skills/` — skills I wrote. Third-party skills are listed in `skill-lock.json` and restored by `install.sh`
- `agents/` — Claude Code subagents
- `claude/settings.json` — Claude Code settings and hooks
- `ghostty/config` — Ghostty terminal

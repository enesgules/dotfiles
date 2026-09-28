# dotfiles

AI agent config and terminal config, symlinked into place.

    git clone https://github.com/enesgules/dotfiles ~/dotfiles && ~/dotfiles/install.sh

- `AGENTS.md` — global rules, linked as `~/.claude/CLAUDE.md` and `~/.codex/AGENTS.md`
- `skills/` — skills I wrote. Third-party skills are listed in `skill-lock.json` and restored by `install.sh`
- `ghostty/config` — Ghostty terminal

## Install one skill

    npx skills add enesgules/dotfiles --skill optimise-github-actions

- `optimise-github-actions` — measures what each GitHub Actions job really bills and how long CI takes, then cuts the waste without losing coverage

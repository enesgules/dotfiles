# dotfiles

AI agent config and terminal config, symlinked into place.

    git clone https://github.com/enesgules/dotfiles ~/dotfiles && ~/dotfiles/install.sh

- `AGENTS.md` — global rules, linked as `~/.claude/CLAUDE.md` and `~/.codex/AGENTS.md`
- `skills/` — skills I wrote. Third-party skills (also the Context7 ones from `upstash/context7`) are listed in `skill-lock.json` and installed again by `install.sh`. Add one with `npx skills add <owner/repo> -g -a claude-code codex -s <skill>`
- `ghostty/config` — Ghostty terminal
- `fish/config.fish` — fish shell, linked as `~/.config/fish/config.fish`

## Install one skill

`optimise-github-actions` measures what each GitHub Actions job bills and how long CI takes, then cuts the waste and keeps the checks that matter.

    npx skills add enesgules/dotfiles --skill optimise-github-actions

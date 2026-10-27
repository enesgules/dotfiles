# dotfiles

AI agent config and terminal config, symlinked into place.

    git clone https://github.com/enesgules/dotfiles ~/dotfiles && ~/dotfiles/install.sh

- `AGENTS.md` — global rules, linked as `~/.claude/CLAUDE.md` and `~/.codex/AGENTS.md`
- `skills/` — skills I wrote. Third-party skills (also the Context7 ones from `upstash/context7`) are listed in `skill-lock.json` and installed again by `install.sh`. Add one with `npx skills add <owner/repo> -g -a claude-code codex -s <skill>`
- `skills/personal-repos/` — shared guidance for the personal cloud environment and its repository-specific variable names. Project skills stay in their project repositories.
- `skills/x-post-drafting/` — drafts X posts for @abdushbag (value, build-in-public, launch, thread). The agent does not publish.
- `install-cloud-skills.sh` — installs a focused set of the dotfiles and third-party skills in Codex Cloud. Run it from the cloud environment's install script after checking out this repository.
- `ghostty/config` — Ghostty terminal
- `fish/config.fish` — fish shell, linked as `~/.config/fish/config.fish`
- `obs/` — OBS recording setup: 2560x1440 at 60 fps, mic chain Gain → EQ → Compressor → Limiter, "full cam" and "screen + cam" scenes, hotkeys Ctrl+Alt+R record, Ctrl+Alt+P pause, Ctrl+Alt+1/2 scenes. `install.sh` copies it into OBS and keeps an existing config. `obs/setup_rounded_cam.py` makes the rounded camera mask and lays out both scenes; run it with OBS closed. After a change in OBS, quit OBS and copy the files back:

      cp ~/Library/Application\ Support/obs-studio/basic/profiles/Untitled/basic.ini ~/dotfiles/obs/basic/profiles/Untitled/
      cp ~/Library/Application\ Support/obs-studio/basic/scenes/Untitled.json ~/dotfiles/obs/basic/scenes/

## Install one skill

`optimise-github-actions` measures what each GitHub Actions job bills and how long CI takes, then cuts the waste and keeps the checks that matter.

    npx skills add enesgules/dotfiles --skill optimise-github-actions

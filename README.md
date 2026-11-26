# dotfiles

Terminal and recording config, symlinked into place. Agent rules and skills are in [stack](https://github.com/enesgules/stack).

    git clone https://github.com/enesgules/dotfiles ~/dotfiles && ~/dotfiles/install.sh

- `ghostty/config` — Ghostty terminal
- `fish/config.fish` — fish shell, linked as `~/.config/fish/config.fish`
- `obs/` — OBS recording setup: 2560x1440 at 60 fps, mic chain Gain → EQ → Compressor → Limiter, "full cam" and "screen + cam" scenes, hotkeys Ctrl+Alt+R record, Ctrl+Alt+P pause, Ctrl+Alt+1/2 scenes. `install.sh` copies it into OBS and keeps an existing config. `obs/setup_rounded_cam.py` makes the rounded camera mask and lays out both scenes; run it with OBS closed. After a change in OBS, quit OBS and copy the files back:

      cp ~/Library/Application\ Support/obs-studio/basic/profiles/Untitled/basic.ini ~/dotfiles/obs/basic/profiles/Untitled/
      cp ~/Library/Application\ Support/obs-studio/basic/scenes/Untitled.json ~/dotfiles/obs/basic/scenes/

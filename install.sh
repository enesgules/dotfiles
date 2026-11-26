#!/bin/sh
# Symlink this repo into place. Safe to re-run. Agent rules and skills are in github.com/enesgules/stack.
set -e
D="$(cd "$(dirname "$0")" && pwd)"
GHOSTTY="$HOME/Library/Application Support/com.mitchellh.ghostty"
mkdir -p ~/.config/fish "$GHOSTTY"

ln -sfn "$D/ghostty/config" "$GHOSTTY/config"
ln -sfn "$D/fish/config.fish" ~/.config/fish/config.fish

# OBS replaces its files when it saves, which breaks symlinks, so copy. Existing config is kept.
OBS="$HOME/Library/Application Support/obs-studio"
mkdir -p "$OBS"
cp -Rn "$D/obs/basic" "$OBS/"

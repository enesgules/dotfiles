if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Hide user@hostname from prompt (only show on remote/SSH sessions)
functions -q prompt_login; and not functions -q prompt_login_original; and functions --copy prompt_login prompt_login_original
function prompt_login
    if set -q SSH_TTY
        prompt_login_original
    end
end

# Antigravity
fish_add_path ~/.antigravity/antigravity/bin

# Local binaries
fish_add_path ~/.local/bin

# opencode
fish_add_path ~/.opencode/bin

# Homebrew
fish_add_path /opt/homebrew/bin

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
fish_add_path $PNPM_HOME

if status is-interactive
    if not set -q NVIM
        neofetch
    end
end

# Hide the fish greeting
set fish_greeting ""

# Start starship
starship init fish | source

# Fish syntax highlighting
set -g fish_color_autosuggestion '555'  'brblack'
set -g fish_color_cancel -r
set -g fish_color_command --bold
set -g fish_color_comment red
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_end brmagenta
set -g fish_color_error brred
set -g fish_color_escape 'bryellow'  '--bold'
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator bryellow
set -g fish_color_param cyan
set -g fish_color_quote yellow
set -g fish_color_redirection brblue
set -g fish_color_search_match 'bryellow'  '--background=brblack'
set -g fish_color_selection 'white'  '--bold'  '--background=brblack'
set -g fish_color_user brgreen
set -g fish_color_valid_path --underline

# fzf setup
fzf --fish | source

# UV (Python)
source $HOME/.local/bin/env.fish

# Yazi
export EDITOR=nvim

# NVM
set -x NVM_DIR $HOME/.nvm
bass source $NVM_DIR/nvm.sh --no-use

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# OrbStack command-line tools and integration
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
set -gx PATH $PATH (go env GOPATH)/bin

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lucas/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/lucas/Downloads/google-cloud-sdk/path.fish.inc'; end

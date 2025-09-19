########################################
# ZSH CONFIGURATION
########################################

# --- Run neofetch only in interactive shells (but not inside Neovim) ---
if [[ $- == *i* && -z $NVIM ]]; then
    fastfetch
fi


########################################
# PROMPT + SHELL INITIALIZATION
########################################

# --- Starship prompt ---
eval "$(starship init zsh)"


########################################
# FZF INTEGRATION
########################################

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

########################################
# EDITOR SETTINGS
########################################

export EDITOR="nvim"


########################################
# NODE VERSION MANAGER (NVM)
########################################

export NVM_DIR="$HOME/.nvm"
# Load NVM if installed
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use


########################################
# YAZI FUNCTION (CD TO LAST DIR AFTER EXIT)
########################################

y() {
    local tmp
    tmp=$(mktemp -t "yazi-cwd.XXXXXX")
    yazi "$@" --cwd-file="$tmp"
    if [[ -s "$tmp" ]]; then
        local cwd
        cwd=$(<"$tmp")
        [[ -n "$cwd" && "$cwd" != "$PWD" ]] && cd "$cwd"
    fi
    rm -f -- "$tmp"
}


########################################
# ORBSTACK + GOPATH
########################################

# Load OrbStack integration if available
[ -f ~/.orbstack/shell/init2.zsh ] && source ~/.orbstack/shell/init2.zsh

# Add GOPATH/bin to PATH
if command -v go >/dev/null 2>&1; then
    export PATH="$PATH:$(go env GOPATH)/bin"
fi


########################################
# ALIASES & SHORT FUNCTIONS
########################################

# Git wrapper
alias g="git"

# eza (better ls)
alias l="eza -l"
alias ll="eza -l --all"
alias ls="eza"
alias lz="lazygit"

# nvim shortcut (open current directory by default)
n() {
    nvim "$@" .
}

# Tailscale shortcut
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

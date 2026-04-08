# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
# NOTE: $TERM should be set by the terminal emulator. It is not reliable to set
# it here.

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Environment variables
## Homebrew
_brew_paths=(
    "/home/linuxbrew/.linuxbrew/bin/brew"
    "/opt/homebrew/bin/brew"
    "/usr/local/bin/brew"
)
for brew_cmd in "${_brew_paths[@]}"; do
    if [[ -x "$brew_cmd" ]]; then
        eval "$($brew_cmd shellenv)"
        break
    fi
done
unset _brew_paths brew_cmd

# export PATH=/cuda_path/cuda_11.2/bin${PATH:+:${PATH}}
# export LD_LIBRARY_PATH=/cuda_path/cuda_11.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# Aliases
alias ll="ls -ahl"

# Functions
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    command yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}

# Bindkeys
bindkey -e  # Use Emacs keybindings

# Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Plugins
_ZSH_PLUGIN_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/plugins"

if [[ -f "$_ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    source "$_ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

if [[ -f "$_ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source "$_ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

unset _ZSH_PLUGIN_DIR

# Initializations
if command -v fzf &>/dev/null; then
    source <(fzf --zsh)
fi
if command -v starship &>/dev/null; then
    eval "$(starship init zsh)"
fi

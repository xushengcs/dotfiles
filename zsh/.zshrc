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
# export PATH=/cuda_path/cuda_11.2/bin${PATH:+:${PATH}}
# export LD_LIBRARY_PATH=/cuda_path/cuda_11.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# Aliases
alias ll="ls -ahl"

# Bindkeys
bindkey -e  # Use Emacs keybindings

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

# Plugins
if [[ -f ${XDG_DATA_HOME:-~/.local/share}/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source ${XDG_DATA_HOME:-~/.local/share}/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [[ -f ${XDG_DATA_HOME:-~/.local/share}/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source ${XDG_DATA_HOME:-~/.local/share}/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Starship
eval "$(starship init zsh)"

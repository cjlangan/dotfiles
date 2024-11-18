# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
# zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -U compinit && compinit

# Evaluations
eval $(dircolors -b)
eval "$(oh-my-posh init zsh)"
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
#eval "$(starship init zsh)"

# Keybindings
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

HISTSIZE=5000
HISTFILE=~/.histfile
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
#setopt correct_all


# Completion styling 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' fzf-bindings 'tab:accept'


# --------------------------------------------------
#                       EXPORTS
# --------------------------------------------------

export EDITOR=nvim
export PATH=~/.local/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=kde



export AI_PROVIDER=duckduckgo #tgpt provider



# --------------------------------------------------
#                        ALIASES
# --------------------------------------------------

alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias grep='grep --color=auto'

# Alias to sync ~/shared directory to ~/laptop-backup on home server
alias server-sync='rclone sync ~/shared server:laptop-backup --links -v --exclude "**/.git/**"'
alias open='xdg-open'
alias weather='curl wttr.in'
alias chatgpt='tgpt --provider duckduckgo -m'
alias aihelp='source /usr/local/bin/aihelp.sh'


# Alias to get directory of a file from fzf and cd's to it
cds() {
    cd ~
    local file dir
    file=$(fzf)
    dir=$(dirname "$file")
    cd "$dir"
}


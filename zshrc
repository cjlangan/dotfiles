# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Auto-start tmux if available, not already in tmux, not over SSH, and in GUI
# Also kill non default sessions
if command -v tmux >/dev/null 2>&1; then
  if [ -z "$TMUX" ] && [ -n "$DISPLAY" ] && [ -z "$SSH_TTY" ]; then
    clients=$(tmux list-sessions -F "#{session_name}:#{session_attached}" 2>/dev/null | awk -F: '$1 == "default" {print $2}')
    if [ -z "$clients" ]; then
      # default does not exist
      tmux new-session -s default
    elif [ "$clients" -eq 0 ]; then
      # default exists and is unattached
      tmux attach-session -t default
    else
      # default exists and is attached elsewhere
      # start a temporary session that dies when the terminal closes
      tmux new-session -s tmp-$$ \; set-option destroy-unattached on
    fi
    exit
  fi
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



# Telegram Exam reminder Bot Token and chat id
export BOT_TOKEN='hidden'
export CHAT_ID="hidden"
export BOOK_BOT='hidden'
export YT_API_KEY='hidden'
export PATH="$HOME/.cargo/bin:$PATH"
export OPENROUTER_API_KEY='hidden'



# --------------------------------------------------
#                        ALIASES
# --------------------------------------------------

alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias grep='grep --color=auto'

alias open='xdg-open'
alias weather='curl wttr.in'
alias chatgpt='tgpt --provider duckduckgo -m'
alias cds='cd && cd $(dirname $(fzf))'
alias vim='nvim'

# Alias to download a file using optimised settings for speed 
idm() {
    aria2c --file-allocation=none -c -x 10 -s 10 -d "$HOME/Downloads/" "$1"
}

# bun completions
[ -s "/home/connor/.bun/_bun" ] && source "/home/connor/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

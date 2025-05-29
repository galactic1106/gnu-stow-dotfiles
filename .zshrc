# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# initialize oh-my-posh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
# zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybinds
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey ";5~" delete-word
bindkey "^H" backward-delete-word


# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
# setopt globdots # show  hidden files by default
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
# zstyle ':completion:*' file-list true # more detailed list
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion


# Aliases
alias ls="eza --icons=always --color=always"
alias ll='eza -alF --icons=always --color=always'
alias la='eza -A --icons=always --color=always'
alias l='eza -GF --icons=always --color=always'
alias vi='nvim'
alias grep="/usr/bin/grep $GREP_OPTIONS"
alias mysql="mariadb"
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
# eval "$(zoxide init --cmd cd zsh)" 


# Created by `pipx` on 2024-11-04 22:41:35
export PATH="$PATH:/home/galactic1106/.local/bin"


# bun completions
[ -s "$HOME/.bun/_bun" ] && source "/home/galactic1106/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


# man highlighting
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"

export EDITOR=nvim

# set up yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# add composer binaries to path
export PATH=$PATH:~/.config/composer/vendor/bin

# source "$HOME/olicyber_venv/bin/activate"

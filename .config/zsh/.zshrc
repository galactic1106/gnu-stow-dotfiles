# source global shell alias & variables files
[ -f "$XDG_CONFIG_HOME/shell/alias" ] && source "$XDG_CONFIG_HOME/shell/alias"
[ -f "$XDG_CONFIG_HOME/shell/vars" ] && source "$XDG_CONFIG_HOME/shell/vars"

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
# eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"


zmodload zsh/complist
# load modules
autoload -Uz compinit
autoload -U colors && colors


# edit command line with vim
autoload -Uz edit-command-line
zle -N edit-command-line

bindkey -e
bindkey '^E' edit-command-line

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

# zinit snippet OMZP::archlinux
# zinit snippet OMZP::git
# zinit snippet OMZP::gh
# zinit snippet OMZP::sudo
# zinit snippet OMZP::mise
# zinit snippet OMZP::docker
# zinit snippet OMZP::docker-compose
# zinit snippet OMZP::podman
# zinit snippet OMZP::bun
zinit snippet OMZP::command-not-found
zinit snippet OMZP::common-aliases
# zinit snippet OMZP::composer
# zinit snippet OMZP::eza
# zinit snippet OMZP::golang
# zinit snippet OMZP::pip
# zinit snippet OMZP::pipenv
# zinit snippet OMZP::postgres
# zinit snippet OMZP::rust
# zinit snippet OMZP::ssh

compinit
zinit cdreplay -q

# Keybinds
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey -M emacs '^H' backward-kill-word
bindkey -M emacs '^[[3;5~' kill-word
bindkey "^P" up-history
bindkey "^N" down-history

# History
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh_history" # move histfile to cache
HISTCONTROL=ignoreboth # consecutive duplicates & commands starting with space are not saved
HISTDUP=erase
setopt hist_expire_dups_first # expire duplicate entries first when trimming history
setopt hist_find_no_dups # don't display duplicate entries in history
setopt hist_ignore_space # ignore commands starting with space
setopt hist_ignore_dups
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt hist_save_no_dups # don't save duplicate entries in history
setopt hist_verify # don't execute immediately upon history expansion
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances


# setopt autocd # type a dir to cd
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match # make cmp case insensitive
setopt extended_glob # match ~ # ^
setopt interactive_comments # allow comments in shell
unsetopt prompt_sp # don't autoclean blanklines

export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'


# Completion styling
# zstyle ':completion:*' file-list true # more detailed list
setopt MENU_COMPLETE
setopt globdots # show  hidden files by default
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Za-z}' # case-insensitive completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # colorize filenames
zstyle ':completion:*' menu no # disable menu completion for fzf-tab
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

# completions with ls
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath' # preview directory contents with cd
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath' # preview directory contents with zoxide
# completions with eza
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons=always --color=always --oneline $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --icons=always --color=always --oneline $realpath'

zstyle ':fzf-tab:*' use-fzf-default-opts yes # use FZF_DEFAULT_OPTS for fzf-tab
zstyle ':fzf-tab:*' fzf-flags --ignore-case
zstyle ':fzf-tab:*' switch-group '<' '>'

# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'

zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'

zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'

# Set up fzf key bindings and fuzzy completion
if [[ -x $(command -v fzf) ]]; then eval "$(fzf --zsh)"; fi


eval "$(zoxide init --cmd cd zsh)"
eval "$(mise activate zsh)"
eval "$(atuin init zsh --disable-up-arrow)"
eval "$(starship init zsh)"

source <(carapace _carapace)

# set up yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# =============================================================================
# 1. Source global shell alias & variables files
# =============================================================================
[ -f "$XDG_CONFIG_HOME/shell/alias" ] && source "$XDG_CONFIG_HOME/shell/alias"
[ -f "$XDG_CONFIG_HOME/shell/vars" ] && source "$XDG_CONFIG_HOME/shell/vars"

# =============================================================================
# 2. Zinit Setup
# =============================================================================
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# =============================================================================
# 3. Pre-Compinit Plugins (Must be loaded BEFORE compinit)
# =============================================================================
zinit light zsh-users/zsh-completions

# =============================================================================
# 4. Initialization & Compinit Speedhack
# =============================================================================
zmodload zsh/complist
autoload -Uz compinit
autoload -U colors && colors

# Only check for new completions once a day to speed up startup
if [[ -n $(find "${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump" -mtime +1 2>/dev/null) ]]; then
    compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump"
else
    compinit -C -d "${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump"
fi

# =============================================================================
# 5. Keybindings & Line Editor
# =============================================================================
autoload -Uz edit-command-line
zle -N edit-command-line

bindkey -e # Use emacs bindings in the terminal by default
bindkey '^E' edit-command-line
bindkey "^P" up-history
bindkey "^N" down-history

# =============================================================================
# 6. History Configuration
# =============================================================================
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh_history"
HISTDUP=erase
setopt hist_expire_dups_first          # expire duplicate entries first when trimming history
setopt hist_find_no_dups               # don't display duplicate entries in history
setopt hist_ignore_space               # ignore commands starting with space
setopt hist_ignore_dups
setopt hist_ignore_all_dups            # remove older duplicate entries from history
setopt hist_reduce_blanks              # remove superfluous blanks from history items
setopt hist_save_no_dups               # don't save duplicate entries in history
setopt hist_verify                     # don't execute immediately upon history expansion
setopt inc_append_history              # save history entries as soon as they are entered
setopt share_history                   # share history between different instances

# =============================================================================
# 7. General Zsh Options
# =============================================================================
setopt auto_param_slash    # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob        # make globbing case insensitive
setopt no_case_match       # make cmp case insensitive
setopt extended_glob       # match ~ # ^
setopt interactive_comments # allow comments in shell
unsetopt prompt_sp         # don't autoclean blanklines

# =============================================================================
# 8. Completion UI & Engine Setup
# =============================================================================
completion_ui='fzf-tab'      # options: 'fzf-tab', 'zsh'
completion_engine='carapace' # options: 'carapace', 'default'

# --- 8a. Global Completion Styles ---
setopt globdots
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompcache"
zstyle ':completion:*' completer _extensions _expand _complete _approximate
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes false
zstyle ':completion:*' verbose no # Disable descriptions to keep it clean

# Dynamic Match Highlighting: Highlight typed characters in Green (1;32)
zstyle -e ':completion:*:*' list-colors '
    if [[ -n $PREFIX ]]; then
        reply=("${(s.:.)LS_COLORS}" "=(#b)(${(q)PREFIX})(*)=0=1;32=0")
    else
        reply=("${(s.:.)LS_COLORS}")
    fi
'

# --- 8b. Engine Setup ---
if [[ "$completion_engine" == 'carapace' ]]; then
    if command -v carapace >/dev/null 2>&1; then
        export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense,cobra'

        # Tell Carapace to always include hidden files/dotfiles
        export CARAPACE_HIDDEN=2

        eval "$(carapace _carapace)"
    else
        print -P "%F{red}[Error] 'carapace' not found. Falling back to default zsh engine.%f"
    fi
fi

# --- 8c. UI Setup ---
if [[ "$completion_ui" == 'fzf-tab' ]]; then
    zinit light Aloxaf/fzf-tab
    zstyle ':completion:*' menu no
    zstyle ':fzf-tab:*' use-fzf-default-opts yes
    zstyle ':fzf-tab:*' fzf-flags --ignore-case

    # ---------------------------------------------------------------------
    # Foolproof fzf-tab Previews
    # ---------------------------------------------------------------------
    # This script safely detects if the completion item is a file or a dir,
    # tries eza/bat, and cleanly falls back to ls/cat without crashing.
    zstyle ':fzf-tab:complete:*:*' fzf-preview '
        FILE="${realpath:-$word}"
        if [ -d "$FILE" ]; then
            eza --icons=always --color=always --oneline "$FILE" 2>/dev/null || ls -A --color=always "$FILE"
        elif [ -f "$FILE" ]; then
            bat --color=always --style=numbers --line-range=:500 "$FILE" 2>/dev/null || cat "$FILE"
        fi
    '

    # Preview environment variables
    zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'

    # Preview systemd services
    zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

    # Better kill completion (shows process list)
    zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
    zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview 'ps --pid=$word -o cmd --no-headers -w -w'
    zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

else
    # Native zsh multi-column interactive fallback
    setopt MENU_COMPLETE
    zstyle ':completion:*' menu yes select interactive
fi

# =============================================================================
# 9. Post-Compinit Plugins (Loaded in Turbo Mode)
# =============================================================================
# Load heavy syntax highlighting in the background so prompt loads instantly
zinit wait lucid for \
    zsh-users/zsh-syntax-highlighting

zinit snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh
zinit cdreplay -q

# =============================================================================
# 10. Tool Initializations
# =============================================================================
eval "$(zoxide init --cmd cd zsh)"
eval "$(mise activate zsh)"
eval "$(starship init zsh)"

# 1. Initialize fzf first (Sets up Ctrl+T for files, and Ctrl+R for history)
if command -v fzf >/dev/null 2>&1; then
    # Force fzf's Ctrl+T to include hidden files (ignoring .git to keep it fast)
    export FZF_CTRL_T_COMMAND='find . -type f -not -path "*/\.git/*"'

    source <(fzf --zsh)
fi

# 2. Initialize Atuin SECOND (This safely overrides fzf's Ctrl+R with Atuin's UI)
eval "$(atuin init zsh --disable-up-arrow)"

# =============================================================================
# 11. Functions
# =============================================================================
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

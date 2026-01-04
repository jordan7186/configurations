# ~/.config/.zshrc

# ---- interactive-only guard ----
[[ -o interactive ]] || return

# ---- keep generated state OUT of the ~/.config git repo ----
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# Zsh history file (avoid ~/.config/.zsh_history if ZDOTDIR=~/.config)
export HISTFILE="$XDG_STATE_HOME/zsh/history"
mkdir -p "$(dirname "$HISTFILE")"

# ---- Zap bootstrap (plugin manager) ----
ZAP_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zap"
if [[ -r "$ZAP_DIR/zap.zsh" ]]; then
    source "$ZAP_DIR/zap.zsh"
else
    echo "Zap not found at $ZAP_DIR/zap.zsh (install zap first)"
fi

# ---- completions ----
autoload -Uz compinit
# Store compdump in cache (avoid polluting ~/.config)
COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"
mkdir -p "$(dirname "$COMPDUMP")"
compinit -d "$COMPDUMP"

# ---- fzf (binary) shell integration (completion + keybindings) ----
if command -v brew >/dev/null 2>&1; then
    FZF_BASE="$(brew --prefix)/opt/fzf"
    [[ -r "$FZF_BASE/shell/completion.zsh" ]] && source "$FZF_BASE/shell/completion.zsh"
    [[ -r "$FZF_BASE/shell/key-bindings.zsh" ]] && source "$FZF_BASE/shell/key-bindings.zsh"
fi

# ---- Zap-managed plugins ----
# Must load after compinit; before autosuggestions/highlighting
plug "Aloxaf/fzf-tab"

plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"

# ---- zoxide (binary) ----
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

# ---- prompt (starship) ----
eval "$(starship init zsh)"
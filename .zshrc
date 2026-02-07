# ~/.config/.zshrc

[[ -o interactive ]] || return

# ---- Zinit bootstrap  ----
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# ---- Keep generated state out of ~/.config (avoid git tracking) ----
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
mkdir -p "$(dirname "$HISTFILE")"

# ---- 1) zsh-completions  ----
# Zinit Wiki recommends blockf and running creinstall on update for completions.
zinit ice blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

# ---- 2) compinit  ----
autoload -Uz compinit
COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"
mkdir -p "$(dirname "$COMPDUMP")"
compinit -d "$COMPDUMP"

# ---- 3) fzf shell integration (optional but recommended) ----
if command -v brew >/dev/null 2>&1; then
  FZF_BASE="$(brew --prefix)/opt/fzf"
  [[ -r "$FZF_BASE/shell/completion.zsh" ]] && source "$FZF_BASE/shell/completion.zsh"
  [[ -r "$FZF_BASE/shell/key-bindings.zsh" ]] && source "$FZF_BASE/shell/key-bindings.zsh"
fi

# ---- 4) fzf-tab  ----
zinit light Aloxaf/fzf-tab
# fzf-tab load-order requirement :contentReference[oaicite:8]{index=8}

# ---- 5) autosuggestions ----
zinit light zsh-users/zsh-autosuggestions

# ---- 6) zoxide ----
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"

# ---- 7) prompt (starship) ----
eval "$(starship init zsh)"

# ---- 8) syntax highlighting  ----
# Documnet specifies this should be placed last
zinit light zsh-users/zsh-syntax-highlighting


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

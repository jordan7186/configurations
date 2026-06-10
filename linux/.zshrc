# ~/.zshrc (Linux)

[[ -o interactive ]] || return

# ---- Zinit bootstrap ----
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# ---- Keep generated state out of ~/.config ----
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
mkdir -p "$(dirname "$HISTFILE")"

# ---- 1) zsh-completions ----
zinit ice blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

# ---- 2) compinit ----
autoload -Uz compinit
COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"
mkdir -p "$(dirname "$COMPDUMP")"
compinit -d "$COMPDUMP"

# ---- 3) fzf shell integration ----
FZF_SHELL="$HOME/.local/share/fzf/shell"
[[ -r "$FZF_SHELL/completion.zsh" ]] && source "$FZF_SHELL/completion.zsh"
[[ -r "$FZF_SHELL/key-bindings.zsh" ]] && source "$FZF_SHELL/key-bindings.zsh"
unset FZF_SHELL

# ---- 4) fzf-tab ----
zinit light Aloxaf/fzf-tab

# ---- 5) autosuggestions ----
zinit light zsh-users/zsh-autosuggestions

# ---- 6) zoxide ----
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"

# ---- 7) prompt (starship) ----
eval "$(starship init zsh)"

# ---- 8) syntax highlighting (must be last) ----
zinit light zsh-users/zsh-syntax-highlighting

# ---- conda ----
__conda_setup="$("$HOME/miniconda3/bin/conda" 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
fi
unset __conda_setup

# ---- NVM ----
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ---- bun ----
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ---- Aliases ----
if command -v eza >/dev/null 2>&1; then
    alias ls='eza --icons'
    alias ll='eza -alF --icons --git'
    alias la='eza -a --icons'
    alias lt='eza --tree --icons --level=2'
fi
command -v bat >/dev/null 2>&1 && alias cat='bat --paging=never'

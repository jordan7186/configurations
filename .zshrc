# ~/.config/.zshrc

# ---- interactive-only guard (recommended) ----
[[ -o interactive ]] || return

# ---- completions (Homebrew docs reference compinit patterns) ----
autoload -Uz compinit
compinit

eval "$(starship init zsh)"
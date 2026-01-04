# A Personal Configuration Repository

This repo is intended to be cloned into `~/.config` and used as the “source of truth” for terminal + UI configs.
It includes a Zsh setup that uses **Zinit** for plugin management, while **Homebrew** installs the required binaries.

## What this repo tracks

Tracked in GitHub:
- `aerospace/`
- `borders/`
- `ghostty/`
- `sketchybar/`
- `.zprofile`
- `.zshrc`
- `.gitignore`
- `starship.toml`
- `README.md`

Not tracked:
- Zinit installation directory (`~/.local/share/zinit/...`)
- Homebrew installation (`/opt/homebrew` or `/usr/local`)
- Caches/state/history (should live under `~/.cache` / `~/.local/state`)
- App binaries (Ghostty, Aerospace, etc.)

Not included:
- Installation of zinit
- Installations via homebrew: `brew install starship fzf zoxide`
- This repo intentionally does not attempt to install GUI apps (Ghostty, Aerospace, etc.). Install those separately (e.g., via Homebrew casks or the project’s official installer)

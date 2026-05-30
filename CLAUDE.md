# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles repository for macOS (ARM). Configs are symlinked into `~/.config/` (XDG-compliant layout) — the repo lives at `~/.env` and symlinks are managed manually or via `stow`.

## Structure

| Directory | Tool | Notes |
|-----------|------|-------|
| `fish/` | Fish shell | Primary shell; uses `pure` prompt via Fisher |
| `zsh/` | Zsh | Legacy; kept for reference |
| `nvim/` | Neovim | AstroNvim v6+ with Lazy.nvim |
| `tmux/` | Tmux | Modular: `conf.d/{opts,keybindings,theme}.conf` |
| `ghostty/` | Ghostty terminal | Maple Mono NF CN font, One Dark Pro theme |
| `git/` | Git | Delta pager, 1Password SSH signing |
| `brewfile` | Homebrew | Single source of truth for all packages |

## Neovim

Built on **AstroNvim v6+**. Plugin customizations live in `nvim/.config/nvim/lua/plugins/`. The lock file `lazy-lock.json` pins exact plugin versions — update it intentionally with `:Lazy update` inside nvim.

Linting configs at repo root (`selene.toml`, `.stylua.toml`, `.luarc.json`, `.neoconf.json`) apply to the nvim Lua files themselves.

## Homebrew

`brewfile` is the authoritative list of all installed packages (taps, brews, casks, go installs, cargo installs, npm packages). To apply changes:

```sh
brew bundle --file=brewfile
```

To update the brewfile to match current system state:

```sh
brew bundle dump --file=brewfile --force
```

## Git Conventions

- Commit style: `type: description` (e.g. `feat:`, `chore:`, `fix:`)
- Git signs commits via 1Password SSH agent (key: ED25519)
- Default branch is `main`; this repo uses `master`

## Theme Consistency

One Dark Pro (`onedarkpro_onedark`) is used across all tools: Neovim (`theme.lua`), Tmux (`conf.d/theme.conf`), Fish (`onedarkpro_onedark.fish`), and Ghostty config.

## Key Keybinding Patterns

Consistent vim-style navigation (`hjkl`) across Tmux panes and Ghostty splits. Ghostty uses `Ctrl+A` as prefix for split management. Tmux prefix is `Ctrl+B`.

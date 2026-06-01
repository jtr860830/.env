# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal system configuration repository for macOS (ARM). Managed entirely with **nix-darwin + home-manager**. Repo lives at `~/.config/env`. No stow, no brewfile.

## Structure

| Path | Purpose |
|------|---------|
| `flake.nix` | Entry point; defines `darwinConfigurations."pro-darwin"` |
| `darwin/` | macOS system-level config (system defaults, homebrew, security) |
| `home/` | home-manager modules (fish, git, tmux, ghostty, ssh, neovim, packages) |
| `nvim/` | Neovim config (AstroNvim v6+); symlinked to `~/.config/nvim` via home-manager |

## Applying Changes

```sh
darwin-rebuild switch --flake ~/.config/env
```

## Nix Quirks

- `environment.shells = [ pkgs.fish ]` is **required** alongside `programs.fish.enable = true` — nix-darwin does not auto-add fish to `/etc/shells`
- Touch ID for sudo: `security.pam.services.sudo_local.touchIdAuth = true`
- nvim is symlinked via `mkOutOfStoreSymlink` (temporary until nvim is fully nix-managed): `home/neovim.nix`

## Neovim

Built on **AstroNvim v6+** with Lazy.nvim. Plugin customizations live in `nvim/lua/plugins/`. Linting configs (`selene.toml`, `.stylua.toml`, `.luarc.json`, `.neoconf.json`) are at `nvim/`.

Update plugins intentionally with `:Lazy update` inside nvim (updates `nvim/lazy-lock.json`).

## Homebrew

Casks and Mac App Store apps are declared in `darwin/homebrew.nix`. `cleanup = "zap"` is intentional — removes anything not listed.

## Git Conventions

- Commit style: `type: description` (e.g. `feat:`, `chore:`, `fix:`)
- Git signs commits via 1Password SSH agent (ED25519)
- Default branch is `main`; this repo uses `master`

## Theme Consistency

One Dark Pro (`onedarkpro_onedark`) across all tools: Neovim (`nvim/lua/plugins/theme.lua`), Tmux (inline in `home/tmux.nix`), Fish (inline in `home/fish.nix`), Ghostty (`home/ghostty.nix`).

## Key Keybinding Patterns

Consistent vim-style navigation (`hjkl`) across Tmux panes and Ghostty splits. Ghostty uses `Ctrl+A` as prefix. Tmux prefix is `Ctrl+B`.

## Tmux Quirks

- tmux plugins that patch `status-left`/`status-right`: settings must be in the plugin's `extraConfig`, not main `extraConfig` — plugin reads them at `run-shell` time
- Mode detection without plugins: `#{?client_prefix,...}` and `#{?pane_in_mode,...}` are built-in tmux format strings
- `set -g set-clipboard on` enables OSC 52 clipboard sync (replaces yank plugin; requires terminal support e.g. Ghostty)
- `status-justify absolute-centre` centers window list by terminal width; `centre` centers between left/right content

## Cross-Platform Nix Patterns

- Platform conditionals: `if pkgs.stdenv.isDarwin then ... else ...`
- Conditional lists: `lib.optionals pkgs.stdenv.isDarwin [ ... ]`
- 1Password SSH sign path: macOS `/Applications/1Password.app/Contents/MacOS/op-ssh-sign`, Linux `/opt/1Password/op-ssh-sign`

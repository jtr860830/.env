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
| `nvim/` | Neovim config (custom minimal, fully nix-managed via `programs.neovim`) |

## Applying Changes

```sh
darwin-rebuild switch --flake ~/.config/env
```

## Nix Quirks

- `environment.shells = [ pkgs.fish ]` is **required** alongside `programs.fish.enable = true` — nix-darwin does not auto-add fish to `/etc/shells`
- Touch ID for sudo: `security.pam.services.sudo_local.touchIdAuth = true`
- Nix flakes only include git-tracked files — must `git add` new files before rebuild

## Neovim

Custom minimal config managed by `programs.neovim` in `home/neovim.nix`. No Lazy.nvim — plugins installed via `programs.neovim.plugins` (uses nixpkgs vimPlugins, placed in packpath).

- `initLua = builtins.readFile ../nvim/init.lua` — entry point
- `xdg.configFile."nvim/lua".source = ../nvim/lua` — Lua modules sourced from repo; **requires rebuild to update**
- Plugins land in `~/.local/share/nvim/site/pack/hm/start/` (picked up by default packpath)

### LSP (neovim 0.11+ API)

Uses `vim.lsp.config` + `vim.lsp.enable` — no `require("lspconfig")` needed. nvim-lspconfig provides `lsp/` directory configs read automatically by `vim.lsp.enable`.

```lua
vim.lsp.config("*", { capabilities = ... })   -- global config
vim.lsp.config("lua_ls", { settings = ... })  -- per-server override
vim.lsp.enable { "gopls", "ts_ls", ... }
```

### LspAttach Patterns

When registering buffer-local autocmds inside `LspAttach`, always use a per-buffer augroup to prevent stacking when multiple LSP clients attach to the same buffer:

```lua
local hint_group = vim.api.nvim_create_augroup("UserLspInlayHints_" .. bufnr, { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", { group = hint_group, buffer = bufnr, ... })
```

### Neovim 0.12 API Patterns

- `client:supports_method("textDocument/inlayHint")` — colon syntax (dot deprecated)
- `vim.diagnostic.jump({ count = ±1 })` — replaces deprecated `goto_prev/next`
- `vim.diagnostic.count(0)` — efficient per-buffer count
- `vim.treesitter.start()` via FileType autocmd — nvim-treesitter 0.10+ removed configs module
- `vim.fs.root(0, { ".git", ... })` — find project root without shell spawn

### Nerd Font Icons

The Edit tool cannot reliably embed nerd font unicode characters — they silently become spaces. Use `vim.fn.nr2char(codepoint)` instead:

```lua
vim.fn.nr2char(0xea87)  -- Codicon error
vim.fn.nr2char(0xea6c)  -- Codicon warning
vim.fn.nr2char(0xea74)  -- Codicon info
vim.fn.nr2char(0xea61)  -- Codicon lightbulb
```

## Homebrew

Casks and Mac App Store apps are declared in `darwin/homebrew.nix`. `cleanup = "zap"` is intentional — removes anything not listed.

## Git Conventions

- Commit style: `type: description` (e.g. `feat:`, `chore:`, `fix:`)
- Git signs commits via 1Password SSH agent (ED25519)
- Default branch is `main`; this repo uses `master`

## Theme Consistency

One Dark Pro (`onedarkpro_onedark`) across all tools: Neovim (`nvim/lua/theme.lua`), Tmux (inline in `home/tmux.nix`), Fish (inline in `home/fish.nix`), Ghostty (`home/ghostty.nix`).

### onedarkpro Colors

Access palette via `require("onedarkpro.helpers").get_colors()`. Key colors:

- `c.bg_statusline` (`#22262d`) — statusline/tmux bar background
- `c.selection` (`#414858`) — selection/highlight background
- `c.fg_gutter` (`#3d4350`) — pane borders, dim separators
- `c.indentline` (`#3b4048`) — static indent guide lines

Tmux colors must be set manually (no Lua access) — align with palette values above.

### onedarkpro Plugin Integrations

Enable in `setup()` to let theme manage highlight groups:

```lua
plugins = { blink_cmp = true, mini_diff = true, mini_icons = true, snacks = true, nvim_lsp = true, treesitter = true }
```

## Key Keybinding Patterns

Consistent vim-style navigation (`hjkl`) across Tmux panes and Ghostty splits. Ghostty uses `Ctrl+A` as prefix. Tmux prefix is `Ctrl+B`.

Ghostty requires `macos-option-as-alt = true` (set under `lib.optionalString pkgs.stdenv.isDarwin`) for `<A-*>` keybindings to work in Neovim on macOS — without it, Option sends special characters instead.

## Tmux Quirks

- Mode detection without plugins: `#{?client_prefix,...}` and `#{?pane_in_mode,...}` are built-in tmux format strings
- `set -g set-clipboard on` enables OSC 52 clipboard sync (replaces yank plugin; requires terminal support e.g. Ghostty)
- `status-justify absolute-centre` centers window list by terminal width; `centre` centers between left/right content
- `#{client_user}` (tmux 3.4+) replaces `#(whoami)` — built-in, no shell spawn
- `#[fg=...]` attributes inside `#{?condition,...}` conditionals can fail to parse; place them outside the conditional instead
- `#{==:#{session_windows},1}` to detect single-window sessions (e.g. hide window list)

## Fish Color Variables

Valid fish color variables (fish 4.x): `fish_color_{normal,command,keyword,quote,redirection,end,option,error,param,comment,selection,search_match,operator,escape,autosuggestion,cwd,user,host,valid_path,prefix,history_current,status}`. Note: `fish_color_history_current_command`, `fish_color_history_duration`, and `fish_color_error_background` do NOT exist.

### pure.fish Colors

pure.fish uses `pure_color_*` variables set with `(set_color $hex)` syntax. Base colors cascade to derived ones — only override what deviates from the semantic base:

```fish
set -g pure_color_primary (set_color $blue)    # CWD path, ❯ on success (via pure_color_prompt_on_success)
set -g pure_color_success (set_color $green)   # prompt ❯ success state, clean git
set -g pure_color_danger  (set_color $red)     # prompt ❯ error state
set -g pure_color_warning (set_color $yellow)  # command duration, AWS profile
set -g pure_color_info    (set_color $cyan)    # git stash/upstream, k8s prefix
set -g pure_color_mute    (set_color $comment) # SSH hostname, username
set -g pure_color_normal  (set_color $foreground)
# Override derived colors that default to pure_color_mute (too dim):
set -g pure_color_git_branch (set_color $cyan)
set -g pure_color_git_dirty  (set_color $yellow)
```

### EZA Colors

`EZA_COLORS` uses the same format as `LS_COLORS`: `key=attrs:key=attrs:...`. Use truecolor ANSI codes (`38;2;R;G;B`), `2;38;2;R;G;B` for dim variants. Set via `builtins.concatStringsSep ":" [...]` in `home.sessionVariables` for readability. Key names: `di` (dir), `ln` (symlink), `ex` (executable), `or` (broken symlink), `da` (date), `sn`/`sb` (size number/unit), `hd` (header), `ur`/`uw`/`ux` (user perms), `gr`/`gw`/`gx` (group perms, use dim), `ga`/`gm`/`gd`/`gv`/`gt` (git added/modified/deleted/renamed/type).

### snacks.nvim

Used for indent guides (`snacks.indent`) and word highlighting (`snacks.words`), replacing vim-illuminate and indent-blankline-nvim. Both modules are modular — only enabled via `setup()`. onedarkpro `snacks = true` manages `SnacksIndent`/`SnacksIndentScope` highlight groups automatically.

### fzf-lua Colors

`fzf_colors = true` in `fzf.setup {}` auto-syncs all fzf UI colors (selection, highlights, prompt, border) from Neovim's current highlight groups — onedarkpro is picked up automatically.

## Terminfo

Managed via `pkgs.ncurses` in nix — no manual `~/.local/share/terminfo/` needed. Set in `home/fish.nix`:

```nix
TERMINFO_DIRS = "${pkgs.ncurses}/share/terminfo";
```

Referencing `${pkgs.ncurses}` in a nix expression automatically includes it in the closure — no need to add it to `home.packages`.

## Cross-Platform Nix Patterns

- Platform conditionals: `if pkgs.stdenv.isDarwin then ... else ...`
- Conditional lists: `lib.optionals pkgs.stdenv.isDarwin [ ... ]`
- 1Password SSH sign path: macOS `/Applications/1Password.app/Contents/MacOS/op-ssh-sign`, Linux `/opt/1Password/op-ssh-sign`

## Formatters

- Lua: `stylua` (config at `nvim/.stylua.toml`)
- Nix: `nixfmt` (`nix run nixpkgs#nixfmt -- <files>`)

conform is configured without `format_on_save` — format manually with `<leader>cf`.

## Keymap Organisation

Keymaps are split across files by dependency:

- `keymaps.lua` — global keymaps. Plugin keymaps can also live here if they use a lazy `require` inside a function wrapper (the `require` runs at keypress time, not at startup):
  ```lua
  map("n", "<leader>cf", function() require("conform").format { lsp_format = "fallback" } end, ...)
  ```
- `fzf.lua` — fzf keymaps (uses top-level `local fzf = require "fzf-lua"`, so must stay with setup)
- `lsp.lua` LspAttach — buffer-local LSP keymaps (`gd`, `gr`, `K`, etc.), registered only when a client attaches

mini.clue group labels are declared in `clues` to show prefix descriptions at the first level:

```lua
{ mode = "n", keys = "<leader>f", desc = "+find" },
{ mode = "n", keys = "<leader>c", desc = "+code" },
```

Current groups: `<leader>c` (+code), `<leader>f` (+find). Window/buffer/split keymaps are intentionally absent — terminal (tmux) handles that workflow.

`<leader>c` contains: `ca` (code action), `cd` (diagnostic float), `cf` (format), `cr` (rename), `ct` (type definition). Conventional vim LSP keys (`gd`, `gD`, `gr`, `gi`, `K`) and bracket navigation (`[d`/`]d`) stay outside the group.

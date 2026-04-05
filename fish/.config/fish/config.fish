# Path
set PATH "/usr/local/bin" "/usr/local/sbin" "/usr/bin" "/usr/sbin" "/bin" "/sbin"

# XDG base directory
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx XDG_RUNTIME_DIR "$HOME/.local/run"

# General
set -gx LANG "en_US.UTF-8"
set -gx VISUAL "nvim"
set -gx EDITOR $VISUAL
set -gx MANPAGER "nvim +Man!"
set -gx TERMINFO "$XDG_DATA_HOME/terminfo"

# Homebrew
set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
set -gx MANPATH "/opt/homebrew/share/man" $MANPATH
set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH

# Node.js
set -gx NODE_REPL_HISTORY "$XDG_DATA_HOME/node_repl_history"
set -gx COREPACK_HOME "$XDG_DATA_HOME/corepack"
set -gx NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"

# Golang
set -gx GOPATH "$XDG_DATA_HOME/go"
set -gx GOBIN "$GOPATH/bin"

# Rust
set -gx RUSTUP_HOME "$XDG_DATA_HOME/rustup"
set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"

# Wget
set -gx WGETRC "$XDG_CONFIG_HOME/wgetrc"

# SSH
set -gx SSH_AUTH_SOCK "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# Bat
set -gx BAT_THEME "TwoDark"

# Docker
set -gx DOCKER_CONFIG "$XDG_CONFIG_HOME/docker"

# Kubernetes
set -gx KUBECONFIG "$XDG_CONFIG_HOME/kube"
set -gx KUBECACHEDIR "$XDG_CACHE_HOME/kube"

# Tart
set -gx TART_HOME "$XDG_CACHE_HOME/tart"

# Claude
set -gx CLAUDE_CONFIG_DIR "$XDG_CONFIG_HOME/claude"

# Additional path
fish_add_path -g "/opt/homebrew/bin" "/opt/homebrew/sbin";
fish_add_path -g "$HOME/.local/bin"
fish_add_path -g "$GOBIN"
fish_add_path -g "$CARGO_HOME/bin"

# Abbreviations
abbr -a vi  nvim
abbr -a vim nvim

if status is-interactive
  # zoxide
  zoxide init fish | source
  # init starship prompt
  starship init fish | source
  # load theme
  source $XDG_CONFIG_HOME/fish/themes/onedarkpro_onedark.fish
end

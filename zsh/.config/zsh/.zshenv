# General
export LANG="en_US.UTF-8"
export VISUAL="nvim"
export EDITOR=$VISUAL
export MANPAGER="nvim +Man!"

# XDG base directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="$HOME/.local/run"

# Homebrew
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";

# Node.js
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export COREPACK_HOME="$XDG_DATA_HOME/corepack"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

# Golang
export GOPATH="$XDG_DATA_HOME/go"
export GOBIN="$GOPATH/bin"

# Rust
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# SSH
export SSH_AUTH_SOCK="~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# Wget
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

# Terminal
export TERMINFO="$XDG_DATA_HOME/terminfo"

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# Kubernetes
export KUBECONFIG="$XDG_CONFIG_HOME/kube"
export KUBECACHEDIR="$XDG_CACHE_HOME/kube"

# Vagrant
export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"
export VAGRANT_DEFAULT_PROVIDER="parallels"

# Tart
export TART_HOME="$XDG_CACHE_HOME/tart"

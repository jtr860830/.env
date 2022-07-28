# Node.js
set -x N_PREFIX $HOME/.local
set -x COREPACK_HOME $XDG_DATA_HOME/corepack
set -x NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc

# Golang
set -x GOPATH $XDG_DATA_HOME/go
set -x GOBIN $GOPATH/bin
set fish_user_paths $GOBIN $fish_user_paths

# Rust
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup
set -x CARGO_HOME $XDG_DATA_HOME/cargo
set fish_user_paths $CARGO_HOME/bin $fish_user_paths

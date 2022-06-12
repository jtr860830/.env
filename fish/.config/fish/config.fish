# General
set LANG en_US.UTF-8
set VISUAL lvim
set EDITOR $VISUAL

# Path
set PATH /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin
set fish_user_paths $HOME/.local/bin

# Homebrew
set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
set -q PATH; or set PATH ''; set -gx PATH "/opt/homebrew/bin" "/opt/homebrew/sbin" $PATH;
set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;

# XDG base directory
set -Ux XDG_CONFIG_HOME $HOME/.config
set -Ux XDG_CACHE_HOME $HOME/.cache
set -Ux XDG_DATA_HOME $HOME/.local/share

# terminfo
set -Ux TERMINFO $XDG_DATA_HOME/terminfo

# Golang
set -x GOPATH $XDG_DATA_HOME/go
set -x GOBIN $GOPATH/bin
set fish_user_paths $GOBIN $fish_user_paths

# Rust
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup
set -x CARGO_HOME $XDG_DATA_HOME/cargo
set fish_user_paths $CARGO_HOME/bin $fish_user_paths

# Node.js
set -x N_PREFIX $HOME/.local
set -x COREPACK_HOME $XDG_DATA_HOME/corepack
set -x NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc

# SSH
set -x SSH_AUTH_SOCK ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# Docker
set -x DOCKER_CONFIG $XDG_CONFIG_HOME/docker

# HTTPie
set -x HTTPIE_CONFIG_DIR $XDG_CONFIG_HOME/httpie

# Vagrant
set -x VAGRANT_HOME $XDG_DATA_HOME/vagrant
set -x VAGRANT_ALIAS_FILE $XDG_DATA_HOME/vagrant/aliases

# Alias
alias ls=lsd
alias ll="lsd -l"
alias la="lsd -la"
alias vi=lvim
alias vim=lvim

# init zoxide
zoxide init fish | source

# init prompt
starship init fish | source

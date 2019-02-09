# Language
export LANG=en_US.UTF-8

# Editor
export VISUAL=vim
export EDITOR=$VISUAL

# GNU core and tools
PATH=/usr/local/opt/binutils/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH
MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH

# Dotnet
PATH=~/.dotnet/tools:/usr/local/share/dotnet:$PATH

# Ruby
PATH=/usr/local/opt/ruby/bin:$PATH

# Rust
PATH=$HOME/.cargo/bin:$PATH

# Golang
export GOPATH=~/.go
export GOBIN=$GOPATH/bin
PATH=$GOBIN:$PATH

# Export unique Paths
export -U PATH
export -U MANPATH

# Alias
alias ls="exa --group-directories-first"
alias vi=nvim
alias vim=nvim
alias ssh="TERM=xterm-256color ssh"

# Language
export LANG=en_US.UTF-8

# Editor
export VISUAL=vim
export EDITOR=$VISUAL

# GNU core and tools
export PATH=/usr/local/opt/binutils/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH

# Dotnet
export PATH=~/.dotnet/tools:/usr/local/share/dotnet:$PATH

# Ruby
export PATH=/usr/local/opt/ruby/bin:$PATH

# Rust
export PATH=$HOME/.cargo/bin:$PATH

# Golang
export GOPATH=~/.go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

# Alias
alias ls="exa --group-directories-first"
alias vi=nvim
alias vim=nvim
alias ssh="TERM=xterm-256color ssh"

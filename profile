# Terminal
export TERM="xterm-256color-italic"

# Language
export LANG="en_US.UTF-8"

# Editor
export VISUAL="vim"
export EDITOR="$VISUAL"

# GNU core
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# GNU MANPATH
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Golang
export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"

# Alias
alias ls="ls --group-directories-first --color=auto"
alias vi="nvim"
alias vim="nvim"
alias ssh="TERM=xterm-256color ssh"

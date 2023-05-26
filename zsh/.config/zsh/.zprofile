# Default PATH
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin";

# Homebrew
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

# Golang
PATH="$GOBIN:$PATH"

# Rust
PATH="$CARGO_HOME/bin:$PATH"

# User
PATH="$HOME/.local/bin:$HOME/.local/sbin:$PATH"

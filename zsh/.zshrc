### Init zinit
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Vi-mode
bindkey -v

# Powerlevel9k configuration
source $ZCUSTOM_HOME/p10k.zsh
zinit ice depth"1"
zinit light romkatv/powerlevel10k

# Completions
zinit ice blockf
zinit light zsh-users/zsh-completions

# Autosuggestions
zinit load zsh-users/zsh-autosuggestions

# History substring search
zinit load zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Fast syntax highlighting
zinit load zdharma-continuum/fast-syntax-highlighting

# FZF
zinit ice as"completion"
zinit snippet https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh
zinit snippet https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh

# Compinit
source $ZCUSTOM_HOME/zstyle-completion
bindkey "${terminfo[kcbt]}" reverse-menu-complete
autoload -Uz compinit
compinit -d $XDG_DATA_HOME/zsh/zcompdump

# Z.lua
export _ZL_DATA=$XDG_DATA_HOME/zsh/z
zinit load skywind3000/z.lua

# Developer
## Python
export PYENV_ROOT=$XDG_DATA_HOME/pyenv
PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

## Node
export NODENV_ROOT=$XDG_DATA_HOME/nodenv
PATH=$NODENV_ROOT/bin:$PATH
eval "$(nodenv init -)"

## Golang
export GOPATH=$XDG_DATA_HOME/go
export GOBIN=$GOPATH/bin
PATH=$GOBIN:$PATH

## Rust
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export CARGO_HOME=$XDG_DATA_HOME/cargo
PATH=$CARGO_HOME/bin:$PATH

# Alias
alias sudo="sudo "
alias ls=lsd
alias ll="lsd -l"
alias la="lsd -la"
alias vi=lvim
alias vim=lvim

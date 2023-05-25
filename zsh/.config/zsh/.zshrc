# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zap-zsh/supercharge"
plug "zap-zsh/completions"
plug "zdharma-continuum/fast-syntax-highlighting"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-history-substring-search"
plug "hlissner/zsh-autopair"

# Load and initialise completion system
bindkey "${terminfo[kcbt]}" reverse-menu-complete
autoload -Uz compinit
compinit

# Init zoxide
eval "$(zoxide init zsh)"

# Init starship prompt
eval "$(starship init zsh)"

# Alias
alias ls=lsd
alias vi=nvim
alias vim=nvim

source $ZDOTDIR/modules/zi.zsh
source $ZDOTDIR/modules/opts.zsh
source $ZDOTDIR/modules/aliases.zsh

# Init zoxide
eval "$(zoxide init zsh --cmd c)"

# Init starship prompt
eval "$(starship init zsh)"

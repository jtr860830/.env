# Source powerlevel9k configuration
source ~/.config/env/powerlevel9k

# Plugin manager
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

  # Plugins
  zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
  zplug "zsh-users/zsh-completions"
  zplug "zsh-users/zsh-autosuggestions"
  zplug "zsh-users/zsh-history-substring-search"
  zplug "zdharma/fast-syntax-highlighting"
  zplug "hlissner/zsh-autopair", defer:2

  # Install plugins if there are plugins that have not been installed
  if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
      echo; zplug install
    fi
  fi

# Source plugins
zplug load --verbose
# End plugin manager

# Source my environment
source ~/.config/env/profile

# Vi-mode
bindkey -v

# Command history
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.backup/zhistory

# Source completion zstyle
source ~/.config/zshell/zstyle-completion

# zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# zsh-autopair
autopair-init

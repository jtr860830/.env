# Source powerlevel9k configuration
source ~/.config/env/powerlevel9k

# Plugin manager
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# Plugins
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

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

# Homebrew
export HOMEBREW_GITHUB_API_TOKEN="c6ee8af2fa4f74daec7200b4f6d7c3f3a3a2b7b8"

# Source completion zstyle
source ~/.config/zshell/zstyle-completion

# zsh-history-substring-search key
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

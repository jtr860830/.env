# General
set LANG en_US.UTF-8
set VISUAL nvim
set EDITOR $VISUAL

# Path
set PATH /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin
set fish_user_paths $HOME/.local/bin

# XDG base directory
set -Ux XDG_CONFIG_HOME $HOME/.config
set -Ux XDG_CACHE_HOME $HOME/.cache
set -Ux XDG_DATA_HOME $HOME/.local/share
set -Ux XDG_STATE_HOME $HOME/.local/state

# terminfo
set -Ux TERMINFO $XDG_DATA_HOME/terminfo

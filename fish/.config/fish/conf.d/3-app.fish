# SSH
set -x SSH_AUTH_SOCK ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# man-pages
set -x MANPAGER "lvim +Man!"

# Docker
set -x DOCKER_CONFIG $XDG_CONFIG_HOME/docker

# HTTPie
set -x HTTPIE_CONFIG_DIR $XDG_CONFIG_HOME/httpie

# Vagrant
set -x VAGRANT_HOME $XDG_DATA_HOME/vagrant
set -x VAGRANT_ALIAS_FILE $XDG_DATA_HOME/vagrant/aliases

# zoxide
zoxide init fish | source

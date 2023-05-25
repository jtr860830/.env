# SSH
set -x SSH_AUTH_SOCK ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# man-pages
set -x MANPAGER "nvim +Man!"

# Docker
set -x DOCKER_CONFIG $XDG_CONFIG_HOME/docker

# zoxide
zoxide init fish | source

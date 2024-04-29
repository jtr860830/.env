# initialize znap
ZPLUGINS_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zsh/plugins"
[[ -r $ZPLUGINS_HOME/znap/znap.zsh ]] ||
  git clone --depth 1 -- \
    https://github.com/marlonrichert/zsh-snap.git $ZPLUGINS_HOME/znap
source $ZPLUGINS_HOME/znap/znap.zsh

# setup plugins
znap source zdharma-continuum/fast-syntax-highlighting
znap source zsh-users/zsh-autosuggestions
znap source marlonrichert/zsh-autocomplete
znap source marlonrichert/zsh-edit
znap source marlonrichert/zcolors
znap source ajeetdsouza/zoxide

znap eval zcolors "zcolors ${(q)LS_COLORS}"
znap eval starship "starship init zsh --print-full-init"
znap prompt

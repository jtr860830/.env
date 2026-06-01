{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    mouse = true;
    baseIndex = 1;
    terminal = "tmux-256color";

    extraConfig = ''
      set -as terminal-overrides ",xterm*:RGB"
      setw -g pane-base-index 1
      set -g renumber-windows on
      set -g set-titles on
      set -g escape-time 0
      set -g focus-events on
      set -g set-clipboard on

      # Keybindings
      bind-key a send-prefix
      bind r source-file "$XDG_CONFIG_HOME/tmux/tmux.conf"
      bind w kill-window
      bind - split-window -v
      bind | split-window -h
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      bind -n S-Enter send-keys Escape "[13;2u"

      # Theme
      set -g status-position bottom
      set -g status-style          "bg=#23272e"
      set -g message-style         "bg=#61afef,fg=#2e323b"
      set -g mode-style            "bg=#3e4452"
      set -g status-left           ""
      set -g status-right          "#[fg=#5c6370] #S "
      setw -g window-status-separator    "  "
      setw -g window-status-format         "#[fg=#5c6370]#I:#W"
      setw -g window-status-current-format "#[fg=#abb2bf,bold]#I:#W"
    '';
  };
}

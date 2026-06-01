{ ... }: {
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
      set -g history-limit 50000

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
      set -g status-position       bottom
      set -g status-justify        absolute-centre
      set -g status-style          "bg=#23272e"
      set -g message-style         "bg=#61afef,fg=#23272e"
      set -g mode-style            "bg=#3e4452,fg=#abb2bf"

      set -g status-left-length    30
      set -g status-left           "#[fg=#c678dd,bold] #S "
      set -g status-right          ""

      set -g pane-border-style        "fg=#3e4452"
      set -g pane-active-border-style "fg=#61afef"

      setw -g window-status-separator    " "
      setw -g window-status-format         " #[fg=#5c6370]#I "
      setw -g window-status-current-format "#[bg=#3e4452] #[bold,fg=#56b6c2]#I #[fg=#abb2bf]#W #[default]"
    '';
  };
}

{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    mouse = true;
    baseIndex = 1;
    terminal = "tmux-256color";

    plugins = with pkgs.tmuxPlugins; [
      open
      {
        plugin = yank;
        extraConfig = "set -g @yank_with_mouse on";
      }
      tmux-fzf
      {
        plugin = mode-indicator;
        extraConfig = ''
          set -g @mode_indicator_empty_prompt  " 󰕷 "
          set -g @mode_indicator_empty_mode_style  "bg=#98c379,fg=#282c34"
          set -g @mode_indicator_prefix_prompt " 󰌌 "
          set -g @mode_indicator_prefix_mode_style "bg=#c678dd,fg=#282c34"
          set -g @mode_indicator_copy_prompt   "  "
          set -g @mode_indicator_copy_mode_style   "bg=#e5c07b,fg=#282c34"
          set -g @mode_indicator_sync_prompt   " 󰓦 "
          set -g @mode_indicator_sync_mode_style   "bg=#61afef,fg=#282c34"
        '';
      }
    ];

    extraConfig = ''
      set -as terminal-overrides ",xterm*:RGB"
      setw -g pane-base-index 1
      set -g renumber-windows on
      set -g set-titles on
      set -g escape-time 0
      set -g focus-events on

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
      set -g status-justify centre
      set -g status-position bottom
      set -g status-left-length 90
      set -g status-right-length 90
      set -g status-style                "bg=#23272e"
      set -g mode-style                  bg=#3e4452
      set -g message-style               bg=#61afef,fg=#2e323b
      setw -g window-status-separator    "   "
      set-window-option -g mode-style    bg=#c678dd,fg=#2e323b
      set -g status-left                 "#{tmux_mode_indicator}"
      set -g status-right                "#[fg=#5c6370]#S #{tmux_mode_indicator}"
      setw -g window-status-format         "#[fg=#5c6370,italics]#I: #[noitalics]#W"
      setw -g window-status-current-format "#[fg=#c678dd,italics]#I: #[fg=#939aa3,noitalics,bold]#W"
    '';
  };
}

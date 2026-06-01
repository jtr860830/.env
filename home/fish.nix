{ pkgs, config, ... }: {
  programs.fish = {
    enable = true;

    plugins = [
      { name = "pure"; src = pkgs.fishPlugins.pure.src; }
    ];

    functions = {
      fish_greeting = "";
      ls   = "eza --icons=auto --color=auto $argv";
      rm   = ''echo "Use 'rip' instead of rm. If you really need rm, use 'command rm'."'';
      wget = ''command wget --hsts-file="$XDG_CACHE_HOME/wget-hsts" $argv'';
    };

    interactiveShellInit = ''
      if not set -q TMUX
        tmux new-session -A -s main
      end

      set -gx PATH \
        ${config.home.homeDirectory}/.local/bin \
        ${config.xdg.dataHome}/go/bin \
        ${config.xdg.dataHome}/cargo/bin \
        /etc/profiles/per-user/${config.home.username}/bin \
        /nix/var/nix/profiles/default/bin \
        /usr/local/bin \
        /usr/bin \
        /bin \
        /usr/sbin \
        /sbin

      fish_vi_key_bindings
      zoxide init fish | source

      # One Dark Pro colors
      set -l foreground abb2bf
      set -l selection  414858
      set -l comment    5c6370
      set -l red        e06c75
      set -l orange     d19a66
      set -l yellow     e5c07b
      set -l green      98c379
      set -l blue       61afef
      set -l purple     c678dd
      set -l cyan       56b6c2

      set -g fish_color_normal            $foreground
      set -g fish_color_command           $cyan
      set -g fish_color_keyword           $purple
      set -g fish_color_quote             $yellow
      set -g fish_color_redirection       $foreground
      set -g fish_color_end               $orange
      set -g fish_color_option            $yellow
      set -g fish_color_error             $red
      set -g fish_color_param             $blue
      set -g fish_color_comment           $comment
      set -g fish_color_selection         --background=$selection
      set -g fish_color_search_match      --background=$selection
      set -g fish_color_operator          $foreground
      set -g fish_color_escape            $purple
      set -g fish_color_autosuggestion    $comment
      set -g fish_color_cwd               $cyan
      set -g fish_color_user              $purple
      set -g fish_color_host              $orange
      set -g fish_color_valid_path        $green
      set -g fish_color_prefix            $blue
      set -g fish_color_history_current_command $yellow
      set -g fish_color_history_duration  $comment
      set -g fish_color_error_background  --background=$red

      set -g fish_pager_color_progress             $comment
      set -g fish_pager_color_prefix               $cyan
      set -g fish_pager_color_completion           $foreground
      set -g fish_pager_color_description          $comment
      set -g fish_pager_color_selected_background  --background=$selection
    '';
  };

  home.sessionVariables = {
    LANG     = "en_US.UTF-8";
    TERMINFO = "${config.xdg.dataHome}/terminfo";

    NODE_REPL_HISTORY     = "${config.xdg.dataHome}/node_repl_history";
    COREPACK_HOME         = "${config.xdg.dataHome}/corepack";
    NPM_CONFIG_USERCONFIG = "${config.xdg.configHome}/npm/npmrc";

    GOPATH = "${config.xdg.dataHome}/go";
    GOBIN  = "${config.xdg.dataHome}/go/bin";

    RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
    CARGO_HOME  = "${config.xdg.dataHome}/cargo";

    WGETRC        = "${config.xdg.configHome}/wgetrc";
    BAT_THEME     = "TwoDark";
    DOCKER_CONFIG = "${config.xdg.configHome}/docker";
    KUBECONFIG    = "${config.xdg.configHome}/kube";
    KUBECACHEDIR  = "${config.xdg.cacheHome}/kube";
    LIMA_HOME     = "${config.xdg.dataHome}/lima";
    TART_HOME     = "${config.xdg.cacheHome}/tart";

    CLAUDE_CONFIG_DIR = "${config.xdg.configHome}/claude";
    SSH_AUTH_SOCK = if pkgs.stdenv.isDarwin
      then "${config.home.homeDirectory}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
      else "${config.home.homeDirectory}/.1password/agent.sock";
  };
}

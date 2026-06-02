{ ... }: {
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
      extraFlags = [ "--force-cleanup" ];
    };

    casks = [
      "1password"
      "burp-suite"
      "claude"
      "dash"
      "discord"
      "element"
      "firefox"
      "ghostty"
      "google-chrome"
      "iina"
      "k6-studio"
      "keyboardcleantool"
      "rustdesk"
      "slack"
      "tailscale-app"
      "telegram"
      "wireshark-app"
      "zed"
    ];

    masApps = {
      "1Password for Safari" = 1569813296;
      "Dropover" = 1355679052;
      "LINE" = 539883307;
      "Wappalyzer" = 1520333300;
      "Windows App" = 1295203466;
    };
  };
}

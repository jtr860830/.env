{ ... }: {
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";

    casks = [
      "claude"
      "dash"
      "iina"
      "k6-studio"
      "keyboardcleantool"
    ];

    masApps = {
      "1Password for Safari" = 1569813296;
      "Dropover"             = 1355679052;
      "LINE"                 = 539883307;
      "Wappalyzer"           = 1520333300;
      "Windows App"          = 1295203466;
    };
  };
}

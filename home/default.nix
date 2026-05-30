{ ... }: {
  imports = [ ./neovim.nix ./fish.nix ./git.nix ./ssh.nix ./tmux.nix ./packages.nix ./ghostty.nix ];

  home = {
    username = "jtr860830";
    homeDirectory = "/Users/jtr860830";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;

  xdg.enable = true;
}

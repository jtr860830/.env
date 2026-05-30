{ pkgs, ... }: {
  imports = [ ./system.nix ./homebrew.nix ];

  programs.fish.enable = true;
  users.users.jtr860830 = {
    shell       = pkgs.fish;
    description = "Josh Hsieh";
  };

  nixpkgs.config.allowUnfree = true;

  fonts.packages = [ pkgs.maple-mono.MapleMono-NF-CN ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;
}
